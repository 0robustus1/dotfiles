export EDITOR=vim
export PAGER="less -isR -+S"
export MANPAGER="less -isR -+S"
# export VISUAL="mvim -f"
export VISUAL="vim"

export RBENV_ROOT=/usr/local/var/rbenv

# ANTLR stuff (Software Reengineering)
export CLASSPATH=".:/usr/local/Cellar/antlr/4.1/antlr-4.1-complete.jar:$CLASSPATH"
alias grun='java org.antlr.v4.runtime.misc.TestRig'

export AUTOFEATURE=true #Used for cucumber and autotest
export RSPEC=true
# for my rr_github plugin:
export GITHUB_KEYWORD="github:"
export GITHUB_REQUEST_TO="staging"
# android development
export ANDROID_HOME=/usr/local/opt/android-sdk

export GOPATH=$HOME/projects/meta-categories/go/

# just be english, especially helpful for git
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# probably needed for ruby 2.0 oauth
# export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
