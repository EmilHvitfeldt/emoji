# fio

<details>

* Version: 0.1.2
* GitHub: https://github.com/albersonmiranda/fio
* Source code: https://github.com/cran/fio
* Date/Publication: 2024-08-27 08:10:06 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::revdep_details(, "fio")` for more info

</details>

## In both

*   checking whether package ‘fio’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/emilhvitfeldt/Github/emoji/revdep/checks.noindex/fio/new/fio.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘fio’ ...
** package ‘fio’ successfully unpacked and MD5 sums checked
** using staged installation
sh: rustc: command not found
Error in value[[3L]](cond) : 
  ----------------------- [RUST NOT FOUND]---------------------------
The 'rustc' compiler was not found on the PATH. Please install
rustc >= 1.67.1 or higher from:
https://www.rust-lang.org/tools/install

Alternatively, you may install Rust from your OS package manager:
 - Debian/Ubuntu: apt-get install rustc
 - Fedora/CentOS: dnf install rustc
 - macOS: brew install rustc
-------------------------------------------------------------------
Calls: tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
Execution halted
ERROR: configuration failed for package ‘fio’
* removing ‘/Users/emilhvitfeldt/Github/emoji/revdep/checks.noindex/fio/new/fio.Rcheck/fio’


```
### CRAN

```
* installing *source* package ‘fio’ ...
** package ‘fio’ successfully unpacked and MD5 sums checked
** using staged installation
sh: rustc: command not found
Error in value[[3L]](cond) : 
  ----------------------- [RUST NOT FOUND]---------------------------
The 'rustc' compiler was not found on the PATH. Please install
rustc >= 1.67.1 or higher from:
https://www.rust-lang.org/tools/install

Alternatively, you may install Rust from your OS package manager:
 - Debian/Ubuntu: apt-get install rustc
 - Fedora/CentOS: dnf install rustc
 - macOS: brew install rustc
-------------------------------------------------------------------
Calls: tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
Execution halted
ERROR: configuration failed for package ‘fio’
* removing ‘/Users/emilhvitfeldt/Github/emoji/revdep/checks.noindex/fio/old/fio.Rcheck/fio’


```
# tabulate

<details>

* Version: 0.1.0
* GitHub: https://github.com/mlverse/tabulate
* Source code: https://github.com/cran/tabulate
* Date/Publication: 2022-02-16 08:20:01 UTC
* Number of recursive dependencies: 52

Run `revdepcheck::revdep_details(, "tabulate")` for more info

</details>

## In both

*   checking whether package ‘tabulate’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/emilhvitfeldt/Github/emoji/revdep/checks.noindex/tabulate/new/tabulate.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘tabulate’ ...
** package ‘tabulate’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘Apple clang version 16.0.0 (clang-1600.0.26.3)’
using C++11
using SDK: ‘MacOSX15.0.sdk’
clang++ -arch arm64 -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I'/Users/emilhvitfeldt/Github/emoji/revdep/library.noindex/tabulate/Rcpp/include' -I/opt/R/arm64/include    -fPIC  -falign-functions=64 -Wall -g -O2   -c RcppExports.cpp -o RcppExports.o
In file included from RcppExports.cpp:4:
In file included from ./tabulate_types.h:1:
./tabulate.h:125:10: fatal error: 'cstddef' file not found
  125 | #include <cstddef>
      |          ^~~~~~~~~
1 error generated.
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘tabulate’
* removing ‘/Users/emilhvitfeldt/Github/emoji/revdep/checks.noindex/tabulate/new/tabulate.Rcheck/tabulate’


```
### CRAN

```
* installing *source* package ‘tabulate’ ...
** package ‘tabulate’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C++ compiler: ‘Apple clang version 16.0.0 (clang-1600.0.26.3)’
using C++11
using SDK: ‘MacOSX15.0.sdk’
clang++ -arch arm64 -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I'/Users/emilhvitfeldt/Github/emoji/revdep/library.noindex/tabulate/Rcpp/include' -I/opt/R/arm64/include    -fPIC  -falign-functions=64 -Wall -g -O2   -c RcppExports.cpp -o RcppExports.o
In file included from RcppExports.cpp:4:
In file included from ./tabulate_types.h:1:
./tabulate.h:125:10: fatal error: 'cstddef' file not found
  125 | #include <cstddef>
      |          ^~~~~~~~~
1 error generated.
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘tabulate’
* removing ‘/Users/emilhvitfeldt/Github/emoji/revdep/checks.noindex/tabulate/old/tabulate.Rcheck/tabulate’


```
