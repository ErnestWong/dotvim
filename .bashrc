
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '
alias glog='git log --pretty=format:\"%h %s\"\ --graph'
### alias vim='mvim -v'

export PATH="$PATH:/Applications/Muse"

export DYLD_FALLBACK_LIBRARY_PATH="$DYLD_FALLBACK_LIBRARY_PATH:/Applications/Muse"

alias fuck='$(thefuck $(fc -ln -1))'
alias infra='cd /Users/ewong/base/coursera/infra-services'
alias site='cd /Users/ewong/base/coursera/site'
alias dev='cd /Users/ewong/base/coursera/'
alias web='cd /Users/ewong/base/coursera/web'
alias dotvim='cd /Users/ewong/Documents/Code/dotvim'

export NVM_DIR="/Users/ewong/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
