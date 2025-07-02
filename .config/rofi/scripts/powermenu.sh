#!/bin/bash

# Opções que serão exibidas no Rofi (agora com nomes de ícones)
options="Desligar\0icon\x1fsystem-shutdown\n" # Ícone de desligar
options+="Reiniciar\0icon\x1fsystem-reboot\n" # Ícone de reiniciar
options+="Sair da Sessão\0icon\x1fsystem-log-out\n" # Ícone de sair da sessão
options+="Suspender\0icon\x1fsystem-suspend\n" # Ícone de suspender
options+="Hibernar\0icon\x1fsystem-hibernate" # Ícone de hibernar (sem '\n' no final para a última opção)

# Opções que serão exibidas no Rofi
options="Desligar\nReiniciar\nSair da Sessão\nSuspender\nHibernar"

# Envia as opções para o Rofi e captura a seleção do usuário
# -dmenu: usa o modo dmenu do Rofi, que pega input via pipe
# -p "Opções de Energia:": define o prompt que aparece no Rofi
selected_option=$(echo -e "$options" | rofi -dmenu -p "Opções de Energia:")

# Executa a ação com base na seleção
case "$selected_option" in
    "Desligar")
        systemctl poweroff
        ;;
    "Reiniciar")
        systemctl reboot
        ;;
    "Sair da Sessão")
        # Para sair do Hyprland de forma limpa (recomendado para Wayland)
        hyprctl dispatch exit
        ;;
    "Suspender")
        systemctl suspend
        ;;
    "Hibernar")
        systemctl hibernate
        ;;
    *)
        # Faz nada se o usuário cancelar (Esc) ou não selecionar nada
        ;;
esac
