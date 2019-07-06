FROM vojeroen/lemonldap-ng-base:latest

RUN set -x && \
    apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

COPY scripts/entrypoint.sh /entrypoint.sh

EXPOSE 80
