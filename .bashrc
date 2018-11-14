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
	alias grd='git pull --rebase origin develop'
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

# # Git prompt setup
# source ~/.git-prompt.sh
# function color_my_prompt {
#     local __user_and_host="\[\033[01;32m\]\u@\h"
#     local __cur_location="\[\033[01;34m\]\w"
#     local __git_branch_color="\[\033[31m\]"
#     local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
#     local __prompt_tail="\[\033[35m\]$"
#     local __last_color="\[\033[00m\]"
#     export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
# }
# color_my_prompt
# 
# # export PS1="\[\e[0;32m\]\u\[\e[0;32m\]@\[\e[0;32m\]\h \[\e[0;33m\]\w \[\e[0;36m\]$(__git_ps1) \[\e[0m\]\n$ "

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

#export PS1="\[\e[32m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\] \[\e[35m\]\s\[\e[m\] \[\e[33m\]\w\[\e[m\] \[\e[36m\]\`parse_git_branch\`\[\e[m\]\\n\$ "
