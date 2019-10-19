#!/usr/bin/env bash

#===================================================================
# Name          :  utilsCheckout.sh
# Description   :  check code based project name
# Arguments     :  $1 project name such as dag/dac/dsc
# Author        :  mengxin
# Date          :  19/02/19
#===================================================================
#
[[ -z "$1" ]] && { echo "Please specify project name" ; exit 1; }
[[ -z "$2" ]] && { echo "Please specify project git url" ; exit 1; }
PROJECT=$1
GIT_REPO=$2
cd repos

if [[ -d ${PROJECT} ]]   # for file "if [-f /home/rama/file]"
then
    echo "${PROJECT} exist"
    cd ${PROJECT}
    git checkout master
    git reset --hard origin/master
    git pull
else
    echo "${PROJECT} not present"
    git clone --depth=1 --branch=master ${GIT_REPO}
    cd ${PROJECT}
fi
