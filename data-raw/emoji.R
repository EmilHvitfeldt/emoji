## code to prepare `emoji` dataset goes here

library(tidyverse)
library(stringi)
library(rlang)
library(rvest)
library(xml2)
library(jsonlite)
library(devtools)
library(glue)

download_emoji <- function() {
  if (!file.exists("data-raw/emoji_current")) {
    dir.create("data-raw/emoji_current")
  }
  download.file(
    url = "https://www.unicode.org/emoji/charts-13.1/full-emoji-list.html",
    destfile = "data-raw/emoji_current/full-emoji-list.html"
  )
  download.file(
    url = "https://www.unicode.org/emoji/charts-13.1/emoji-list.html",
    destfile = "data-raw/emoji_current/emoji-list.html"
  )
}

download_tr51 <- function() {
  if (!file.exists("data-raw/tr51")) {
    dir.create("data-raw/tr51")
  }
  download.file("https://www.unicode.org/emoji/charts/emoji-ordering.txt",
                destfile = "data-raw/tr51/emoji-ordering.txt")

  files <- c("emoji-data.txt", "emoji-sequences.txt",
             "emoji-test.txt", "emoji-zwj-sequences.txt")

  walk(files, ~ {
    url <- glue("https://www.unicode.org/Public/emoji/11.0/{file}", file = .x)
    dest <- glue("data-raw/tr51/{file}", file = .x)
    download.file(url, destfile = dest)
  })
}

download_gemoji <- function() {
  if (!file.exists("data-raw/gemoji")) {
    dir.create("data-raw/gemoji")
  }

  download.file(
    url = "https://raw.githubusercontent.com/github/gemoji/master/db/emoji.json",
    destfile = "data-raw/gemoji/gemoji.json"
  )
}

download_emojilib <- function() {
  if (!file.exists("data-raw/emojilib")) {
    dir.create("data-raw/emojilib")
  }
  download.file(
    url = "https://raw.githubusercontent.com/muan/emojilib/main/dist/emoji-en-US.json",
    destfile = "data-raw/emojilib/emoji-en-US.json"
  )
}

download_emoji()
download_tr51()
download_gemoji()
download_emojilib()

test <- read_lines("data-raw/tr51/emoji-test.txt") %>%
  str_subset("^(# (sub)?group:|[^#].*;.*#.*)") %>%
  tibble(txt = .) %>%
  mutate(
    group = case_when(
      str_detect(txt, "# group") ~ str_replace(txt, "^.*:", ""),
      TRUE ~ NA_character_
    ),
    subgroup = case_when(
      str_detect(txt, "# subgroup") ~ str_replace(txt, "^.*:", ""),
      TRUE ~ NA_character_
    )
  ) %>%
  fill(group, subgroup) %>%
  filter(!str_detect(txt, "^#")) %>%
  separate(txt, into = c("runes", "qualified", "description"), sep = "[;#]", extra = "merge") %>%
  mutate_all(str_trim) %>%
  separate(description, sep = " ", into = c("emoji", "name"), extra = "merge")

ordering <- read_lines("data-raw/tr51/emoji-ordering.txt") %>%
  str_subset("^[^#].*;.*#.*") %>%
  tibble(txt = .) %>%
  separate(txt, into = c("runes", "version", "description"), sep = "[;#]", extra = "merge") %>%
  mutate_all(str_trim) %>%
  separate(description, sep = " ", into = c("emoji", "name"), extra = "merge") %>%
  select(-runes, -name)

data1 <- left_join(test, ordering, by = "emoji") %>%
  mutate(
    points = map(str_split(runes, " "), strtoi, base = 16),
    nrunes = map_int(points, length)
  )

vendor_information <- function() {
  table <- read_html("data-raw/emoji_current/full-emoji-list.html") %>%
    html_node("table")

  tr <- table %>%
    html_nodes(xpath = "//tr/td[@class='code']/..")
  sizes <- tr %>% map_int(xml_length)

  vendor <- function(idx = 4) {
    selector <- sprintf("td:nth-child(%d)", idx)
    # not supported by default
    # this civers the merged cells case when no vendor supports the emoji
    out <- rep(FALSE, length(tr))

    # when theree's info for all vendors, the emoji is supported if there's no
    # miss in the node
    out[sizes == 15] <- tr[sizes == 15] %>%
      html_nodes(selector) %>%
      as.character() %>%
      str_detect("miss") %>%
      magrittr::not()
    out
  }

  vendors <- c(
    vendor_apple = 4, vendor_google = 5, vendor_twitter = 6, vendor_one = 7,
    vendor_facebook = 8, vendor_messenger = 9, vendor_samsung = 10, vendor_windows = 11
  ) %>%
    map(vendor) %>%
    bind_cols()

  emojis <- tr %>%
    html_nodes("td:nth-child(2)") %>%
    html_text() %>%
    str_replace_all("U[+]", "") %>%
    str_split(" ") %>%
    map(strtoi, base = 16) %>%
    stri_enc_fromutf32() %>%
    tibble(emoji = .)

  bind_cols(emojis, vendors)
}

