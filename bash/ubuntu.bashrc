#-------------------------------UBUNTU--------------------------------------------------------------------
## Aliases
alias e='gio open .'
alias up='sudo apt update && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y'

# add bash completions <- requires bash-completion pkg
[[ -f /etc/profile.d/bash_completion.sh ]] && . /etc/profile.d/bash_completion.sh
#-------------------------------END OF UBUNTU-------------------------------------------------------------
