#!/bin/bash

default_mail_base_dir=~/.Mail
default_absolute_path=1

if (( $# < 2 )); then
  >&2 echo "You need to provide a directory in mail base dir and the offlineimap name."
  >&2 echo "Optionally set MAIL_BASE_DIR= if <${default_mail_base_dir}> doesn't suit you."
  >&2 echo "You can set ABSOLUTE_PATH= to another value if <${default_absolute_path}> doesn't suit you."
  exit 1
fi

if [[ -z "${MAIL_BASE_DIR}" ]]; then
  MAIL_BASE_DIR="${default_mail_base_dir}"
fi

if [[ -z "${ABSOLUTE_PATH}" ]]; then
  ABSOLUTE_PATH=${default_absolute_path}
fi

directory="$1"
account="$1"
replacement="$2"

folder-hook-target() {
  folder="$1"
  if (( $ABSOLUTE_PATH > 0 )); then
    echo "${MAIL_BASE_DIR}/${directory}/${folder}"
  else
    echo "+\/$folder"
  fi
}
# for folder in $(ls -p "${MAIL_BASE_DIR}/${directory}" | grep -oP ".+(?=/)"); do
for folder in $(ls -1p ${MAIL_BASE_DIR}/${directory}/ | ggrep -oP ".+(?=/)"); do
  full_path="$(folder-hook-target $folder)"
  target="$(echo ${full_path} | sed 's/\//\\\//g')"
  box_path="$(echo ${folder} | sed 's/\./\//g')"
  echo "folder-hook \"${target}\" 'macro index o \"<sync-mailbox><shell-escape>~/.mutt/update-maildirs.sh ${account}:${box_path}<enter>\"'"
done
