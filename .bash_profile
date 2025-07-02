#
# ~/.bash_profile
#
# Adiciona diretórios pessoais de binários ao PATH apenas se existirem e ainda não estiverem no PATH
if [ -d "$HOME/.local/bin" ] ; then
    case ":$PATH:" in
        *":$HOME/.local/bin:"*) # Se já estiver no PATH
            ;;
        *) # Se não estiver no PATH, adiciona
            export PATH="$HOME/.local/bin:$PATH"
            ;;
    esac
fi

if [ -d "$HOME/.npm-global/bin" ] ; then
    case ":$PATH:" in
        *":$HOME/.npm-global/bin:"*) # Se já estiver no PATH
            ;;
        *) # Se não estiver no PATH, adiciona
            export PATH="$HOME/.npm-global/bin:$PATH"
            ;;
    esac
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
