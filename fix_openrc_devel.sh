#!/bin/sh
# fix_openrc_devel.sh

DESTDIR=$1

# mysql
#_p1='s|--exec "${basedir}"/sbin/mysqld|--exec "${basedir}"/bin/mysqld_safe|g'
_p1='s|/sbin/mysqld|/libexec/mysqld|g'
_p2='s|/etc/mysql/my.cnf|/etc/my.cnf|g'
_p3='s|STARTUP_TIMEOUT="900"|STARTUP_TIMEOUT=30|'
_p4='s|STOP_TIMEOUT=120|STOP_TIMEOUT=60|'
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/mysqld"
sed -e "${_p2}" -e "${_p3}" -e "${_p4}" -i "${DESTDIR}/etc/conf.d/mysqld"

# php-fm
_p1='s|lib/${PHPSLOT}/bin|sbin|g'
_p2='s|/etc/php/fpm-${PHPSLOT}|/etc/php|'
_p3='s|/run/php-fpm-${PHPSLOT}|/run/php-fpm|'
_p4='s|PHPSLOT=${SVCNAME#php-fpm-}||'
_p5='s|^.*${PHPSLOT}.*||'
_p6='s|apache2|httpd|'
sed -e "${_p1}" -e "${_p2}" -e "${_p3}" -e "${_p4}" -e "${_p5}" -e "${_p6}" -i "${DESTDIR}/etc/init.d/php-fpm"

# postgresql
if [ "$(uname -m)" = x86_64 ]; then
  _p1='s|@LIBDIR@|lib64|g'
else
  _p1='s|@LIBDIR@|lib|g'
fi
# get postgresql version
postgres_ver=$(ls /var/log/packages/ | grep postgresql | cut -f 2 -d "-")
postgres_slot=$(echo "$postgres_ver" | cut -f 1-2 -d ".")
_p2='s|postgresql-@SLOT@|postgresql/@SLOT@|g'
_p3="s|@SLOT@|${postgres_slot}|g"
_p4='s|/var/lib/postgresql|/var/lib/pgsql|g'
sed -e "${_p1}" -e "${_p2}" -e "${_p3}" -i "${DESTDIR}/etc/init.d/postgresql"
sed -e "${_p2}" -e "${_p3}" -e "${_p4}" -i "${DESTDIR}/etc/conf.d/postgresql"

# subversion
_p2='s|-apache|-http|g'
sed -e "${_p2}" -i "${DESTDIR}/etc/init.d/svn"

# git-daemon
sed 's| --base-path=/var/git||' -i "${DESTDIR}/etc/conf.d/git-daemon"

# redis
sed 's|/usr/sbin/redis-server|/usr/bin/redis-server|' -i "${DESTDIR}/etc/init.d/redis"
