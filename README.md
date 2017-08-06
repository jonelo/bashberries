# bash-dwarfs
bash-dwarfs (note the hyphen between bash and dwarfs) is a collection of tiny bash scripts (as known as a dwarf) that can do some work for you. The term has nothing to do with bashing a dwarf since bash stands for "Bourne-again shell" - one of the most famous shells for GNU/Linux and Unix systems. No dwarf was harmed in the making of this collection of scripts ;-)

All bash-dwarfs have been tested on both Ubuntu 16.04.03 LTS and macOS 10.11.6.
If you don't set any parameters for a script, a short help will be printed.

## Overview of the dwarfs

Script name    | Description                                                                |
-------------- | -------------------------------------------------------------------------- |
bigfiles       | determines the biggest files in a directory and it's subdirectories        |


## The dwarfs in detail

### bigfiles

```
bigfiles v1.0.0, Copyright 2017 Johann N. Loefflmann

determines the biggest files in a directory and it's subdirectories

usage:
    bigfiles [path [min_size [max_files]]]

    path specifies the directory to be traversed.
    If path is omitted, this help will be printed.

    min_size specifies the file size that a file must have at least in
    order to be considered a big file. You may append k, M, G and T for
    kilo, Mega, Giga, and Tera. If min_size is omitted, min_size is set to 0.
       
    max_files specifies the maximum number of big files.
    If max_files is omitted or if max_files is set to 0,
    all files will be printed that matches min_size.

Examples:
    bigfiles . 1M
        # all files > 1 MB in the current working directory and below
    bigfiles /var 1G 25
        # 25 biggest files > 1 GB in /var and below
```
