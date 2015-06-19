#!/bin/bash

maildir="$HOME/.Mail/"
exclude="spam\|nagios\|stuga-mod\|facebook\|cacert\|stackexchange\|amazon\|railscasts\|Drafts"

count=$(find "$maildir" -ipath '*/new/*' -type f | grep -v "$exclude" | wc -l | sed 's/[[:blank:]]*//g')

# printf "\033[0;31m${count}\033[0m\n"
if [[ "${count}" > "0" ]]; then
  echo "Unread: ${count}"
fi
