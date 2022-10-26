#-------------------------------DEFAULT-------------------------------------------------------------------
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
alias gca='gc --amend'

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

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

if [[ -t 0 && $- = *i* ]]; then
	stty -ixon
fi

eval "$(starship init bash)"
#-------------------------------END OF DEFAULT------------------------------------------------------------
