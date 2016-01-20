#! /bin/bash

maildir_selection_parameter="$1"
if [[ -z "${maildir_selection_parameter}" ]]; then
  maildir_selection_parameter="-a"
fi

mbsync "${maildir_selection_parameter}"
notmuch new
