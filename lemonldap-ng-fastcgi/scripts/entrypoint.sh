#!/usr/bin/env bash

set -x

export LISTEN=127.0.0.1:8080

/usr/local/lemonldap-ng/sbin/llng-fastcgi-server --foreground -u www-data -g www-data
