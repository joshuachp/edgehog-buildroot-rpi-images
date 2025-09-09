#!/usr/bin/env bash

set -exEuo pipefail

# Trap -e errors
trap 'echo "Exit status $? at line $LINENO from: $BASH_COMMAND"' ERR

make -j"$(nproc)" -Coutput

cp -v output/images/sdcard.img.xz output/images/update.raucb output/images/sdcard.img.bmap artifact/
