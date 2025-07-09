#!/bin/bash

# --- Configurações ---
# Pacotes dos repositórios oficiais (pacman)
PACMAN_PKGS=(
    "git"
    "base-devel"
    "nano"
    "neovim"
    "networkmanager"
    "intel-ucode"
    "efibootmgr"
    "pipewire" "pipewire-pulse" "pipewire-alsa" "pipewire-jack" 
    "grim" "slurp" "wl-clipboard" 
    "xdg-desktop-portal"   
    "brightnessctl"
    "numlockx"
    "pavucontrol"
    "blueberry"
    "thunar"
    "qt5ct" "qt6ct"
    "noto-fonts" "noto-fonts-cjk" "noto-fonts-emoji" # Fontes Noto + Emojis
    "unzip" "unrar" "p7zip"
    "steam"
    "lutris"
    "wine"
    "imagemagick"
    "wev"
    "xdotool" "wmctrl"
    "rofi"
    "kdenlive"
    "swww"
    "vlc"
    "pulsemixer"
    "exa"
    "swaync"
    "hypridle" "hyprlock"
)

# Pacotes do AUR (yay)
AUR_PKGS=(
    "xdg-desktop-portal-hyprland"
    "xwaylandvideobridge"
    "ydotool"
    "vscodium-bin"
    "ttf-jetbrains-mono-nerd"
    "ttf-fira-code-nerd"
    "ttf-unifont"
    "matugen-bin"
    "python-pywalfox
    "python-pywal16"
    "unimatrix-git"
    "protonup-qt"
)

# Pacotes Flatpak (opcional)
FLATPAK_APPS=(
    "com.discordapp.Discord"
    "com.microsoft.Edge"
    "org.telegram.desktop"
    "org.prismlauncher.PrismLauncher"
)

# --- Funções Auxiliares ---
# Função para verificar se um programa está instalado
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# --- Início do Script ---
echo "Iniciando script de instalação..."

# 1. Atualizar o sistema
echo "Atualizando o sistema..."
sudo pacman -Syu --noconfirm || { echo "Falha ao atualizar o sistema Pacman. Abortando."; exit 1; }

# 2. Instalar Yay se não estiver presente
if ! command_exists yay; then
    echo "Yay não encontrado, instalando..."
    sudo pacman -S --noconfirm git base-devel || { echo "Falha ao instalar dependências do Yay. Abortando."; exit 1; }
    (
        cd /tmp
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
    ) || { echo "Falha ao instalar Yay. Abortando."; exit 1; }
    echo "Yay instalado com sucesso."
else
    echo "Yay já está instalado."
fi

# 3. Instalar pacotes Pacman
echo "Instalando pacotes Pacman..."
sudo pacman -S --noconfirm "${PACMAN_PKGS[@]}" || { echo "Falha ao instalar pacotes Pacman. Abortando."; exit 1; }

# 4. Instalar pacotes AUR com Yay
echo "Instalando pacotes AUR com Yay..."
yay -S --noconfirm "${AUR_PKGS[@]}" || { echo "Falha ao instalar pacotes AUR. Abortando."; exit 1; }

# 5. Instalar Flatpaks (se houver)
if [ ${#FLATPAK_APPS[@]} -gt 0 ]; then
    echo "Instalando aplicativos Flatpak..."
    if ! command_exists flatpak; then
        echo "Flatpak não está instalado. Instalando..."
        sudo pacman -S --noconfirm flatpak || { echo "Falha ao instalar Flatpak. Abortando."; exit 1; }
    fi
    for app in "${FLATPAK_APPS[@]}"; do
        flatpak install flathub --or-update --noninteractive "$app" || { echo "Falha ao instalar Flatpak $app."; }
    done
else
    echo "Nenhum aplicativo Flatpak para instalar."
fi

echo "Script de instalação concluído! Lembre-se de configurar dotfiles e reiniciar."
