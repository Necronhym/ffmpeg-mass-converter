#!/bin/bash

read -p "Convert all .mpga files in folder to .MP3? [Y/n] " -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi


for f in *.mpga; do ffmpeg -i "$f" -c:a libmp3lame -q:a 2 "${f%.mpga}.mp3"; done
