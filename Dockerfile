FROM registry.access.redhat.com/ubi9/ubi-minimal:latest

RUN curl -L --output /senf https://github.com/seedwing-io/seedwing-enforcer/releases/download/v0.1.0-alpha.12/senf-linux-amd64 && chmod 755 /senf

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
