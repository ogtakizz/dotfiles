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

# Just a little extra to the default "ls -l" command
alias ls='exa -l'

# Updates the packages on the system
alias sybau='sudo pacman -Syu && yay -Syu'

# Just a small shortcut so i don't have to write "sudo pacman" all the time
alias p='sudo pacman'

# Clean cache and useless things from the pacman and yay installations
alias cache='sudo pacman -Scc && yay -Scc'

# Alias for things
alias i='yay -S'         # Install packages from the AUR         
alias r='yay -Rns'       # Completely erase the existence of the package from my computer 
alias s='yay -Ss'        # Search things on the AUR
alias q='yay -Q'         # Query 

# Alias for git things
alias gc='git clone'
alias gadd='git add .'
alias commit='git commit -m'
alias gpush='git push'
alias gpull='git pull'

# Just a shortcut to easier acess to the hyprland config file
alias config='nano ~/.config/hypr/hyprland.conf'

# Another shortcut to my bindings config file
alias binds='nano ~/.config/hypr/configs/binds.conf'

# The "hacker" thingy with matrix on the terminal
alias unm='unimatrix -c magenta -f -l k -s=95'

# Another shortcut, to my waybar config file
alias wbc='nano ~/.config/waybar/config.jsonc'

# Shortcut to acess my kitty config file (who knows when i'll need it?)
alias ktt='nano ~/.config/kitty/kitty.conf'

# I don't really remember what this is, but i'll left it as it is 
#export PATH="$HOME/.local/bin:$PATH"

# Makes neofetch start with the terminal
neofetch

# Clear word
bind '"\C-h": backward-kill-word'
