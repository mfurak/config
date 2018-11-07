
# Aliases
	##general
	alias ~='cd ~'
	alias ..='cd ../'
	alias ...='cd ../../'
	alias ll='ls -la'
	alias .='explorer .'

	##Git 
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

# Git prompt setup
source ~/.git-prompt.sh
function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt

#export PS1="[\[\033[32m\]\w]\[\033[0m\]\$(__git_ps1)\n\[\033[1;36m\]\u\[\033[32m\]$ \[\033[0m\]""