#
# ~/.bashrc
#
ROOT_UID=0   # Root has $UID 0.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#enable tab completion for sudo
complete -cf sudo

# include common exports
source ~/.exports

#colors for ps1
RESET='\[\033[0m\]'

BLACK='\[\033[0;30m\]'
RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
BROWN='\[\033[0;33m\]'
BLUE='\[\033[0;34m\]'
PURPLE='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
L_GREY='\[\033[0;37m\]'

D_GREY='\[\033[1;30m\]'
L_RED='\[\033[1;31m\]'  # orange under solarized
L_GREEN='\[\033[1;32m\]'
YELLOW='\[\033[1;33m\]'
L_BLUE='\[\033[1;34m\]'
L_PURPLE='\[\033[1;35m\]'
L_CYAN='\[\033[1;36m\]'
WHITE='\[\033[1;37m\]'

case "$HOSTNAME" in
        khazaddum)
            CHOST="$L_RED"	
            CPATH="$GREEN"
            ;;
        lothlorien)
            CHOST="$L_PURPLE"
            CPATH="$GREEN"
            ;;
        osgiliath)
            CHOST="$BROWN"
            CPATH="$GREEN"
            ;;
        *)
            CHOST="$CYAN"
            CPATH="$GREEN"
            ;;
esac
CNEUT="$RESET"

if [ "$UID" -eq "$ROOT_UID" ]; then
    CHOST="$RED"
    PS1="${CHOST}\h:[${CPATH}\w${CHOST}]\n\\$ ${CNEUT}"
else
    PS1="${CHOST}\u@\h:[${CPATH}\w${CHOST}]\n\\$ ${CNEUT}"
fi

PS1="${CHOST}\u@\h:[${CPATH}\w${CHOST}]\n\\$ ${CNEUT}"


# Include common aliases for all shells
source ~/.aliases

# Include common commands for all shells 
source ~/.commonrc

# Include common functions for all shells
source ~/.functions
