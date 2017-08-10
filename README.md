# bash-dwarfs
bash-dwarfs (note the hyphen between bash and dwarfs) is a collection of tiny bash scripts (as known as a dwarf) that can do some work for you. The term has nothing to do with bashing a dwarf since bash stands for "Bourne-again shell" - one of the most famous shells for GNU/Linux and Unix systems. No dwarf was harmed in the making of this collection of scripts ;-)

All bash-dwarfs have been tested on both Ubuntu 16.04.03 LTS and macOS 10.11.6.
If you don't set any parameters for a script, a short help will be printed.

## Overview of the dwarfs

Script name    | Description                                                                |
-------------- | -------------------------------------------------------------------------- |
bigfiles       | determines the biggest files in a directory and it's subdirectories        |
lines          | Extracts a block of lines from a textfile                                  |


## The bash-dwarfs in detail

### bigfiles

```
bigfiles v1.0.2, Copyright 2017 Johann N. Loefflmann

Determines the biggest files in a directory and it's subdirectories

Usage:
    bigfiles [path [min_size [max_files]]]

    path specifies the directory to be traversed.
    If path is omitted, this help will be printed.

    min_size specifies the file size that a file must have at least in
    order to be considered to be a big file. You may append k, M, G and T for
    kilo, Mega, Giga, and Tera. If min_size is omitted, min_size is set to 0.

    max_files specifies the maximum number of big files.
    If max_files is omitted or if max_files is set to 0,
    all files will be printed that matches min_size.

Examples:
    bigfiles . 1M
        all files > 1 MB in the current working directory and below

    bigfiles / 1G 25
        25 biggest files > 1 GB in / and below
```

### lines
```
lines v1.0.0, Copyright 2017 Johann N. Loefflmann

Extracts a block of lines from a textfile

Usage:
    lines [-i] [-b number] [-e number] [-H number] [-T number]
          [file [begin [end]]]

Options:
    -b number  If begin is a string and if it matches more than one line, you
               can specify a particular match number.
    -e number  If end is a string and if it matches more than one line, you
               can specify a particular match number.
    -i         Ignore case. Perform case insensitie matching. By default,
               the search algorithm is case sensitive.
    -H number  A positive number cuts the head of the output.
               A negative number extends the head of the output.
    -T number  A postivie number extends the tail of the output.
               A negative number cuts the tail of the output.

Parameters:
    file       Specifies the textfile that needs to be processed.
               If file is omitted, this usage will be printed.

    begin      Specifies the search string in order to find the "begin".
               If begin is a string, it searches for the first occurence
               in the file.  If begin is an integer, it specifies a line
               number (starting with 1).

    end        Specifies the search string in order to find the "end".
               If end is a string, it searches for the first occurence
               starting with the line that is specified by "begin".
               If end is an integer, it specifies a line number
               (starting with 1).

Examples:
    lines log.txt 20 40
               Prints line number 20 to line number 40 from the file called
               log.txt

    lines -T -1 verylong.log "^2017-08-06" "^2017-08-07"
               Prints lines from the log file calle verylong.log, starting
               with the line that starts with "2017-08-06" and ending with
               the line that starts with "2017-08-07", but not printing out
               that last ending line
```
