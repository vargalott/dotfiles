export LC_ALL=en_US.UTF-8

# Prompt
(( $+commands[tput] )) && tput setaf 1 &>/dev/null \
  && base_prompt='%F{magenta}%D{%Y-%m-%d %H:%M:%S} %B%F{red}%n@%m %b%F{blue}%~%f -> ' \
  || base_prompt='%D{%Y-%m-%d %H:%M:%S} %n@%m %~ -> '
precmd() {
    local ret=$?
    (( ret != 0 )) && PROMPT="%F{red}(${ret})%f ${base_prompt}" || PROMPT="${base_prompt}"
}

# Navigation
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

# History
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY_TIME
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -alF --group-directories-first'
alias ducks='du -hs * | sort -hr'
alias reload='source ~/.zshrc'

alias pi='paru -S'
alias pu='paru -Syu'
alias pr='paru -Rs'

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
