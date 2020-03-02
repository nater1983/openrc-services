#!/bin/sh
# fix_openrc_devel.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

# apache (httpd)
_p1='s|/usr/sbin/apache2|/usr/sbin/apachectl|'
_p2='s|/etc/apache2/httpd.conf|/etc/httpd/httpd.conf|'
if [ "$(uname -m)" = x86_64 ]; then
  _p4='s|/usr/lib/apache2|/usr/lib64/httpd|'
else
  _p4='s|/usr/lib/apache2|/usr/lib/httpd|'
fi
_p5='s|apache2.pid|httpd.pid|'
_p6='s|apache2 >/dev/null|httpd >/dev/null|'
_p7='s|apache2|httpd|g'
_p8='s|/run/apache_ssl_mutex|/run/httpd|'
_p9='s|start-stop-daemon --start|start-stop-daemon --start --pidfile ${PIDFILE}|'
sed -e "${_p1}" -e "${_p2}" -e "${_p4}" -e "${_p5}" -e "${_p6}" -e "${_p8}" -e "${_p9}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/httpd"
sed -e "${_p2}" -e "${_p4}" -e "${_p5}" -e "${_p7}" -i "${DESTDIR}/${SYSCONFDIR}/conf.d/httpd"

# php-fpm
_p1='s|lib/${PHPSLOT}/bin|sbin|g'
_p2='s|/etc/php/fpm-${PHPSLOT}|/etc|'
_p3='s|/run/php-fpm-${PHPSLOT}|/run/php-fpm|'
_p4='/PHPSLOT=${SVCNAME#php-fpm-}/d'
_p5='s|^.*${PHPSLOT}.*||'
_p6='s|apache2|httpd|'
sed -e "${_p1}" -e "${_p2}" -e "${_p3}" -e "${_p4}" -e "${_p5}" -e "${_p6}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/php-fpm"

# influxdb
_p1='s|influxd.conf|influxdb.conf|g'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/influxdb"

# mysql
#_p1='s|--exec "${basedir}"/sbin/mysqld|--exec "${basedir}"/bin/mysqld_safe|g'
_p1='s|/sbin/mysqld|/libexec/mysqld|g'
_p2='s|/etc/mysql/my.cnf|/etc/my.cnf|g'
_p3='s|STARTUP_TIMEOUT="900"|STARTUP_TIMEOUT=30|'
_p4='s|STOP_TIMEOUT=120|STOP_TIMEOUT=60|'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/mysqld"
sed -e "${_p2}" -e "${_p3}" -e "${_p4}" -i "${DESTDIR}/${SYSCONFDIR}/conf.d/mysqld"
# remove extra check
sed "/\! -d \"\${datadir}\"\/mysql/,+11d" -i "${DESTDIR}/${SYSCONFDIR}/init.d/mysqld"

# postgresql
if [ "$(uname -m)" = x86_64 ] || [ "$(uname -m)" = aarch64 ]; then
  _p1='s|@LIBDIR@|lib64|g'
else
  _p1='s|@LIBDIR@|lib|g'
fi
# get postgresql version (override via setting env variable)
postgres_ver=${OPENRC_POSTGRES_VER:-$(ls /var/log/packages/ | grep postgresql | cut -f 2 -d "-")}
postgres_slot=$(echo "$postgres_ver" | cut -f 1-2 -d ".")
_p2='s|postgresql-@SLOT@|postgresql/@SLOT@|g'
if [ -z "$postgres_slot" ]; then
  _p3="s|@SLOT@|@SLOT@|g"
else
  _p3="s|@SLOT@|${postgres_slot}|g"
fi
_p4='s|/var/lib/postgresql|/var/lib/pgsql|g'
sed -e "${_p1}" -e "${_p2}" -e "${_p3}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/postgresql"
sed -e "${_p2}" -e "${_p3}" -e "${_p4}" -i "${DESTDIR}/${SYSCONFDIR}/conf.d/postgresql"

# redis
_p1='s|/usr/sbin/redis-server|/usr/bin/redis-server|'
_p2='/rc_need/s/^/#/'
_p3='s/REDIS_USER="redis"/REDIS_USER="root"/'
_p4='s/REDIS_GROUP="redis"/REDIS_GROUP="root"/'
_p5='s|/etc/redis.conf|/etc/redis/redis.conf|'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/redis"
sed -e "${_p2}" -e "${_p3}" -e "${_p4}" -e "${_p5}" -i "${DESTDIR}/${SYSCONFDIR}/conf.d/redis"

# subversion
_p2='s|-apache|-http|g'
sed -e "${_p2}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/svn"

# git-daemon
sed 's| --base-path=/var/git||' -i "${DESTDIR}/${SYSCONFDIR}/conf.d/git-daemon"
