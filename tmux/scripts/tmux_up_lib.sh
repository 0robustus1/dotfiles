#! /bin/zsh

if [[ -z "${TMUX_VERBOSE_CREATION}" ]]; then
  TMUX_VERBOSE_CREATION=0
fi

report_on_verbose() {
  if (( $TMUX_VERBOSE_CREATION > 0 )); then
    echo $@
  fi
}

session-exists() {
  session_name="$1"
  tmux has-session -t "${session_name}" 2> /dev/null
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
  report_on_verbose "Creating session <${session_name}> with window <${default_window_name}>"
  tmux new-session -s "${session_name}" -n "${default_window_name}" -d
}

in-window() {
  session_name="$1"
  window_name="$2"
  if (( $# > 0 )); then
    if ! window-exists "${session_name}" "${window_name}"; then
      report_on_verbose "Creating new window <${window_name}> in session <${session_name}>"
      tmux new-window -an "${window_name}" -t "${session_name}:$"
    fi
  fi
  if (( $# > 2 )); then
    rest="$@[3, -1]"
    report_on_verbose "Executing <${rest}> in <${session_name}:${window_name}>"
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
  report_on_verbose "Linking source <${source_session_name}:${source_window_name}> to <${target_session_name}:${target_window_name}>"
  tmux link-window -k -s "${source_session_name}:${source_window_name}" -t "${target_session_name}:${target_window_name}"
}

change-directory-in-window() {
  session_name="$1"
  window_name="$2"
  target_directory="$3"
  report_on_verbose "Switching to directory <${target_directory}> in <${session_name}:${window_name}>"
  in-window "${session_name}" "${window_name}" cd SPACE "${target_directory}" ENTER
  in-window "${session_name}" "${window_name}" clear ENTER
}

session-exists-here() { session-exists ${SESSIONNAME} $@ }
window-exists-here() { window-exists ${SESSIONNAME} $@ }
create-session-here() { create-session ${SESSIONNAME} $@ }
in-window-here() { in-window ${SESSIONNAME} $@ }
change-directory-in-window-here() { change-directory-in-window ${SESSIONNAME} $@ }
ensure-window-existence-here() { ensure-window-existence ${SESSIONNAME} $@ }
