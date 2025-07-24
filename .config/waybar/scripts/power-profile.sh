#!/bin/bash

# Ação principal: obter o perfil atual
current_profile=$(powerprofilesctl get)

# Lógica para alternar o perfil quando o script é chamado com o argumento "toggle"
if [ "$1" == "toggle" ]; then
    case "$current_profile" in
        "balanced")
            powerprofilesctl set performance
            ;;
        "performance")
            powerprofilesctl set power-saver
            ;;
        "power-saver")
            powerprofilesctl set balanced
            ;;
        *)
            # Caso um perfil desconhecido, volta para balanced como padrão
            powerprofilesctl set balanced
            ;;
    esac
    # Após definir o novo perfil, o script sai e a Waybar vai executá-lo novamente (via interval)
    # para obter o novo status.
    exit 0
fi

# Comportamento padrão (se não houver argumento "toggle"): exibir o perfil atual
case "$current_profile" in
    "balanced")
        echo "󰾆 " # Ícone Nerd Font para 'balanced'
        ;;
    "performance")
        echo "󰓅 " # Ícone Nerd Font para 'performance'
        ;;
    "power-saver")
        echo "🌿" # Ícone Nerd Font para 'power saver'
        ;;
    *)
        echo "󰠠 " # Ícone Nerd Font para estado desconhecido
        ;;
esac
