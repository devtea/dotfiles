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
    antigen use oh-my-zsh

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
    antigen theme spaceship-prompt/spaceship-prompt
    # spaceship-prompt customizations
    SPACESHIP_PROMPT_ADD_NEWLINE="false"
    SPACESHIP_PROMPT_SEPARATE_LINE="true"
    # Time
    SPACESHIP_TIME_SHOW=true
    SPACESHIP_TIME_FORMAT=%T
    SPACESHIP_TIME_PREFIX="~@"
    # User/host
    SPACESHIP_USER_SUFFIX=""
    SPACESHIP_HOST_PREFIX="@"
    SPACESHIP_HOST_SUFFIX=":"
    # Dir
    SPACESHIP_DIR_TRUNC_PREFIX=">=//"
    SPACESHIP_DIR_PREFIX=""
    SPACESHIP_CHAR_SYMBOL="$>"
    SPACESHIP_CHAR_SYMBOL_ROOT="#>"
    # Virtualenv
    SPACESHIP_VENV_PREFIX="via "  #default ="via "
    # k8s
    SPACESHIP_KUBECTL_SHOW="true"
    SPACESHIP_KUBECTL_VERSION_SHOW="false"
    SPACESHIP_KUBECTL_PREFIX=""
    SPACESHIP_KUBECTL_SUFFIX=""
    SPACESHIP_KUBECTL_SYMBOL="⎈"
    # Prompts
    SPACESHIP_PROMPT_ORDER=(
        #time          # Time stamps section
        user          # Username section
        host          # Hostname section
        dir           # Current directory section
        git           # Git section (git_branch + git_status)
        #hg            # Mercurial section (hg_branch  + hg_status)
        #package       # Package version
        #gradle        # Gradle section
        #maven         # Maven section
        #node          # Node.js section
        #ruby          # Ruby section
        #elixir        # Elixir section
        #xcode         # Xcode section
        #swift         # Swift section
        #golang        # Go section
        #php           # PHP section
        #rust          # Rust section
        #haskell       # Haskell Stack section
        #julia         # Julia section
        docker        # Docker section
        #aws           # Amazon Web Services section
        #gcloud        # Google Cloud Platform section
        venv          # virtualenv section
        #conda         # conda virtualenv section
        #pyenv         # Pyenv section
        #dotnet        # .NET section
        #ember         # Ember.js section
        #kubectl       # Kubectl context section
        #terraform     # Terraform workspace section
        #ibmcloud      # IBM Cloud section
        exec_time     # Execution time
        line_sep      # Line break
        battery       # Battery level and status
        vi_mode       # Vi-mode indicator
        jobs          # Background jobs indicator
        exit_code     # Exit code section
        char          # Prompt character
        )
    SPACESHIP_RPROMPT_ORDER=(
        kubectl       # Kubectl context section
        time          # Time stamps section
        )
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

# Include common commands for all shells 
source ~/.commonrc

# zsh specific export
if [[ -e ~/.binenv ]]; then 
    export PATH=~/.binenv:$PATH
    source <(binenv completion zsh)
fi
