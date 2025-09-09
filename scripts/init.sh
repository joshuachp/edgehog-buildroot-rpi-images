#!/usr/bin/env bash

set -exEuo pipefail

# Trap -e errors
trap 'echo "Exit status $? at line $LINENO from: $BASH_COMMAND"' ERR

mkdir -p output
mkdir -p artifact

if [[ ! -e br2rauc/openssl-ca ]]; then
    pushd br2rauc/
    ./openssl-ca.sh
    popd
fi

./buildroot/support/kconfig/merge_config.sh -O output -m \
    br2rauc/configs/raspberrypi4-64-rauc_defconfig \
    edgehog-buildroot-packages/configs/edgehog_device_runtime_defconfig

make -j"$(nproc)" -C buildroot/ BR2_EXTERNAL=../br2rauc:../edgehog-buildroot-packages O=../output olddefconfig
