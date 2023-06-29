#-------------------------------DEFAULT-------------------------------------------------------------------
# don't beep the terminal
unsetopt BEEP

# case insensitive path-completion
autoload -Uz +X compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# import shell aliases
for f in ~/.aliases/*.shell_aliases; do source $f; done

# starship init
eval "$(starship init zsh)"
#-------------------------------END OF DEFAULT------------------------------------------------------------
