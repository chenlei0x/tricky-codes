#!/bin/bash
# ensure running as root
#https://blog.rodneyrehm.de/archives/36-Always-Run-Script-As-Root.html
if [ "$(id -u)" != "0"  ]; then
	exec sudo "$0" "$@" 
fi
echo $USER
