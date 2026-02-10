export LC_ALL=en_US.UTF-8

# Prompt
base_prompt="%F{yellow}%D{%Y-%m-%d %H:%M:%S} %B%F{green}%n@%m %b%F{blue}%d%f"

git_prompt() {
    command git rev-parse --is-inside-work-tree &>/dev/null || return

    local branch dirty
    branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    git diff --quiet --ignore-submodules HEAD &>/dev/null
    [[ $? -ne 0 ]] && dirty="*"

    echo " %F{magenta}[${branch}${dirty}]%f"
}

precmd() {
    local ret=$? gitinfo
    local full_prompt="${base_prompt}$(git_prompt) -> "

    (( ret != 0 )) && PROMPT="%F{red}(${ret})%f ${full_prompt}" || PROMPT="${full_prompt}"

}

# History
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Navigation
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

# Aliases
alias ll="ls -alF --group-directories-first"
alias ducks="du -hs * | sort -hr"
alias reload="source ~/.zshrc"

# Plugins
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zoxide
eval "$(zoxide init --cmd cd zsh)"
