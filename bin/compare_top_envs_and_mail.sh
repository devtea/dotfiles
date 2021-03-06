#!/bin/bash
# This is a script to diff the 4 different environments in the topfile and send the 
# results as an email. 
set -euo pipefail
IFS=$'\n\t'

export HOME=/home/dreyer
export TERM=screen-256color
export COLORTERM=screen-256color

cd ~/salt/topfile/
git pull
# Split the topfile into each env, and dump them into separate files
# expect files: base: stg: qa: dev
awk '/^base|^stg|^qa|^dev/{x=$0;}{print > x;}' top.sls

#vimdiff -u /home/dreyer/.vimrc dev: qa: stg: base: -c 'colo gruvbox' -c 'TOhtml' -c 'w! top_diff.html' -c 'qa!' 
vimdiff -u /home/dreyer/.vimrc dev: qa: stg: base: <<EOB

:colo gruvbox
:TOhtml
:w! top_diff.html
:qa!
EOB
### End of vim commands ##################################################################

mail -s "$(date +%F) Topfile env summary" -M text/html -a ./top_diff.html --from-address dreyer@numenor.local tim.dreyer@ascendlearning.com < ./top_diff.html
rm -f base: stg: qa: dev: top_diff.html
