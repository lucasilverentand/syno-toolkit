#!/bin/bash

# You can find the latest values for below here:
# https://archive.synology.com/download/ToolChain

ARCH=${ARCH:-""}
DSM_VERSION=${DSM_VERSION:-""}
GPL_VERSION=${GPL_VERSION:-""}
LINUX_VERSION=${LINUX_VERSION:-""}

echo "ARCH: $ARCH"
echo "DSM_VERSION: $DSM_VERSION"
echo "GPL_VERSION: $GPL_VERSION"
echo "LINUX_VERSION: $LINUX_VERSION"

# Exit if any of the variables are empty
if [ -z "$DSM_VERSION" ] || [ -z "$ARCH" ] || [ -z "$GPL_VERSION" ] || [ -z "$LINUX_VERSION" ]; then
    echo "DSM_VERSION, ARCH and GPL_VERSION must be set"
    exit 1
fi
