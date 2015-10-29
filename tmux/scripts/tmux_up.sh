#! /bin/zsh

BASE_SESSION_NAME="home"

session-exists() {
  session_name="$1"
  tmux has-session -t "${session_name}" &> /dev/null
}

window-exists() {
  session_name="$1"
  window_name="$2"
  tmux list-windows -t "${session_name}" -F "#{window_name}" | grep -q "${window_name}"
}

# create new session with the corresponding
# name and a window with the name "vimscope"
# in detached mode (-d)
create-session() {
  session_name="$1"
  default_window_name="$2"
  tmux new-session -s "${session_name}" -n "${default_window_name}" -d
}

in-window() {
  session_name="$1"
  window_name="$2"
  if (( $# > 0 )); then
    if ! window-exists "${session_name}" "${window_name}"; then
      tmux new-window -an "${window_name}" -t "${session_name}:$"
    fi
  fi
  if (( $# > 2 )); then
    rest="$@[3, -1]"
    echo "${session_name}:${window_name}" ${rest} | xargs tmux send-keys -t
  fi
}

alias ensure-window-existence="in-window"

link-window() {
  source_session_name="$1"
  source_window_name="$2"
  target_session_name="$3"
  target_window_name="$4"
  in-window "${source_session_name}" "${source_window_name}"
  in-window "${target_session_name}" "${target_window_name}"
  tmux link-window -k -s "${source_session_name}:${source_window_name}" -t "${target_session_name}:${target_window_name}"
}

change-directory-in-window() {
  session_name="$1"
  window_name="$2"
  target_directory="$3"
  in-window "${session_name}" "${window_name}" cd SPACE "${target_directory}" ENTER
  in-window "${session_name}" "${window_name}" clear ENTER
}

alias session-exists-here="session-exists ${SESSIONNAME}"
alias window-exists-here="window-exists ${SESSIONNAME}"
alias create-session-here="create-session ${SESSIONNAME}"
alias in-window-here="in-window ${SESSIONNAME}"
alias change-directory-in-window-here="change-directory-in-window ${SESSIONNAME}"
alias ensure-window-existence-here="ensure-window-existence ${SESSIONNAME}"

SESSIONNAME="home"
if ! session-exists-here; then
  create-session-here mutt

  in-window-here mutt mutt ENTER

  ensure-window-existence-here home

  change-directory-in-window-here projects ~/projects
  change-directory-in-window-here projects-support ~/projects

  ensure-window-existence-here server-connection
fi

SESSIONNAME="work"
if ! session-exists-here; then
  create-session-here mutt
  link-window "${BASE_SESSION_NAME}" mutt "${SESSIONNAME}" mutt

  in-window-here home
fi

SESSIONNAME="uni"
if ! session-exists-here; then
  create-session-here mutt
  link-window "${BASE_SESSION_NAME}" mutt "${SESSIONNAME}" mutt

  ensure-window-existence-here home

  change-directory-in-window-here uni ~/uni
  change-directory-in-window-here stuga ~/uni/stuga
  change-directory-in-window-here fbmi ~/uni/fbmi
fi
