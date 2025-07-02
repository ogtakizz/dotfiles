#
# ~/.bashrc
#

# Definir localidade
export LANG="pt_BR.UTF-8"
export LC_COLLATE="pt_BR.UTF-8" # Para ordenar strings
export LC_ALL="pt_BR.UTF-8" # <--- ADICIONE ESTA LINHA

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\W\$ '

# Aliases Personalizados

alias sybau='sudo pacman -Syu'
alias p='sudo pacman'
alias gd='gedit'
alias y='yay'
alias fc='fastfetch-custom'
alias config='gedit ~/.config/hypr/hyprland.conf'
alias binds='gedit ~/.config/hypr/configs/binds.conf'
alias unm='unimatrix -c magenta -f -l k -s=95'
alias wbc='gedit ~/.config/waybar/config.jsonc'
alias ktt='gedit ~/.config/kitty/kitty.conf'

#export PATH="$HOME/.local/bin:$PATH"
#fastfetch-custom
neofetch
#export PATH="$HOME/.local/bin:$PATH"
