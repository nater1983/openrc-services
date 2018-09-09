#!/bin/sh
# fix_openrc_slack.sh

DESTDIR=$1

# dcron
# starting slackware current 14.2+
_p1='/ebegin "Starting \${SVCNAME}"/a \\t# adapted from \/etc\/rc.d\/rc.crond \n\tmkdir -p /run/cron'
_p2='/start-stop-daemon/,+1d'
_p3='/ebegin "Stopping \${SVCNAME}"/a \\t# adapted from \/etc\/rc.d\/rc.crond\
	\/usr\/bin\/pkill --ns \$\$ --euid root -f "^\/usr\/sbin\/crond" 2> \/dev\/null'
sed -e "${_p1}" -e "${_p2}" -e "${_p3}" -i "${DESTDIR}/etc/init.d/dcron"

# php-fpm
_p1='s|lib/${PHPSLOT}/bin|sbin|g'
_p2='s|/etc/php/fpm-${PHPSLOT}|/etc|'
_p3='s|/run/php-fpm-${PHPSLOT}|/run/php-fpm|'
_p4='/PHPSLOT=${SVCNAME#php-fpm-}/d'
_p5='s|^.*${PHPSLOT}.*||'
_p6='s|apache2|httpd|'
sed -e "${_p1}" -e "${_p2}" -e "${_p3}" -e "${_p4}" -e "${_p5}" -e "${_p6}" -i "${DESTDIR}/etc/init.d/php-fpm"

# ulogd
_p1='s| --uid ulogd||g'
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/ulogd"
