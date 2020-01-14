#!/bin/bash
# This script refreshes the git salt states repo data and looks for old remote branches
# A summary is sent via email.
set -euo pipefail
IFS=$'\n\t'

# The path to the target repo
REPO=~"/salt/states"

# Destination email address
EMAIL_TO="tim.dreyer@ascendlearning.com"

# "from" email address
EMAIL_FROM="dreyer@numenor.local"

# Subject
EMAIL_SUBJECT="$(date +%F) Old Git Branch Summary"



cd ${REPO}
git fetch -p
git for-each-ref --sort=committerdate refs/remotes --format='%(HEAD) %(refname:short) - %(authorname) (%(committerdate:relative))' | \
    grep -vP 'origin/(HEAD|master|stg|qa|dev)|(seconds|minutes|hours|days) ago' | \
    mail -s "${EMAIL_SUBJECT}" --from-address ${EMAIL_FROM} ${EMAIL_TO}
