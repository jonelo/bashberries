#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
USER_AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36"

BIFS="$IFS"
IFS=$'\n'
for file in $(find . -maxdepth 1 -type f -name "*.m3u8")
do
    printf "Processing %s\n" "$file"

    outfilename="${file%.*}.mp4"
    printf "Generating %s\n" "$outfilename"

    "${SCRIPT_DIR}/ffmpeg" -protocol_whitelist file,http,https,tcp,tls,crypto -i "$file" -bsf:a aac_adtstoasc -vcodec copy -c copy -crf 0 "$outfilename" -stimeout 3000 -user-agent "${USER_AGENT}"
    code="$?"
    printf "file: %s, retcode: %s\n" "$file" "$code"
    if [[ $code -ne 0 ]]; then
      exit
    else
      rm "$file"
    fi
done
IFS="$BIFS"
