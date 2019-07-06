#!/usr/bin/env bash

set -x

export FASTCGI_PASS=127.0.0.1:8080
export PID=/run/llng-fastcgi-server/llng-fastcgi-server.pid

cd /etc/nginx/sites-enabled/ && \
    ln -s /usr/local/lemonldap-ng/etc/handler-nginx.conf && \
    ln -s /usr/local/lemonldap-ng/etc/portal-nginx.conf && \
    ln -s /usr/local/lemonldap-ng/etc/manager-nginx.conf && \
    ln -s /usr/local/lemonldap-ng/etc/test-nginx.conf

sed -i -e "s|fastcgi_pass unix:/usr/local/run/llng-fastcgi.sock|fastcgi_pass ${FASTCGI_PASS}|" /usr/local/lemonldap-ng/etc/*-nginx.conf

nginx -g "daemon off;"
