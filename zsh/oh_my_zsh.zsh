ZSH=$HOME/.zsh/repos/oh-my-zsh
export ZSH_THEME="robustus"

# plugins for oh-my-zsh
plugins=(
  git
  brew
  capistrano
  colored-man
  cucumber
  gem
  git-extras
  lein
  mvn
  npm
  osx
  postgres
  powder
  redis-cli
  rsync
  ruby
  thor
  vi-mode
  web-search
  ssh-agent
  z
  history-substring-search
)

# =============================================

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# history-substring-search #

# zmodload zsh/terminfo
# bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey '^[[5~' history-substring-search-up
bindkey '^[[A' history-substring-search-up
bindkey '^r' history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[6~' history-substring-search-down
bindkey '^[[B' history-substring-search-down

# # bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# zsh history-substring search default
# export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=white,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=black,fg=yellow,bold'

# use vi-mode plugin in unison with own settings
RPS1='$(vi_mode_prompt_info) '$RPS1
