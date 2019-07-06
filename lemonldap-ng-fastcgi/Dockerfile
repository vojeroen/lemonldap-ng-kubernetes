FROM vojeroen/lemonldap-ng-base:latest

RUN set -x && \
    apt-get update && \
    apt-get install -y liblasso-perl && \
    apt-get clean
    
COPY scripts/entrypoint.sh /entrypoint.sh
