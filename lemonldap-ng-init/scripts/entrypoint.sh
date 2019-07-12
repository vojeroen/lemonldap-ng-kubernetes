#!/usr/bin/env bash

set -x

if [[ -z ${DOMAIN} ]]; then
    export DOMAIN=localhost.local
fi

cd /app
tar xzf lemonldap-ng-${LEMONLDAP_VERSION}.tar.gz
cd /app/lemonldap-ng-${LEMONLDAP_VERSION}
make
make configure
make install PROD=yes DNSDOMAIN=${DOMAIN}
rm -rf /app/lemonldap-ng-${LEMONLDAP_VERSION}

sed -i "s/LDAP_CONF_SERVER/${LDAP_CONF_SERVER}/g" /app/lemonldap-ng.ini
sed -i "s/LDAP_CONF_BASE/${LDAP_CONF_BASE}/g" /app/lemonldap-ng.ini
sed -i "s/LDAP_CONF_BIND_DN/${LDAP_CONF_BIND_DN}/g" /app/lemonldap-ng.ini
sed -i "s/LDAP_CONF_BIND_PW/${LDAP_CONF_BIND_PW}/g" /app/lemonldap-ng.ini

cp /app/lemonldap-ng.ini /usr/local/lemonldap-ng/etc/lemonldap-ng.ini

# load the default config into the LDAP database if it doesn't exist yet
python3 /app/json_to_ldap.py
ldapadd -x -D "${LDAP_CONF_BIND_DN}" -w "${LDAP_CONF_BIND_PW}" -H ldap://${LDAP_CONF_SERVER} -f /app/lmConf-1.ldif || true
