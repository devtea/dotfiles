#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

##################
#    EXAMPLES    #
##################
# Simple commands
#
# REMOTE_CMD="uname -a"
#
# REMOTE_CMD="sudo rpm -q sudo | grep -c 'sudo-1.8.23-10.el7_9.2.x86_64'"
#
#
# More complex commands with quotes or variables in them must be handled
# carefully to prevent local variable expansion
#
# REMOTE_CMD='uname -a | awk '\''{print $2, "-", $3}'\'
# 
#
# More complex commands and scripts can be embedded, though if it gets too 
# complicated it's probably better to rsync a file to the remote host and 
# run it there.
# 
# 
# REMOTE_CMD='
# echo "starting remote script..."
# uname -a | awk '\''{print $2, "-", $3}'\''
# 
# echo "Hostname: $HOSTNAME"
# echo "Date: $(date)"
# echo "Uptime: $(uptime)"
# 
# for i in {2..3}; do
#     echo "foo $i"
# done
# 
# echo done
# '
REMOTE_CMD="uname -a"


KUBERNETES_NODE_LIST=$(kubectl get nodes --no-headers -o custom-columns=NAME:.metadata.name)

# Print list of nodes and command to be run
echo "Targeting the following nodes:"
echo "$KUBERNETES_NODE_LIST"

echo ""
echo "Running the following command on each node:"
echo "$REMOTE_CMD"

echo ""
read -rp "Continue? [y/N] " USER_CONFIRMATION
if [[ ! "$USER_CONFIRMATION" =~ ^[Yy]$ ]]; then
    echo "Aborting."
    exit 1
fi
unset USER_CONFIRMATION

FIRST_ITERATION="true"
for NODE_NAME in $KUBERNETES_NODE_LIST; do
    echo ""
    echo "Running against: ${NODE_NAME}"
    #REMOTE_OUTPUT="none"
    REMOTE_OUTPUT=$(ssh -n -t -t "${NODE_NAME}" "${REMOTE_CMD}")
    echo "Output:"
    echo "${REMOTE_OUTPUT}"

    if [[ $FIRST_ITERATION == "true" ]]; then
        echo ""
        echo "Pausing after the first host for confirmation."
        echo "There will be no further pauses."
        read -rp "Continue? [y/N] " USER_CONFIRMATION
        if [[ ! "$USER_CONFIRMATION" =~ ^[Yy]$ ]]; then
            echo "Aborting."
            exit 1
        fi
        FIRST_ITERATION="false"
    fi
    sleep 0.5
done
