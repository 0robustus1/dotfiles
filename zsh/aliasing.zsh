alias ls="ls -G -F" # warning: only Mac OS X
alias be="bundle exec"
alias bi="bundle install"
alias bl="bundle list"
alias bp="bundle package"
alias bo="bundle open"
alias bu="bundle update"
alias invoker_reload_all="invoker list | cut -d '|' -f 4 | awk 'NR>=4 && !/\+-/' | xargs -n 1 invoker reload"
alias §='git status'
alias §§='git remote update'
alias ±='cd "$(git rev-parse --show-toplevel)"'
alias git="LANG='en_US.UTF-8' git"
alias g="LANG='en_US.UTF-8' git"
alias less="less -R"
alias remote_tmux="socat \"UNIX-LISTEN:$SOCKET_DIR/tmux_remote,reuseaddr,fork\" EXEC:'ssh far socat STDIO UNIX-CONNECT\:/var/run/tmux/tmux-0/default'"
# alias emacsg="open -a /usr/local/Cellar/emacs/24.3/Emacs.app"
alias far="ssh -R 52698:localhost:52698 far"
alias getmpd="ssh near -fNL 6600:localhost:6600 -g"
alias printssh="ssh -4 -f -N -L 50631:127.0.0.1:631 stuga"
# alias powremove="curl get.pow.cx/uninstall.sh | sh"
#alias git="nocorrect git "
alias sudo='nocorrect sudo ' #Erlaubt das 'Weiterreichen' von Aliases an Sudo.
alias lw0='serverprint -p lw0 -s uni'
alias lw1='serverprint -p lw1 -s uni'
# alias irc='autossh -M 19998 -t  irc "screen -S irc -xR irssi"'
# alias persist='autoPersistWith'
alias unibackup="rsync -vrultzh"
alias findAllGit="find ~ -type d -name .git 2> /dev/null | grep --color=never -oP \".*?(?=\.git)\""
alias soywiki-console='SOYWIKI_VIM=vim soywiki'
alias exitstate='echo $?'
#alias -s rb=$VISUAL
#alias -s .zlogin=$VISUAL
alias process-duration='ps -o etime= -p'
alias attach='tmux attach-session -t home'
alias rebuild-ontohub='rake db:migrate:clean && redis-cli flushdb && rake db:seed'
alias observed-iex='iex --erl "-run observer"'
alias observed-erl='erl -run observer'
alias header-curl='curl -sD - -o /dev/null'
