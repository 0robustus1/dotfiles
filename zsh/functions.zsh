#### Autoupdates while using
# Enable auto-execution of functions.
#typeset -ga preexec_functions
#typeset -ga precmd_functions
#typeset -ga chpwd_functions

# Append git functions needed for prompt.
#preexec_functions+='update_current_git_vars'
#preexec_functions+='git status'
#precmd_functions+='precmd_update_git_vars'
#chpwd_functions+='chpwd_update_git_vars'

#Functions:
##Functionpath:
#fpath=(/home/robustus/.config/functions/ /home/robustus/.fn)
##Load Functions only when called:
#autoload fn_name

autoload -Uz pandoc-open
autoload -Uz svg2pdf
autoload -Uz ip-addresses-current

autoload git_conflict_files
greppdf(){
  for i in $2/*.pdf; do; echo $i; pdftotext "$i" - | grep "$1"; done;
}
#persistWith(){
#  nohup ssh -M -N -R 52698:127.0.0.1:52698 $1 > /dev/null &
#}
autoPersistWith(){
  autossh -M 20000 -f -o ControlMaster=yes -N -R 52698:127.0.0.1:52698 $1
}
persist-all(){
  autossh -M 20000 -f -o ControlMaster=yes -N -R 52698:127.0.0.1:52698 far
  autossh -M 20002 -f -o ControlMaster=yes -N -R 52698:127.0.0.1:52698 uni
  autossh -M 20004 -f -o ControlMaster=yes -N -R 52698:127.0.0.1:52698 hic
}

# rr github plugin #
####################
# opens github issues in browser
source ~/.zsh/own_scripts/ticket.zsh
# opens as github-pull-request in browser
source ~/.zsh/own_scripts/pull-request.zsh

# Other personal scripts #
##########################

source ~/.zsh/own_scripts/remote-gitlog.zsh
