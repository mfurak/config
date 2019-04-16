# Aliases
	##General
	alias ~='cd ~'
	alias ..='cd ../'
	alias ...='cd ../../'
	alias ll='ls -la'
	alias .='explorer .'

	##Git 
	alias gs='git status'

	alias gcl='git clone $1'

	alias gp='git push'
	#create a new branch on origin with the name of the current branch and push the new branch
	alias gpn='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'

	alias gpld='git pull origin develop'
	alias gprd='git pull --rebase origin develop'
	alias gpl='git pull $*'

	#--prune - remove any remote-tracking references that no longer exist on the remote
	alias gf='git fetch -p'

	alias gb='git branch'
	alias gbd='git branch -d $*'
	alias gbdf='git branch -D $*'

	alias gl='git log'
	alias gll='git log --oneline --graph --decorate  $*'
	alias glla='git log --oneline --all --graph --decorate  $*'
	alias gllf='git log --oneline --decorate --name-status $*'

	alias gco='git checkout $1'
	
	alias grs='git reset $*'
	alias grsf='git reset --hard $*'

	alias ga='git add $*'

	alias gc='git commit'
	alias gcm='git commit -m $1'

	alias gcp='git cherry-pick $*'
	alias gcpn='git cherry-pick -n $*'
	alias gcpa='git cherry-pick --abort'
	alias gcpc='git cherry-pick --continue'

	alias gmt='git mergetool'

	alias gd='git diff'

	alias grb='git rebase $*'
	alias gri='git rebase -i $*'
	alias grc='git rebase --continue'
	alias gra='git rebase --abort'
	
	alias gst='git stash'
	alias gsta='git stash apply'

source /usr/share/bash-completion/completions/*
