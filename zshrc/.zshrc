# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh --cmd cd)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Generated for envman by https://webinstall.dev/. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Added for nvim switcher (https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b)
alias lz="nvim"
#alias lz="NVIM_APPNAME=Lazyvim nvim"
#alias nvchad="NVIM_APPNAME=Nvchad nvim"

#function nv() {	
#  items=("Lazyvim" "Nvchad" "default")
#  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config " --height=~50% --layout=reverse --border --exit-0)
#  if [[ -z $config ]]; then
#    echo "Nothing selected"
#    return 0
#  elif [[ $config == "default" ]]; then
#    config=""
#  fi
#  NVIM_APPNAME=$config nvim $@
#}
#
#bindkey -s ^a "nv\n"

# eza
export EZA_CONFIG_DIR=~/.config/eza/

# aliases
alias ls="eza --icons=always --color=always -a --group-directories-first"
alias ll="eza --icons=always --color=always -a --group-directories-first --git --long"
alias c="clear"
alias lzi='lz $(fzf -m --preview="bat --color=always {}")'
alias q="exit"
#starship
eval "$(starship init zsh)"

#zoxide
export _ZO_DATA_DIR=~/.config/zoxide/
export PATH="./bin:$HOME/.local/bin:$HOME/.local/share/fedorator/bin:$PATH"
export FEDORATOR_PATH="/home/$USER/.local/share/fedorator"
export EDITOR="nvim"
