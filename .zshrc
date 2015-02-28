# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
setopt appendhistory beep extendedglob nomatch notify
unsetopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/master/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

HOSTNAME="$(hostname)"

#
# OS and Distro detection
#

UNAME="$(uname)"
DISTRO=''

case "$UNAME" in 
    Linux)
        CURRENT_OS='Linux'
        if [[ -f /etc/redhat-release ]]; then
            # CentOS, Fedora, Redhat
            if grep -q "CentOS" /etc/redhat-release; then
                DISTRO='CentOS'
            elif grep -q "Fedora" /etc/redhat-release; then
                DISTRO='Fedora'
            else
                DISTRO='RHEL'
            fi
        fi
        LSB=$(which lsb_release 2>/dev/null)
        if [[ ! -z "$LSB" ]]; then
            # Arch Linux = 'Arch'
            # Debian = 'Debian'
            # Ubuntu = 'Ubuntu'
            DISTRO="$(lsb_release -si)"
        fi
        ;;
    Darwin)
        CURRENT_OS='OS X';;
    CYGWIN*)
        CURRENT_OS='Cygwin'
        DISTRO='Windows'
        ;;
    FreeBSD)
        CURRENT_OS='FreeBSD';;
    NetBSD)
        CURRENT_OS='NetBSD';;
    OpenBSD)
        CURRENT_OS='OpenBSD';;
    SunOS)
        CURRENT_OS='Solaris';;
    *)
        CURRENT_OS="$UNAME";;
esac



#################################################################
#
# Antigen and other ZSH specific plugins
#
#################################################################


# Load antigen
# Grab it if you don't have it
# curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > .antigen.zsh
source ~/.antigen.zsh

# Load various useful lib files
antigen bundle robbyrussell/oh-my-zsh lib/

# Antigen Bundles
antigen bundle git
antigen bundle rsync
# antigen bundle sprunge
antigen bundle sudo
antigen bundle tmuxinator
antigen bundle zsh-users/zsh-syntax-highlighting

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
                antigen bundle centos
                antigen bundle yum
                ;;
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
        antigen bundle cygwin
        ;;
esac

# Theme
eval homedir="~"
antigen theme "${homedir}/.zsh/themes/rik" rik

# Zsh files from custom github
#
# eg.
# antigen bundle jdavis/zsh-files

# ZSH stuff from a private git
# antigen bundle [email protected]:jdavis/secret.git
#


# include common exports
source ~/.exports

# Include common aliases for all shells
source ~/.aliases

# Include common commands for all shells 
source ~/.commonrc

# Include common functions for all shells
source ~/.functions
