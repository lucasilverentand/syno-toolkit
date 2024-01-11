FROM debian:bookworm

ARG ARCH="gemini-lake"
ARG DSM_VERSION=7.2
ARG GPL_VERSION=64570

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY scripts/ /scripts/
RUN chmod +x /scripts/*.sh

# Install the toolkit
RUN /scripts/install_toolkit.sh ${ARCH} ${DSM_VERSION} ${GPL_VERSION}
