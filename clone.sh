#!/bin/sh

BRANCHNAME=fsl-zeus
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# 'repo' command
REPO_DIR=$SCRIPT_DIR/bin
REPO=$REPO_DIR/repo

# get 'repo'
if [ ! -e $REPO ]; then
    mkdir -p $REPO_DIR
    wget  -P $REPO_DIR http://commondatastorage.googleapis.com/git-repo-downloads/repo
    chmod a+x ${REPO}
fi
PATH=${REPO_DIR}:$PATH

LOCAL_MIRROR=$SCRIPT_DIR/mirror

mkdir -p $LOCAL_MIRROR
cd $LOCAL_MIRROR
repo init -u https://github.com/varigit/variscite-bsp-platform.git -b $BRANCHNAME --mirror
repo sync -j$(nproc --all)
