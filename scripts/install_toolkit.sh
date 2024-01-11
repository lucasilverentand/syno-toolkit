#/bin/bash

source /scripts/vars.sh

echo "Installing synology toolkit for DSM $DSM_VERSION"

# Download synology toolkit
mkdir -p /tmp/synology-toolkit
cd /tmp/synology-toolkit

BASE_ENV_FILE="base_env-${DSM_VERSION}.txz"
wget https://global.download.synology.com/download/ToolChain/toolkit/${DSM_VERSION}/base/base_env-${DSM_VERSION}.txz -O /tmp/synology-toolkit/${BASE_ENV_FILE}

DEV_FILE="ds.${ARCH}-${DSM_VERSION}.dev.txz"
wget https://global.download.synology.com/download/ToolChain/toolkit/${DSM_VERSION}/${ARCH}/ds.${ARCH}-${DSM_VERSION}.dev.txz -O /tmp/synology-toolkit/${DEV_FILE}

ENV_FILE="ds.${ARCH}-${DSM_VERSION}.env.txz"
wget https://global.download.synology.com/download/ToolChain/toolkit/${DSM_VERSION}/${ARCH}/ds.${ARCH}-${DSM_VERSION}.env.txz -O /tmp/synology-toolkit/${ENV_FILE}

LINUX_FILE="linux-${LINUX_VERSION}.txz"
wget https://global.download.synology.com/download/ToolChain/Synology%20NAS%20GPL%20Source/${DSM_VERSION}-${GPL_HASH}/${ARCH}/linux-${LINUX_VERSION}.txz -O /tmp/synology-toolkit/${LINUX_FILE}

# Extract synology toolkit
mkdir -p /synology/env
cd /synology/env

tar -xJf /tmp/synology-toolkit/${BASE_ENV_FILE}
tar -xJf /tmp/synology-toolkit/${DEV_FILE}
tar -xJf /tmp/synology-toolkit/${ENV_FILE}
tar -xJf /tmp/synology-toolkit/${LINUX_FILE}

# Cleanup
rm -rf /tmp/synology-toolkit