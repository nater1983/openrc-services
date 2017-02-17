#!/bin/sh
# fix_openrc_slack.sh

DESTDIR=$1

# ulogd
_p1='s| --pidfile ${ULOGD_PIDFILE}||g'
_p2='s| --uid ulogd||g'
sed -e "${_p1}" -e "${_p2}" -i "${DESTDIR}/etc/init.d/ulogd"

# redis
sed 's|/usr/sbin/redis-server|/usr/bin/redis-server|' -i "${DESTDIR}/etc/init.d/redis"
