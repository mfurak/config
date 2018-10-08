#general
alias ~='cd ~'
alias ..='cd ../'
alias ...='cd ../../'
alias ll='ls -la'
alias .='explorer .'
#git 
alias gs='git status'

alias gcl='git clone $1'

alias gp='git push'

alias gpd='git pull origin develop'
alias grd='git pull --rebase origin develop'
alias gpl='git pull $*'

alias gf='git fetch'

alias gb='git branch'
alias gbd='git branch -d $*'
alias gbdf='git branch -D $*'

alias gl='git log'
alias gll='git log --oneline --graph --decorate  $*'
alias glla='git log --oneline --all --graph --decorate  $*'

alias gco='git checkout $1'

alias ga='git add $*'

alias gc='git commit'
alias gcm='git commit -m $1'

alias gcp='git cherry-pick $*'
alias gcpn='git cherry-pick -n $*'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gmt='git mergetool'

alias gd='git diff'
