#! /bin/zsh

BASE_SESSION_NAME="home"

source ~/srv/dotfiles/tmux/scripts/tmux_up_lib.sh

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
