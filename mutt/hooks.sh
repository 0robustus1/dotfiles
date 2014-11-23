#!/bin/bash

base_directory="/Users/robustus/.Mail/"

directory=$1
replacement=$2

# for folder in $(find "$base_directory$directory" -type d | grep -vP "(cur|new|tmp)$" | sed "s/^.+$directory//"); do
#   echo $folder
# done

for folder in $(ls -p "$base_directory/$directory" | grep -oP ".+(?=/)"); do
  echo "folder-hook \"+\/$folder\" 'macro index o \"<shell-escape>offlineimap -qf $folder -a $replacement<enter>\"'"

done
