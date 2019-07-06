FROM debian:stretch-slim

ENV LEMONLDAP_VERSION=2.0.5

RUN set -x && \
    apt-get update && \
    apt-get install -y build-essential wget dumb-init && \
    apt-get clean

RUN set -x && \
    echo "deb http://deb.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/stretch-backports.list && \
    apt-get update && \
    apt-get install -y libapache-session-perl libcache-cache-perl libclone-perl libconfig-inifiles-perl libconvert-pem-perl libcrypt-openssl-bignum-perl libcrypt-openssl-rsa-perl libcrypt-openssl-x509-perl libcrypt-rijndael-perl libdbi-perl libdigest-hmac-perl libemail-sender-perl libgd-securityimage-perl libhtml-template-perl libio-string-perl libjson-perl libmime-tools-perl libmouse-perl libnet-ldap-perl libplack-perl libregexp-assemble-perl libregexp-common-perl libsoap-lite-perl libstring-random-perl libunicode-string-perl liburi-perl libwww-perl libxml-simple-perl libxml-libxslt-perl libcrypt-urandom-perl libtext-unidecode-perl libcookie-baker-xs-perl && \
    apt-get clean 

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash", "/entrypoint.sh"]
