I won't make a script to automate all of this because i'm too lazy. I'll simply make a step by step so i don't forget anything.

Post install (i use arch btw)

run "sudo pacman -S git"

Then, with git installed, clone this repository to your home
"git clone https://github.com/ogtakizz/dotfiles.git && cd dotfiles"

Copy the .gitconfig to your home
"sudo cp ~/dotfiles/.gitconfig ~/"

Install the apps on the Installation file

"sudo pacman -S swww rofi waybar sddm hyprlock hypridle nautilus lxappearance network-manager-applet swaync vlc flatpak && yay -S matugen-bin python-pywal16"

After installing the essential, create symbolic links from the dotfiles to your .config

"ln -s ~/dotfiles/.config/hypr ~/.config"
"ln -s ~/dotfiles/.config/kitty ~/.config"
"ln -s ~/dotfiles/.config/waybar ~/.config"
"ln -s ~/dotfiles/.config/rofi ~/.config"
"ln -s ~/dotfiles/.config/matugen ~/.config"
"ln -s ~/dotfiles/.config/neofetch ~/.config"
"ln -s ~/dotfiles/.bashrc ~/"
"ln -s ~/dotfiles/.bash_profile ~/"
"ln -s ~/dotfiles/.local/bin/walify ~/.local/bin/" (If the directory doesn't exist, run "sudo mkdir ~/.local/bin")
"ln -s ~/dotfiles/.local/walify-backend ~/.local/bin"


Then you create your symbolic links (i don't know how to use stow yet)

You're ready to go...i think...
