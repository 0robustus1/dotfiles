# zsh config by Tim Reddehase <robustus@rightsrestricted.com>

##############################
#### General zsh Settings ####
##############################

source ~/.zsh/environment.zsh

autoload -U colors && colors

fpath=(~/.zsh/completion ~/.zsh/own_scripts ~/.zsh/scripts $fpath)
GREP_OPTIONS=--color=always
HISTFILE=~/.histfile
HISTSIZE=9000000
SAVEHIST=9000000

setopt appendhistory autocd extendedglob notify
#setopt no_share_history #unset shared history
setopt SHARE_HISTORY #activate shared history
unsetopt beep nomatch
bindkey -v # vim-style bindings

source ~/.zsh/functions.zsh
source ~/.zsh/aliasing.zsh

#####################################
####### Hostspecific Settings #######
#####################################

# local hostname_file="~/.zsh/hostname_$(hostname -s).zsh"
# echo "Looking for ${hostname_file}"
# if [[ -e "${hostname_file}" ]]; then
#   source "${hostname_file}"
# fi


export LSCOLORS=gxfxcxdxbxegedabagacad #OS X style
path=(
  /usr/local/var/rbenv/shims
  /usr/local/opt/go/libexec/bin
  /Users/robustus/.cabal/bin
  /usr/local/share/npm/bin
  /Users/robustus/Library/ActivePerl-5.14/bin
  /usr/local/ActivePerl-5.14/bin
  /usr/local/sbin
  /usr/local/bin
  ~/projects/bin
  $path
  /usr/X11/bin
  /usr/local/MacGPG2/bin
  /usr/texbin )
typeset -U path

source "/usr/local/opt/rbenv/libexec/../completions/rbenv.zsh"
rbenv rehash 2>/dev/null

rbenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval `rbenv "sh-$command" "$@"`;;
  *)
    command rbenv "$command" "$@";;
  esac
}

#################
### oh-my-zsh ###
#################

# disable these pesky update-checks
export DISABLE_AUTO_UPDATE="true"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

source ~/.zsh/oh_my_zsh.zsh

##################################################################
# Key bindings
# http://mundy.yazzy.org/unix/zsh.php
# http://www.zsh.org/mla/users/2000/msg00727.html
typeset -g -A key
bindkey '^?' backward-delete-char
bindkey '^[[1~' beginning-of-line
# bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
# bindkey '^[[6~' down-line-or-history
# bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
# bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char

#Folder-Shortcuts:
#projects=~/my/projects
#: ~projects #Force zsh to register shortcut

source ~/.zsh/npm-completion.zsh

source ~/.zsh/zle.zsh

# Display running jobs count for tmux, doesn't work perfectly
precmd () {
  # printf '\033]2;%s %s\033\\' $(jobs | wc -l) "jobs"
  printf '\033]2;%s %s\033\\' ${#jobstates} "jobs"
}

#### The following lines were added by compinstall
# zstyle :compinstall filename '/home/robustus/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' list-colors 'rs=0:di=96;36:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:'
##### End of lines added by compinstall

# tmux #
########
# must be last line of zshrc
source ~/srv/dotfiles/tmux/scripts/tmux_up.sh
