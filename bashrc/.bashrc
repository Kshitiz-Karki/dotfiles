# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc

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
#bind -x '"\C-a": nv'

# eza
export EZA_CONFIG_DIR=~/.config/eza/
# aliases
alias ls="eza --icons=always --color=always -a --group-directories-first"
alias ll="eza --icons=always --color=always -a --group-directories-first --git --long"
alias c="clear"
alias q="exit"
alias rm="trash-put"
alias updateAllApps="sudo dnf update -y && flatpak update"

#starship
eval "$(starship init bash)"
export PATH="./bin:$HOME/.local/bin:$HOME/.local/share/fedorator/bin:$PATH"
export FEDORATOR_PATH="/home/$USER/.local/share/fedorator"
export EDITOR="nvim"
