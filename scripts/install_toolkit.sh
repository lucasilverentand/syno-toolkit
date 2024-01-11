#/bin/bash

source /scripts/vars.sh

echo "Installing synology toolkit for DSM $DSM_VERSION"

# Download synology toolkit
mkdir -p /tmp/synology-toolkit
cd /tmp/synology-toolkit
curl -O https://global.download.synology.com/download/ToolChain/toolkit/${DSM_VERSION}/base/base_env-${DSM_VERSION}.txz
curl -O https://global.download.synology.com/download/ToolChain/toolkit/${DSM_VERSION}/${ARCH}/ds.${ARCH}-${DSM_VERSION}.dev.txz
curl -O https://global.download.synology.com/download/ToolChain/toolkit/${DSM_VERSION}/${ARCH}/ds.${ARCH}-${DSM_VERSION}.env.txz
curl -O https://global.download.synology.com/download/ToolChain/Synology%20NAS%20GPL%20Source/${DSM_VERSION}-${GPL_HASH}/${ARCH}/linux-${LINUX_VERSION}.txz

sleep 10

# Install synology toolkit
mkdir -p /synology/env
cd /synology/env
tar -xJf /tmp/synology-toolkit/base_env-${DSM_VERSION}.txz 
tar -xJf /tmp/synology-toolkit/ds.${ARCH}-${DSM_VERSION}.dev.txz
tar -xJf /tmp/synology-toolkit/ds.${ARCH}-${DSM_VERSION}.env.txz
tar -xJf /tmp/synology-toolkit/linux-${LINUX_VERSION}.txz

# Cleanup
rm -rf /tmp/synology-toolkit