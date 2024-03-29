# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
setopt appendhistory beep extendedglob nomatch notify 
setopt HIST_IGNORE_SPACE HIST_FIND_NO_DUPS HIST_IGNORE_ALL_DUPS
unsetopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "~/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

HOSTNAME="$(hostname)"

# Try to detect what os/distro we're running on
source ~/.distro_detect

#################################################################
#
# Antigen and other ZSH specific plugins
#
#################################################################

# Try to grab antigen if it's not already there
if [[ ! -f ~/antigen.zsh ]]; then
    if curl -L https://cdn.rawgit.com/zsh-users/antigen/master/bin/antigen.zsh > ~/antigen.zsh; then
        echo "Successfully downloaded antigen"
    else
        echo "Unable to download antigen"
    fi
fi

# Load antigen
if [[ -f ~/antigen.zsh ]]; then
    source ~/antigen.zsh

    # Load various useful lib files
    #antigen use oh-my-zsh

    # Antigen Bundles
    antigen bundle git
    antigen bundle git-prompt
    antigen bundle rsync
    antigen bundle command-not-found
    # antigen bundle sprunge
    antigen bundle sudo
    antigen bundle tmuxinator
    antigen bundle zsh-users/zsh-syntax-highlighting
    antigen bundle kubectl

    # Python plugins
    antigen bundle pip
    antigen bundle pep8
    antigen bundle python
    antigen bundle virtualenv

    # OS or distro specific 
    case "$CURRENT_OS" in 
        Linux)
            case "$DISTRO" in 
                Arch)
                    antigen bundle archlinux
                    antigen bundle systemd
                    ;;
                CentOS)
                    antigen bundle yum
                    ;;
                Debian)
                    antigen bundle debian
                    ;;
                Fedora)
                    antigen bundle systemd
                    antigen bundle dnf
                    ;;
            esac
            ;;
    esac

    # Theme
    # Spaceship Prompt https://spaceship-prompt.sh
    antigen theme spaceship-prompt/spaceship-prompt

    antigen apply
fi

# Include common commands for all shells 
source ~/.commonrc

# zsh specific export
if [[ -e ~/.binenv ]]; then 
    export PATH=~/.binenv:$PATH
    source <(binenv completion zsh)
fi