vendors <- vendor_information()
data2 <- left_join(data1, vendors, by = "emoji")

keywords_information <- function() {
  html <- read_html("data-raw/emoji_current/emoji-list.html")
  category <- html %>%
    html_nodes("th.bighead") %>%
    html_text()
  subcategory <- html %>%
    html_nodes("th.mediumhead") %>%
    html_text()

  html %>%
    html_node("table") %>%
    html_table(header = FALSE) %>%
    set_names(c("id", "runes", "sample", "name", "keywords")) %>%
    select(-sample) %>%
    # lines not needed
    filter(runes != "Code") %>%
    # expand category
    mutate(category = case_when(id %in% category ~ id, TRUE ~ NA_character_)) %>%
    fill(category) %>%
    filter(id != category) %>%
    # expand sub category
    mutate(subcategory = case_when(id %in% subcategory ~ id, TRUE ~ NA_character_)) %>%
    fill(subcategory) %>%
    filter(id != subcategory) %>%
    mutate(
      keywords = str_split(keywords, " [|] "),
      emoji = str_replace_all(runes, "U[+]", "") %>%
        str_split(" ") %>%
        map(strtoi, base = 16) %>%
        stri_enc_fromutf32()
    ) %>%
    select(emoji, keywords)
}

keywords <- keywords_information()
data3 <- left_join(data2, keywords, by = "emoji")

parse_gemoji <- function() {
  data <- read_json("data-raw/gemoji/gemoji.json")
  keep <- data %>%
    map("emoji") %>%
    map_lgl(negate(is.null))
  data <- data[keep]


  tag_parse <- function(x) {
    if (is.list(x)) flatten_chr(x) else character()
  }

  gemoji <- tibble(
    emoji = map_chr(data, "emoji"),
    aliases = map(data, "aliases") %>% map(flatten_chr),
    tags = map(data, "tags") %>% map(tag_parse),
    unicode_version = map_chr(data, "unicode_version"),
    ios_version = map_chr(data, "ios_version")
  ) %>%
    mutate(unicode_version = ifelse(unicode_version == "", NA, unicode_version)) %>%
    mutate_at(vars(ends_with("version")), as.numeric)

  gemoji
}

merge_names <- function(x, y) {
  all_y <- y[map_lgl(y, negate(is.null))] %>% flatten_chr()
  map2(x, y, ~ unique(c(.y, .x[!.x %in% all_y])))
}

alias_from_name <- function(name) {
  name %>%
    str_replace_all("[Åã]", "a") %>%
    str_replace_all("ç", "c") %>%
    str_replace_all("é", "e") %>%
    str_replace_all("í", "i") %>%
    str_replace_all("ô", "o") %>%
    str_replace_all("[*]", "star") %>%
    str_replace_all("[#]", "hash") %>%
    str_replace_all("[&]", "and") %>%
    str_replace_all("[^0-9a-zA-Z]", "_") %>%
    str_replace_all("_+", "_")
}

gemoji <- parse_gemoji()

data4 <- left_join(data3, gemoji, by = "emoji") %>%
  mutate(keywords = map2(keywords, tags, c)) %>%
  select(-tags) %>%
  mutate(aliases = merge_names(alias_from_name(name), aliases))

all_alias <- flatten_chr(data4$aliases)
emojilib <- read_json("data-raw/emojilib/emoji-en-US.json")
keep <- emojilib %>%
  map("char") %>%
  map_lgl(negate(is.null))

emojilib <- emojilib[keep]
emojilib_tbl <- tibble(
  emoji = emojilib %>% map_chr("char"),
  emojilibname = names(emojilib),
  emojilibkeyword = emojilib %>% map("keywords") %>% map(. %>% flatten_chr())
)

data5 <- left_join(data4, emojilib_tbl, by = "emoji") %>%
  mutate(
    aliases = map2(aliases, emojilibname, ~ {
      res <- c(.x, setdiff(.y, all_alias))
      res[!is.na(res)]
    }),
    keywords = map2(keywords, emojilibkeyword, unique)
  ) %>%
  select(-emojilibname, -emojilibkeyword)

emojis <- data5

use_data(emojis, overwrite = TRUE)

aliases <- emojis %>%
  select(emoji, aliases) %>%
  unnest(cols = c(aliases))

emoji_name <- set_names(aliases$emoji, aliases$aliases)
use_data(emoji_name, overwrite = TRUE)

kw <- select(emojis, keywords, aliases) %>%
  filter(map_int(aliases, length) > 0) %>%
  mutate(
    aliases = map_chr(aliases, 1),
    keywords = map(keywords, ~ data.frame(keywords = ., stringsAsFactors = FALSE))
  ) %>%
  unnest(cols = c(keywords)) %>%
  group_by(keywords) %>%
  summarise(name = list(c(aliases)))

aliases <- unique(flatten_chr(emojis$aliases))
aliases <- aliases[!aliases %in% kw$keywords]

kw <- bind_rows(kw, tibble(keywords = aliases, name = as.list(aliases)))

emoji_keyword <- set_names(kw$name, kw$keywords)
use_data(emoji_keyword, overwrite = TRUE)
