#-------------------------------DEFAULT-------------------------------------------------------------------
# if bash isn't running interactively return
[[ $- != *i* ]] && return
[ -z "$PS1" ] && return

# disable software flow control (Ctrl+s suspends the session)
if [[ -t 0 && $- = *i* ]]; then
	stty -ixon
fi

### ALIASES
## General
alias ~='cd ~'
alias ..='cd ../'
alias ...='cd ../../'
alias ls='exa'
alias ll='ls -la'
alias emacs='emacs -nw'
alias c='codium .'
alias r='rider $(find ./ -name *.sln -print -quit) &>/dev/null &'

## Python
alias py='python'

## Docker
alias drm='docker rm $(docker ps -a -q)'
alias drmi='docker rmi $(docker images -q)'

##Git
alias gs='git status'

alias gcl='git clone $@'

alias gp='git push $@'

#create a new branch on origin with the name of the current branch and push the new branch
alias gpn='gp -u'
alias gpf='gp --force-with-lease'

alias gpl='git pull $@'
alias gplm='gpl origin master'
alias gpr='gpl --rebase'
alias gprm='gpl --rebase origin master'

alias gf='git fetch'

alias gb='git branch $@'
alias gbd='gb -d $1'
alias gbdf='gb -D $1'

alias gl='git log $@'
alias gll='gl --oneline --graph --decorate $1'
alias glla='gl --oneline --all --graph --decorate $1'
alias gllf='gl --oneline --decorate --name-status $1'

alias gco='git checkout $@'
alias gcom='gco master'
alias gcob='gco -b $1'

alias grs='git reset $@'
alias grsf='grs --hard $1'
alias grsh='git_smart_reset'

alias grr='git restore $@'
alias grrs='grr --staged $1'

alias ga='git add $@'
alias gaa='ga .'

alias gc='git commit $@'
alias gcm='gc -m $1'
alias gcam='gc --amend --no-edit'
alias gcam='gc --amend'

alias gam='gaa && gcm'

alias gcp='git cherry-pick $@'
alias gcpn='gcp -n $@'
alias gcpa='gcp --abort'
alias gcpc='gcp --continue'

alias gmt='git mergetool'

alias gd='git diff'
alias gdc='gd --cached'
alias gdh='git_smart_diff'
alias gdt='git difftool'

alias grb='git rebase $@'
alias gri='grb -i $1'
alias grih="git_smart_rebase"
alias grc='grb --continue'
alias gra='grb --abort'

alias gst='git stash'
alias gsta='gst apply'
alias gstc='gst clear'

alias gcn='git clean $@'
alias gcnf='gcn -f'
alias gcnd='gcn -fd'
alias gcrb='git_delete_stale_remote_branches'
alias gclb='git_delete_stale_local_branches'
alias gcnb='gcrb && gclb'

alias gsh='git show $@'

git_smart_rebase() { git rebase -i HEAD~$1; }
git_smart_diff() { git show HEAD~$1; }
git_smart_reset() { git reset HEAD~$1; }
git_delete_stale_remote_branches() { gf && gb -vv | awk '/^[^\*].*\[origin\/.*gone\]/ {print $1}' | xargs -r gbdf; }
git_delete_stale_local_branches() { gf && gb -vv | awk '!/^\*|\[origin\// {print $1}' | xargs -r gbdf; }

# setup git autocompletion
if [ -f "/usr/share/bash-completion/completions/git" ]; then
	source /usr/share/bash-completion/completions/git
	__git_complete gco _git_checkout
else
	echo "Error loading git completions"
fi

# use bash-completion, if available
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo
		echo
	done
}

# Change the window title of X terminals
case ${TERM} in
xterm* | rxvt* | Eterm* | aterm | kterm | gnome* | interix | konsole*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
	;;
screen*)
	PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
	;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?} # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs} ]] &&
	type -P dircolors >/dev/null &&
	match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color}; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null; then
		if [[ -f ~/.dir_colors ]]; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]]; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]]; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]]; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

xhost +local:root >/dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex() {
	if [ -f $1 ]; then
		case $1 in
		*.tar.bz2) tar xjf $1 ;;
		*.tar.gz) tar xzf $1 ;;
		*.bz2) bunzip2 $1 ;;
		*.rar) unrar x $1 ;;
		*.gz) gunzip $1 ;;
		*.tar) tar xf $1 ;;
		*.tbz2) tar xjf $1 ;;
		*.tgz) tar xzf $1 ;;
		*.zip) unzip $1 ;;
		*.Z) uncompress $1 ;;
		*.7z) 7z x $1 ;;
		*) echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}
#-------------------------------END OF DEFAULT------------------------------------------------------------
