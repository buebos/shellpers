# Shellpers zsh customization

autoload -Uz vcs_info
precmd() { vcs_info; }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

zinit light zdharma-continuum/fast-syntax-highlighting

shellpers_workflow_zsh_customize=true

# End of customization
