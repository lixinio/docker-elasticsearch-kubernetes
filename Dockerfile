FROM quay.io/pires/docker-elasticsearch:6.2.4

MAINTAINER pragkent@gmail.com

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery

# Kubernetes requires swap is turned off, so memory lock is redundant
ENV MEMORY_LOCK false

ENV ES_TMPDIR /tmp/es-plugins

RUN mkdir $ES_TMPDIR && NODE_NAME=build elasticsearch-plugin install ingest-geoip

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config
