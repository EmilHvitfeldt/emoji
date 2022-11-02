# emoji 15.0

* Package version will now reflect the emoji version set by Unicode.
* Updated data to include Emoji v15.0.
* Added `emoji_modifiers` data set with information about emojis and their modifiers.
* Added `emoji_modifier_extract()` to extract modifiers from emojis. (#8)
* Added `emoji_modifier_remove()` to remove modifiers from emojis. (#7)
* Added `zoo()` to randomly sample animal emojis. (#10)

# emoji 0.2.0

* Updated data to include Emoji v14.0.
* `emoji_name` now includes all aliases.
* Adding `emoji()` and `emoji_find()` which can be used to return emojis based on keywords.
* Added `emoji_fix()` which turns emojis into qualified emojis.
* Added `arrow()`, `clock()`, `flag()`, `keycap()`, `medal()`, `moon()`, and `shape()` serving as shorthand for groups of emojis.
* Added `emoji_glue()` for glue interpolation.

# emoji 0.1.0

* Added a `NEWS.md` file to track changes to the package.
