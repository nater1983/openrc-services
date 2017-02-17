#!/bin/sh
# fix_openrc_slack.sh

DESTDIR=$1

# ulogd
_p1='s| --pidfile ${ULOGD_PIDFILE}||g'
_p2='s| --uid ulogd||g'
sed -e "${_p1}" -e "${_p2}" -i "${DESTDIR}/etc/init.d/ulogd"

# php-fm
_p1='s|lib/${PHPSLOT}/bin|sbin|g'
_p2='s|/etc/php/fpm-${PHPSLOT}|/etc|'
_p3='s|/run/php-fpm-${PHPSLOT}|/run/php-fpm|'
_p4='/PHPSLOT=${SVCNAME#php-fpm-}/d'
_p5='s|^.*${PHPSLOT}.*||'
_p6='s|apache2|httpd|'
sed -e "${_p1}" -e "${_p2}" -e "${_p3}" -e "${_p4}" -e "${_p5}" -e "${_p6}" -i "${DESTDIR}/etc/init.d/php-fpm"

# redis
sed 's|/usr/sbin/redis-server|/usr/bin/redis-server|' -i "${DESTDIR}/etc/init.d/redis"
