#!/bin/bash

# You can find the latest values for below here:
# https://archive.synology.com/download/ToolChain

CPU_ARCH=${CPU_ARCH:-""}
DSM_VERSION=${DSM_VERSION:-""}
GPL_VERSION=${GPL_VERSION:-""}
LINUX_VERSION=${LINUX_VERSION:-""}

echo "CPU_ARCH: $CPU_ARCH"
echo "DSM_VERSION: $DSM_VERSION"
echo "GPL_VERSION: $GPL_VERSION"
echo "LINUX_VERSION: $LINUX_VERSION"

# Exit if any of the variables are empty
if [ -z "$DSM_VERSION" ] || [ -z "$CPU_ARCH" ] || [ -z "$GPL_VERSION" ] || [ -z "$LINUX_VERSION" ]; then
    echo "One or more variables are undefined"
    exit 1
fi
