FROM vojeroen/lemonldap-ng-base:latest

RUN set -x && \
    apt-get update && \
    apt-get install -y cron && \
    apt-get clean
    
COPY scripts/entrypoint.sh /entrypoint.sh
