# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
setopt appendhistory beep extendedglob nomatch notify
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
if [[ ! -f ~/.antigen.zsh ]]; then
    if curl -L https://cdn.rawgit.com/zsh-users/antigen/master/bin/antigen.zsh > ~/.antigen.zsh; then
        echo "Successfully downloaded antigen"
    else
        echo "Unable to download antigen"
    fi
fi

# Load antigen
if [[ -f ~/.antigen.zsh ]]; then
    source ~/.antigen.zsh

    # Load various useful lib files
    antigen use oh-my-zsh

    # Antigen Bundles
    antigen bundle git
    antigen bundle rsync
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
                    antigen bundle yum;;
                Debian)
                    antigen bundle debian;;
                Fedora)
                    antigen bundle systemd
                    antigen bundle yum
                    ;;
                Suse)
                    antigen bundle suse;;
                Ubuntu)
                    antigen bundle ubuntu;;
            esac
            ;;
        Cygwin)
            # antigen bundle cygwin
            ;;
    esac

    # Theme
    eval homedir="~"
    antigen theme "${homedir}/.zsh/themes/rik" rik

    #
    # More antigen examples
    #

    # Zsh files from custom github
    #
    # eg.
    # antigen bundle jdavis/zsh-files

    # ZSH stuff from a private git
    # antigen bundle [email protected]:jdavis/secret.git
    #

    antigen apply
fi

# include common exports
source ~/.exports

# Include common aliases for all shells
source ~/.aliases

# Include common functions for all shells
source ~/.functions

# Include common commands for all shells 
source ~/.commonrc
