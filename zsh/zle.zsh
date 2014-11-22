function bind2maps () {
  local i sequence widget
  local -a maps

  while [[ "$1" != "--" ]]; do
      maps+=( "$1" )
      shift
  done
  shift

  if [[ "$1" == "-s" ]]; then
      shift
      sequence="$1"
  else
      sequence="${key[$1]}"
  fi
  widget="$2"

  [[ -z "$sequence" ]] && return 1

  for i in "${maps[@]}"; do
    bindkey -M "$i" "$sequence" "$widget"
  done
}

bind2maps emacs viins       -- -s '^z' grml-zsh-fg

function grml-zsh-fg() {
  if (( ${#jobstates} )); then
    zle .push-input
    BUFFER=" fg"
    zle .accept-line
  else
    zle -M 'No background jobs. Doing nothing.'
  fi
}

zle -N grml-zsh-fg

bind2maps emacs viins -- -s '^s' zsh-sudoify-last-or-current

function zsh-sudoify-last-or-current() {
  if (( !${#BUFFER} )); then
    zle .up-history
  fi
  BUFFER="sudo $BUFFER"
  zle .vi-end-of-line
}

zle -N zsh-sudoify-last-or-current

