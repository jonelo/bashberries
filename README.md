# bash berries
bash berries is a set of tiny bash scripts that can do some work for you if you are an admin or a developer.

Not only scripts are being provided by this project, but also include files that help you to write our own bash scripts more quickly.
All bash berries have been tested on the latest stable Ubuntu LTS and macOS releases.
If you don't set any parameters for a script, a short help will be printed.

## User website

https://jonelo.github.io/bashberries/

## Install or update

```
bash <(curl -Ls http://bit.ly/update-bashberries) ~/bin
```

## Overview of the bash berries

Script name         | Description                                                                    |
------------------- | ------------------------------------------------------------------------------ |
bigfiles            | Determines the biggest files in a directory and it's subdirectories            |
latlng              | Determines both latitude and longitude of a location                           |
lines               | Extracts a block of lines from a textfile                                      |
pwned               | Has your password been pwned?                                                  |
update_jre          | Downloads the latests JRE from the web, extracts it and creates a symlink      |
update_property     | Updates the value of a key/value pair in a property file                       |
update_bashberries  | Downloads all bash scripts from the bashberries project on github              |
update_tzdatabase   | Updates the time zone database of your Java Runtime Environment                |
update_tzupdater    | Updates the tzupdater.jar by calling update_jre -t tzupdater                   |


## Overview of the include files

Include name        | Description                                                                    |
------------------- | ------------------------------------------------------------------------------ |
interaction.include | provides functions for an user interaction                                     |
math.include        | provides mathematical functions                                                |
network.include     | provides specific network functions                                            |
permissions.include | provides functions that are related to permissions                             |
proxy.include       | provides proxy related functions                                               |
trim.include        | provides several trim functions                                                |
version.include     | provides version specific functions                                            |
 
## The bash berries in detail

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

### update_jre
```
update_jre v1.7.0, Copyright 2018 Johann N. Loefflmann

Downloads the latest x64 JRE/JDK tarball resp. the latest tzupdater zip from
the web, extracts it and creates/updates a symlink called <type>_latest
resp. tzupdater.jar. Supports multiple sources, such as oracle.com, java.com,
jdk.java.net, and adoptopenjdk.net. The latest timezone database can be applied
to the requested JRE/JDK as well so that you have the most possible up to date
JRE/JDK within a Java family from your preferred source. And since the symlink
always points to the latest JRE/JDK you can update the JRE/JDK both fast and
comfortable. The OS flavor of the JRE/JDK is determined by the OS that you are
running. Linux and macOS are supported.

Usage:
    update_jre [ [-h] | [-a] [-d] [-f] [-k] [-s source] [-t type] [path] ]

Options:
    -a      accept license. That is a required option if you want to
            download the JRE, JDK or tzupdater from the Oracle site
            (-t oracle.com). Please read the license at
            www.oracle.com/technetwork/java/javase/terms/license/index.html
            resp. at
            http://www.oracle.com/technetwork/java/javasebusiness/downloads/
            L-> tzupdater-lic-354297.txt
            and allow the script to download the package by specifying this
            option.

    -d      dry run. Don't download the JRE, JDK or tzupdater, just inform the
            user.

    -f      force. Even if we have the JRE, JDK or tzupdater already, update it
            again.

    -h      prints this help.

    -k      keep the downloaded .tar.gz resp. .zip, don't remove it at the end.

    -s      source. Supported values are
                oracle.com        (Oracle binaries, default)
                java.com          (Oracle binaries)
                jdk.java.net      (OpenJDK binaries)
                adoptopenjdk.net  (OpenJDK binaries)

    -t      type. Valid value depends on the source.

            For -s oracle.com it can be
                jre               (latest JRE)
                sjre              (latest Server JRE)
                jdk               (latest JDK)
                tzupdater         (latest tzupdater)

            For -s java.com it can be
                 jre              (latest JRE)

            For -s jdk.java.net this can be
                openjdk10         (OpenJDK 10)
                openjdk11         (OpenJDK 11)

            For -s adoptopenjdk.net it can be
                openjdk8          (OpenJDK 8 with Hotspot)
                openjdk8-openj9   (OpenJDK 8 with OpenJ9)
                openjdk9          (OpenJDK 8 with Hotspot)
                openjdk9-openj9   (OpenJDK 8 with OpenJ9)
                openjdk10         (OpenJDK 10 with Hotspot)
                openjdk10-openj9  (OpenJDK 10 with OpenJ9)

    -v      version. Prints out the version of this script.

    -z      after the JRE or JDK has been downloaded and extracted, the
            latest tzupdater will be downloaded and applied to the JRE or JDK.
            Requires -a to work.

Parameters:
    path    specifies the path where the JRE, JDK or tzupdater should be stored.
            It will be created if it doesn't exist.
            If omitted, .<type>/ will be used.

Examples:
    ./update_jre -a
            updates the JRE in ./jre/ and it creates a symlink called
            jre_latest there.
    ./update_jre -az myjres
            updates the JRE in myjres and it updates the symlink called
            jre_latest there. Additionally the latest timezone updater
            is being downloaded and called so that the JRE's timezone database
            also gets updated.
    ./update_jre -a -t jdk /opt/java/
            updates the JDK in /opt/java/ and it updates a symlink
            called jdk_latest there.
    ./update_jre -a -t tzupdater /opt/java/
            updates the tzupdater in /opt/java/ and it updates a symlink
            called tzupdater.jar there.
    ./update_jre -az -s adoptopenjdk.net -t openjdk10
            downloads both the latest tzupdater from oracle.com and
            the latest OpenJDK10 build from adoptopenjdk.net, applies the
            latest timezone database from IANA to the OpenJDK by calling
            the tzupdater tool. Symlink called .openjdk10/openjdk10_latest
            will point to the latest and updated OpenJDK10 build.
```


