# bash-dwarfs
bash-dwarfs (note the hyphen between bash and dwarfs) is a collection of tiny bash scripts (as known as a dwarf) that can do some work for you. The term has nothing to do with bashing a dwarf since bash stands for "Bourne-again shell" - one of the most famous shells for GNU/Linux and Unix systems. No dwarf was harmed in the making of this collection of scripts ;-)

Not only scripts are being provided by this project, but also include files that help you to write our own bash scripts more quickly.
All bash-dwarfs have been tested on both Ubuntu 16.04.03 LTS and macOS 10.12.6.
If you don't set any parameters for a script, a short help will be printed.

## Overview of the bash-dwarfs

Script name         | Description                                                                    |
------------------- | ------------------------------------------------------------------------------ |
bigfiles            | Determines the biggest files in a directory and it's subdirectories            |
latlng              | Determines both latitude and longitude of a location                           |
lines               | Extracts a block of lines from a textfile                                      |
update_property     | Updates the value of a key/value pair in a property file                       |
update_this         | Downloads all bash scripts from the bash-dwarfs project on github              |
update_tzdatabase   | Updates the time zone database of your Java Runtime Environment                |
update_tzupdater    | Updates the tzupdater.jar                                                      |


## Overview of the include files

Include name        | Description                                                                    |
------------------- | ------------------------------------------------------------------------------ |
interaction.include | provides functions for an user interaction                                     |
math.include        | provides mathematical functions                                                |
network.include     | provides specific network functions                                            |
permissions.include | provides functions that are related to permissions                             |
proxy.include       | provides proxy related functions                                               |
trim.include        | provides several trim functions                                                |       |
version.include     | provides version specific functions                                            |
 
                 
## The bash-dwarfs in detail

### bigfiles

```
bigfiles v1.1.0, Copyright 2017 Johann N. Loefflmann

Determines the biggest files in a directory and it's subdirectories

Usage:
    bigfiles [-o] [-g greater] [-n max_files] [path]

Options:
    -o           print the owners of the biggest files.
    -g greater   a file is a big file if its file size is greater
                 than the greater value. You may append
                 k, M, G and T for kilo, Mega, Giga, and Tera.
                 If greater is omitted, greater is set to 0.

    -n max_files specifies the maximum number of big files.
                 If max_files is omitted or if max_files is set to 0,
                 all files will be printed that matches -g.

Parameters:
    path         specifies the directory to be traversed.
                 If path is omitted, this help will be printed.

Examples:
    bigfiles -g 1M .
                 all files greater than 1 MB in the current working directory
                 and below.

    bigfiles -o -n 25 -g 1G /
                 25 biggest files > 1 GB in the root directory and below
                 including a summary of the owners of those files.
```

### latlng
```
latlng v1.0.0, Copyright 2017 Johann N. Loefflmann

Determines both latitude and longitude of a location.
The script uses the Google Maps web service.

Usage:
    latlng [-c][-i] [location]

Options:
    -c         output as one line separated by a comma
    -i         input in interactive mode

Parameters:
    location   the location as a string

Examples:
    latlng "Statue of Liberty"
               determines lat and lng of the Statue of Liberty
    latlng -ic
               reads input from the user in order to determine lat and lng
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
               Prints lines from the log file called verylong.log, starting
               with the line that starts with "2017-08-06" and ending with
               the line that starts with "2017-08-07", but not printing out
               that last ending line
```

### update_property

```
update_property v1.0.0, Copyright 2017 Johann N. Loefflmann

Updates the value of a key/value pair in a property file.
The script saves existing comments and also the order of the properties.

Usage:
    update_property [-e] [-f] [-q] [file key value]

Options:
    -e      echo the updated line of the file.
    -f      force to append the key/value pair to the file even if the key is
            not in the property file yet.
    -q      set quotes around the value when writing the value.

Parameters:
    file    specifies the file that needs to be updated.

    key     specifies the key in the property file.

    value   specifies the value for the key.

Examples:
    update_property -f app.conf mykey "new value"
            updates the key called mykey with the value called "new value" in
            the app.conf property file in any case
```

### update_tzdatabase

```
update_tzdatabase v1.0.0, Copyright 2017 Johann N. Loefflmann

Downloads the latest timezone data from iana.org, calculates the necessary
sha256 digest by calling jacksum, and updates the timezone database of
your Java Runtime Environment by calling tzupdater.jar

Usage:
    update_tzdatabase [-h]
                      [-j java-binary] [-s jacksum.jar] [-t tzupdater.jar]

Options:
    -h               prints this help
    -j java          location of the java binary.
                     If omitted, default java is used.
    -s jacksum.jar   location of the jacksum.jar file.
                     If omitted, jacksum.jar is expected in the script dir.
    -t tzupdater.jar location of the tzupdater.jar file.
                     If omitted, tzupdater.jar is expected in the script dir.

Examples:
    update_tzdatabase
                     updates the tzdatabase of the default JRE.
```