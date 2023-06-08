# Spaceship Prompt Configuration
# https://spaceship-prompt.sh/config/intro/#Configure-your-prompt

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
    pulumi        # Pulumi stack section
    python        # Python section
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
    #vi_mode       # Vi-mode indicator
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    sudo          # Sudo indicator
    char          # Prompt character
    )
SPACESHIP_RPROMPT_ORDER=(
    kubectl       # Kubectl context section
    time          # Time stamps section
    )