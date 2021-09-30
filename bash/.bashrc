#-------------------------------DEFAULT-------------------------------------------------------------------
# Aliases
	##General
	alias ~='cd ~'
	alias ..='cd ../'
	alias ...='cd ../../'
	alias ls='exa'
	alias ll='ls -la'
	alias emacs='emacs -nw'
	alias c='codium .'
	alias r='rider $(find ./ -name *.sln -print -quit) &>/dev/null &'

	## Python
	alias jn='jupyter notebook'
	alias py='python'
	alias psh='pipenv shell'

	## Docker
	alias drm='docker rm $(docker ps -a -q)'
	alias drmi='docker rmi $(docker images -q)'

	##Git
	alias gs='git status'

	alias gcl='git clone $1'

	alias gp='git push'
	#create a new branch on origin with the name of the current branch and push the new branch
	alias gpn='git push -u'
	alias gpf='git push --force-with-lease'

	alias gplm='git pull origin master'
	alias gprm='git pull --rebase origin master'
	alias gpl='git pull $@'

	#--prune - remove any remote-tracking references that no longer exist on the remote <- done by .gitconfig
	alias gf='git fetch'

	alias gb='git branch'
	alias gbd='git branch -d $@'
	alias gbdf='git branch -D $@'

	alias gl='git log'
	alias gll='git log --oneline --graph --decorate  $@'
	alias glla='git log --oneline --all --graph --decorate $@'
	alias gllf='git log --oneline --decorate --name-status $@'

	alias gco='git checkout $1'

	alias grs='git reset $@'
	alias grsf='git reset --hard $@'

	alias grr='git restore $@'
	alias grrs='git restore --staged $@'

	alias ga='git add $@'

	alias gc='git commit'
	alias gcm='git commit -m $@'
	alias gca='git commit --amend $@'

	alias gam='git add . && git commit -m $@'

	alias gcp='git cherry-pick $@'
	alias gcpn='git cherry-pick -n $@'
	alias gcpa='git cherry-pick --abort'
	alias gcpc='git cherry-pick --continue'

	alias gmt='git mergetool'

	alias gd='git diff'
	alias gdc='git diff --cached'
	alias gds='git_smart_diff'
	alias gdt='git difftool'

	alias grb='git rebase $@'
	alias gri='git rebase -i $@'
	alias grih="git_smart_rebase"
	alias grc='git rebase --continue'
	alias gra='git rebase --abort'

	alias gst='git stash'
	alias gsta='git stash apply'
    alias gstc='git stash clear'

	alias gcn='git clean -f'
	alias gcnd='git clean -fd'
	alias gcrb='git_delete_stale_remote_branches'
	alias gclb='git_delete_stale_local_branches'
    alias gcnb='gcrb && gclb'

git_smart_rebase() { git rebase -i HEAD~$1; }
git_smart_diff() { git show HEAD~$1; }
git_delete_stale_remote_branches() { gf && git branch -vv | awk '/^[^\*].*\[origin\/.*gone\]/ {print $1}' | xargs -r git branch -D; }
git_delete_stale_local_branches() { gf && git branch -vv | awk '!/^\*|\[origin\// {print $1}' | xargs -r git branch -D; }

# add bash completions <- requires bash-completion pkg
source /etc/profile.d/bash_completion.sh

if [[ -t 0 && $- = *i* ]]; then
	stty -ixon
fi
#-------------------------------END OF DEFAULT------------------------------------------------------------
