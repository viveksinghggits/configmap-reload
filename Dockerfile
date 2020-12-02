ARG BASEIMAGE=registry.access.redhat.com/ubi8/ubi-minimal:8.1
FROM $BASEIMAGE

COPY ./LICENSE.txt /licenses/

USER 65534

ARG BINARY=configmap-reload
COPY out/$BINARY /configmap-reload

LABEL name="configmap-reload" \
    version="0.4.0" \
    release="6" \
    vendor="github.com/jimmidyson/configmap-reload" \
    summary="Binary to trigger a reload when Kubernetes ConfigMaps are updated" \
    description="configmap-reload is a simple binary to trigger a reload when Kubernetes ConfigMaps are updated."

ENTRYPOINT ["/configmap-reload"]
