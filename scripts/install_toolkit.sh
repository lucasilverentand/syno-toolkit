#/bin/bash

source /scripts/vars.sh

echo "Installing synology toolkit for DSM $DSM_VERSION"

# Download synology toolkit
mkdir -p /tmp/synology-toolkit
cd /tmp/synology-toolkit

TOOLCHAIN_BASE_URL="https://global.download.synology.com/download/ToolChain"
TOOLKIT_BASE_URL="${TOOLCHAIN_BASE_URL}/toolkit/${DSM_VERSION}"

BASE_ENV_FILE="base_env-${DSM_VERSION}.txz"
BASE_ENV_URL="${TOOLKIT_BASE_URL}/base/${BASE_ENV_FILE}"
wget ${BASE_ENV_URL} -O /tmp/synology-toolkit/${BASE_ENV_FILE}

DEV_FILE="ds.${ARCH}-${DSM_VERSION}.dev.txz"
DEV_URL="${TOOLKIT_BASE_URL}/${ARCH}/${DEV_FILE}"
wget ${DEV_URL} -O /tmp/synology-toolkit/${DEV_FILE}

ENV_FILE="ds.${ARCH}-${DSM_VERSION}.env.txz"
ENV_URL="${TOOLKIT_BASE_URL}/${ARCH}/${ENV_FILE}"
wget ${ENV_URL} -O /tmp/synology-toolkit/${ENV_FILE}

LINUX_FILE="linux-${LINUX_VERSION}.txz"
LINUX_URL="${TOOLCHAIN_BASE_URL}/Synology%20NAS%20GPL%20Source/${DSM_VERSION}-${GPL_VERSION}/${ARCH}/${LINUX_FILE}"
wget ${LINUX_URL} -O /tmp/synology-toolkit/${LINUX_FILE}

# Extract synology toolkit
mkdir -p /synology/env
cd /synology/env

tar -xJf /tmp/synology-toolkit/${BASE_ENV_FILE}
tar -xJf /tmp/synology-toolkit/${DEV_FILE}
tar -xJf /tmp/synology-toolkit/${ENV_FILE}
tar -xJf /tmp/synology-toolkit/${LINUX_FILE} -C /usr/local

# Cleanup
rm -rf /tmp/synology-toolkit