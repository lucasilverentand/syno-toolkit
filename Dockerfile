FROM debian:bookworm

ARG ARCH="geminilake"
ARG DSM_VERSION=7.2
ARG GPL_VERSION=64570
ARG LINUX_VERSION=4.4.x

# Add args to .bashrc
RUN echo 'export ARCH=${ARCH}' > /root/.bashrc
RUN echo 'export DSM_VERSION=${DSM_VERSION}' >> /root/.bashrc
RUN echo 'export GPL_VERSION=${GPL_VERSION}' >> /root/.bashrc
RUN echo 'export LINUX_VERSION=${LINUX_VERSION}' >> /root/.bashrc

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget ca-certificates xz-utils \
    && rm -rf /var/lib/apt/lists/*

COPY scripts/ /scripts/
RUN chmod +x /scripts/*.sh

# Install the toolkit
RUN /scripts/install_toolkit.sh