### update_property
```
update_property v1.1.0, Copyright 2017,2018 Johann N. Loefflmann

Updates the value of a key/value pair in a property file.
The script saves existing comments and also the order of the properties.

Usage:
    update_property [-d <delimiter>] [-e] [-f] [-q] [file key value]

Options:
    -d      delimiter, delimits the key and the value.
            If omitted the equal sign is assumed.
    -e      echo the updated line of the file.
    -f      force to append the key/value pair to the file even if the key is
            not in the property file yet.
    -q      set quotes around the value when writing the value.

Parameters:
    file    specifies the file that needs to be updated.

    key     specifies the key in the property file.

    value   specifies the value for the key.

Examples:
    update_property -f -q app.conf mykey "new value"
            updates the key called "mykey" with the value called "new value"
            with quotes around the value in the app.conf property file, and
            creates the key/value pair if the key does not exist.
    update_property -d ' ' -e /etc/openvpn/vpn.conf remote "my-server-1 1194"
            updates the key called "remote" in the property file that has
            a blank as the delimiter, it also echoes the modified line.
```

### update_bashberries
```
update_bashberries v1.1.0, Copyright 2017-2018 Johann N. Loefflmann

Downloads the latest bash scripts from the bashberries project on github
and updates any existing scripts in the directory that has been specified.

Usage:
    update_bashberries <directory>

Parameter:
    directory        the directory where the scripts should be stored

Examples:
    ./update_bashberries .
                     updates the bashberries in the current working directory
    bash <(curl -Ls http://bit.ly/update-bashberries) ~/bin
                     updates the bashberries in ~/bin with just this line
```


### update_tzdatabase

```
update_tzdatabase v1.0.2, Copyright 2017-2018 Johann N. Loefflmann

Downloads the latest timezone data from iana.org, calculates the necessary
sha256 digest by calling jacksum, and updates the timezone database of
your Java Runtime Environment by calling tzupdater.jar

Usage:
    update_tzdatabase [ [-h] |
                        [-j java-binary] [-s jacksum.jar] [-t tzupdater.jar] ]

Options:
    -h               prints this help.
    -j java          location of the java binary.
                     If omitted, default java is used.
    -s jacksum.jar   location of the jacksum.jar file.
                     If omitted, jacksum.jar is expected in the script dir.
    -t tzupdater.jar location of the tzupdater.jar file.
                     If omitted, tzupdater.jar is expected in the script dir.

Examples:
    update_tzdatabase
                     updates the tzdatabase of the default JRE.
    sudo ./update_tzdatabase -j \$(type -P java)
                     updates the tzdatabase of the default JRE using root
                     permissions.
```
