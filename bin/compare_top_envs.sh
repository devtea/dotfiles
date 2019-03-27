#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd ~/salt/topfile/
git pull
awk '/^base|^stg|^qa|^dev/{x=$0;}{print > x;}' top.sls
vimdiff dev: qa: stg: base:
cat base: stg: qa: dev: > top.sls.new
rm -f base: stg: qa: dev:

# Check to see if anything has actually changed
if ! diff top.sls.new top.sls 1>/dev/null; then
    mv top.sls.new top.sls
    echo "Changes made - inspect and commit your changes."
    sleep 2
    git diff top.sls
else
    rm top.sls.new
    echo "No changes made."
fi 
