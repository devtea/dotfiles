#!/bin/bash
# this script check to see what branches are merged into the main four
# env branches and sends a diff
set -euo pipefail
IFS=$'\n\t'

export HOME=~
export TERM=screen-256color
export COLORTERM=screen-256color

cd ~/salt/states/

git fetch -p

for i in {master,stg,dev,qa}; do 
    echo "Branch ${i}" > /tmp/"${i}".txt; git branch -r --merged origin/"${i}" | \
        grep -vP 'origin/(master|stg|qa|dev)$' | \
        sort >> /tmp/"${i}".txt
done

#vimdiff -u /home/tim//.vimrc dev: qa: stg: base: -c 'colo gruvbox' -c 'TOhtml' -c 'w! diff.html' -c 'qa!' 
vimdiff -u /home/tim//.vimrc /tmp/{dev,qa,stg,master}.txt <<EOB

:colo gruvbox
:TOhtml
:w! diff.html
:qa!
EOB
### End of vim commands ##################################################################

mail -s "$(date +%F) Git branch state" -M text/html -a ./diff.html --from-address dreyer@numenor.local tim.dreyer@ascendlearning.com < ./diff.html
rm -f ./diff.html /tmp/{dev,qa,stg,master}.txt
