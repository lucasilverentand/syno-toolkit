#/bin/bash

# You can find the latest values for below here:
# https://archive.synology.com/download/ToolChain

ARCH=$1
DSM_VERSION=$2
GPL_VERSION=$3

echo "ARCH: $ARCH"
echo "DSM_VERSION: $DSM_VERSION"
echo "GPL_VERSION: $GPL_VERSION"

# Exit if any of the variables are empty
if [ -z "$DSM_VERSION" ] || [ -z "$ARCH" ] || [ -z "$GPL_VERSION" ]; then
    echo "DSM_VERSION, ARCH and GPL_VERSION must be set"
    exit 1
fi

echo "Installing synology toolkit for DSM $DSM_VERSION"

# Download synology toolkit
mkdir -p /tmp/synology-toolkit
cd /tmp/synology-toolkit
curl -O https://global.download.synology.com/download/ToolChain/toolkit/${DSM_VERSION}/base/base_env-${DSM_VERSION}.txz
curl -O https://global.download.synology.com/download/ToolChain/toolkit/${DSM_VERSION}/${ARCH}/ds.${ARCH}-${DSM_VERSION}.dev.txz
curl -O https://global.download.synology.com/download/ToolChain/toolkit/${DSM_VERSION}/${ARCH}/ds.${ARCH}-${DSM_VERSION}.env.txz
curl -O https://global.download.synology.com/download/ToolChain/Synology%20NAS%20GPL%20Source/${DSM_VERSION}-${GPL_HASH}/${ARCH}/linux-3.10.x.txz

sleep 10

# Install synology toolkit
mkdir -p /synology/env
cd /synology/env
tar -xJf /tmp/synology-toolkit/base_env-${DSM_VERSION}.txz
tar -xJf /tmp/synology-toolkit/ds.${ARCH}-${DSM_VERSION}.dev.txz
tar -xJf /tmp/synology-toolkit/ds.${ARCH}-${DSM_VERSION}.env.txz
tar -xJf /tmp/synology-toolkit/linux-3.10.x.txz

# Cleanup
rm -rf /tmp/synology-toolkit