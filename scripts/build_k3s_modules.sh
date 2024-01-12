#!/bin/bash

source /scripts/vars.sh

echo "Building k3s modules for DSM $DSM_VERSION"

chroot /synology/env
cd /usr/local/linux-${LINUX_VERSION}

# Copy the kernel config
cp synoconfigs/${CPU_ARCH} .config

# Disable all modules in the kernel config
sed -i 's/=m/=n/g' .config

# Function to enable a specific feature flag
enable_module() {
  sed -i "s/# CONFIG_$1 is not set/CONFIG_$1=m/g" .config
  sed -i "s/CONFIG_$1=n/CONFIG_$1=m/g" .config
}

# Enable the IP_NF_TARGET_REJECT module
enable_module "IP_NF_IPTABLES"
enable_module "IP_NF_FILTER"
enable_module "IP_NF_TARGET_REJECT"

# Enable the NETFILTER_XT_MATCH_COMMENT module
enable_module "NETFILTER_XT_MATCH_COMMENT"
enable_module "NETFILTER_XTABLES"

# Build the modules
make modules_prepare
make modules

# Exit the chroot
exit

# Copy the modules to the output directory
mkdir -p /output/modules
cp -r /synology/env/usr/local/linux-${LINUX_VERSION}/drivers/net/ethernet /output/modules