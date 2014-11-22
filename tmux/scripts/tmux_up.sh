#!/bin/zsh
BASE_SESSION_NAME="home"
SESSIONNAME="home"

tmux has-session -t $SESSIONNAME &> /dev/null

# Assure that there is no session with that
# name running already.
if [[ $? != 0 ]]; then
  # create new session with the corresponding
  # name and a window with the name "vimscope"
  # in detached mode (-d)
  tmux new-session -s $SESSIONNAME -n mutt -d
  # start mutt in the first window
  tmux send-keys -t ${SESSIONNAME}:mutt mutt ENTER

  # create new home window
  tmux new-window -n home

  # create new home windows
  tmux new-window -n projects
  tmux send-keys -t ${SESSIONNAME}:projects cd SPACE ~/projects ENTER
  tmux send-keys -t ${SESSIONNAME}:projects clear ENTER
  tmux new-window -n projects-support
  tmux send-keys -t ${SESSIONNAME}:projects-support cd SPACE ~/projects ENTER
  tmux send-keys -t ${SESSIONNAME}:projects-support clear ENTER
  tmux new-window -n server-connection
fi

SESSIONNAME="work"

tmux has-session -t $SESSIONNAME &> /dev/null

# Assure that there is no session with that
# name running already.
if [[ $? != 0 ]]; then
  # create new session with the corresponding
  # name and a window with the name "vimscope"
  # in detached mode (-d)
  tmux new-session -s $SESSIONNAME -n mutt -d
  # Link the mutt-window from home to this first window
  tmux link-window -k -s ${BASE_SESSION_NAME}:mutt -t ${SESSIONNAME}:mutt

  # create new home window
  tmux new-window -n home

  # create new ontohub windows
  tmux new-window -n ontohub_main
  tmux send-keys -t ${SESSIONNAME}:ontohub_main cd SPACE ~/uni/ontospace/ontohub ENTER
  tmux send-keys -t ${SESSIONNAME}:ontohub_main clear ENTER
  tmux new-window -n ontohub_support
  tmux send-keys -t ${SESSIONNAME}:ontohub_support cd SPACE ~/uni/ontospace/ontohub ENTER
  tmux send-keys -t ${SESSIONNAME}:ontohub_support clear ENTER
fi

SESSIONNAME="uni"

tmux has-session -t $SESSIONNAME &> /dev/null

# Assure that there is no session with that
# name running already.
if [[ $? != 0 ]]; then
  # create new session with the corresponding
  # name and a window with the name "vimscope"
  # in detached mode (-d)
  tmux new-session -s $SESSIONNAME -n mutt -d
  # Link the mutt-window from home to this first window
  tmux link-window -k -s ${BASE_SESSION_NAME}:mutt -t ${SESSIONNAME}:mutt

  # create new home window
  tmux new-window -n home

  # create new uni windows
  tmux new-window -n uni
  tmux send-keys -t ${SESSIONNAME}:uni cd SPACE ~/uni ENTER
  tmux send-keys -t ${SESSIONNAME}:uni clear ENTER
  tmux new-window -n stuga
  tmux send-keys -t ${SESSIONNAME}:stuga cd SPACE ~/uni/stuga ENTER
  tmux send-keys -t ${SESSIONNAME}:stuga clear ENTER
fi

# allow tmux copy-mechanism to be mirrored to mac os x clipboard
# ps -e | grep -qP "tmux_copy.sh$"
# if [[ $? != 0 ]]; then
#   nohup ~/srv/dotfiles/tmux/scripts/tmux_copy.sh 2>&1 > /dev/null &!
# fi

# # I handle attachment in my terminal config
# attach only if not attached already
# if [[ -z $TMUX ]]; then
#   tmux attach -t $SESSIONNAME
# fi
