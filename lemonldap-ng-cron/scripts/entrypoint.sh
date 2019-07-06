#!/usr/bin/env bash

set -x

ln -s /usr/local/lemonldap-ng/etc/cron.d/* /etc/cron.d/

/usr/sbin/cron -f -L 5 
