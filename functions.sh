#!/usr/bin/env bash
# author: j4ckstraw
# history: 2018/05/05
# function: collect bash snippets, some function you may needed.

# DEBUG switch
# set -x

#############
#RETURE CODE#
#############
SUCCESS=0
E_NOARGS=64
E_WRONGARGS=65
E_NOTROOT=67

function usage() {
    if [ $# -lt 1 ]
    # if [ -z "$1" ]
    then
        echo "Bash snippets example version 1.0"
        echo "Usage: `basename $0` [options] command"
        echo ""
        echo "Examples:"
        echo " `basename $0` command"
        exit $E_NOARGS
    fi
}

function root_privilege_check() {
    if [ `id -u` -ne 0 ]; then
        echo "Root privilege needed."
        echo "Try \"sudo $0\""
        exit $E_NOTROOT
    fi
}

function menu() {
	# http://programmingexamples.wikidot.com/bash-scripting
    while :
    do
        clear
        echo "-------------------------------------"
        echo " Main Menu "
        echo "-------------------------------------"
        echo "[1] Show Todays date/time"
        echo "[2] Show files in current directory"
        echo "[3] Show calendar"
        echo "[4] Start editor to write letters"
        echo "[5] Exit/Stop"
        echo "======================="
        echo -n "Enter your menu choice [1-5]: "
        read your_choice
        case $your_choice in
            1) echo "Today is `date` , press a key. . ." ; read ;;
            2) echo "Files in `pwd`" ; ls -l ; echo "Press a key. . ." ; read ;;
            3) cal ; echo "Press a key. . ." ; read ;;
            4) vi ;;
            5) exit $SUCCESS ;;
            *) echo "Opps!!! Please select choice 1,2,3,4, or 5";
               echo "Press a key. . ." ; read ;;
         esac
    done
}

# root_privilege_check
# usage
menu
exit $SUCCESS