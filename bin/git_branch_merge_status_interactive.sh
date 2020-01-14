#!/bin/bash
# this script check to see what branches are merged into the main four
# env branches and sends a diff
set -x
set -euo pipefail
IFS=$'\n\t'

export TERM=screen-256color
export COLORTERM=screen-256color

cd ~/salt/states/

git fetch -p

for i in {master,stg,dev,qa}; do 
    echo "Branch ${i}" > /tmp/"${i}".txt; git branch -r --merged origin/"${i}" | \
        sort | \
        grep -vP 'origin/(master|stg|qa|dev)$' >> /tmp/"${i}".txt
done

vimdiff /tmp/{dev,qa,stg,master}.txt 

rm -f ./diff.html /tmp/{dev,qa,stg,master}.txt
