#!/usr/bin/env bash
# simple script to check if a process is running, and start it if not
# Arg 1 is the command to run to start the process
# Arg 2 is an optional string to search for if the process doesn't run under
# the same name as it starts with
set -euo pipefail
IFS=$'\n\t'
set -x

SERVICECMD="$1"
set +u
if [[ -z $2 ]]; then
    set -u
    SERVICENAME="$SERVICECMD"
else
    set -u
    SERVICENAME=$2
fi

pgrep "$SERVICENAME" || bash -c "$SERVICECMD"

