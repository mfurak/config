#-------------------------------DEFAULT-------------------------------------------------------------------
# ignore case while completing
unsetopt BEEP

# ignore case while completing
unsetopt CASE_GLOB

# import shell aliases
for f in ~/.aliases/*.shell_aliases; do source $f; done

# starship init
eval "$(starship init zsh)"
#-------------------------------END OF DEFAULT------------------------------------------------------------
