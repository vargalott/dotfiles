export LC_ALL=en_US.UTF-8
export TERM=xterm-kitty

# history
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

# navigation
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

# aliases
alias ls="eza --color always --icons always --time-style long-iso --git --modified"
alias lt="ls --tree"
alias ll="ls -aal --group-directories-first"
alias ducks="du -hs * | sort -hr"
alias reload="source ~/.zshrc"

# plugins
# source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/ys.omp.json)"
