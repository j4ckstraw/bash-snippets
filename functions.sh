#!/usr/bin/env bash
# author: j4ckstraw
# history: 2018/05/05
# function: collect bash snippets, some function you may needed.

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

root_privilege_check
usage
