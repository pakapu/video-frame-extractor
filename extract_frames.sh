#!/bin/bash

for FILE in $(ls *.mp4)
do
    FILE_NO_EXT="${FILE%.*}"
    if [[ ! -d "$FILE_NO_EXT" ]];
    then
        mkdir "$FILE_NO_EXT"
        cd "$FILE_NO_EXT"
        ffmpeg -i ../$FILE -vf fps=5 "$FILE_NO_EXT%06d.jpg"
        cd ..
    fi
done
