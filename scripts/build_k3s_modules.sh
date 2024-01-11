#!/bin/bash

source /scripts/vars.sh

echo "Building k3s modules for DSM $DSM_VERSION"

chroot /synology/env /bin/bash
cd /usr/local/linux-3.10.x/
cp synoconfigs/braswell .config
make menuconfig
