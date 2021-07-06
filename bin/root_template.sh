#!/usr/bin/env bash
# template so I can remember how to elevate a script to root easily

echo "Checkin' for root"
if [[ $EUID -ne 0 ]]; then
    echo "Relaunching as root"
    sudo "$0" "$@"
    exit
fi
