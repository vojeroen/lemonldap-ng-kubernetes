FROM vojeroen/lemonldap-ng-base:latest

RUN set -x && \
    mkdir -p /usr/local/lemonldap-ng/bin && \
    mkdir /app && \
    cd /app && \
    wget -q https://release.ow2.org/lemonldap/lemonldap-ng-${LEMONLDAP_VERSION}.tar.gz

RUN set -x && \
    apt-get update && \
    apt-get install -y python3 ldap-utils && \
    apt-get clean
    
COPY config/lemonldap-ng.ini /app/lemonldap-ng.ini
COPY scripts/entrypoint.sh /entrypoint.sh
COPY scripts/json_to_ldap.py /app/json_to_ldap.py

EXPOSE 8080
