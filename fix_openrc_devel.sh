#!/bin/sh
# fix_openrc_devel.sh

DESTDIR=$1

# influxdb
_p1='s|influxd.conf|influxdb.conf|g'
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/influxdb"

# mysql
#_p1='s|--exec "${basedir}"/sbin/mysqld|--exec "${basedir}"/bin/mysqld_safe|g'
_p1='s|/sbin/mysqld|/libexec/mysqld|g'
_p2='s|/etc/mysql/my.cnf|/etc/my.cnf|g'
_p3='s|STARTUP_TIMEOUT="900"|STARTUP_TIMEOUT=30|'
_p4='s|STOP_TIMEOUT=120|STOP_TIMEOUT=60|'
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/mysqld"
sed -e "${_p2}" -e "${_p3}" -e "${_p4}" -i "${DESTDIR}/etc/conf.d/mysqld"
# remove extra check
sed "/\! -d \"\${datadir}\"\/mysql/,+11d" -i "${DESTDIR}/etc/init.d/mysqld"

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

# redis
_p1='s|/usr/sbin/redis-server|/usr/bin/redis-server|'
_p2='/rc_need/s/^/#/'
_p3='s/REDIS_USER="redis"/REDIS_USER="root"/'
_p4='s/REDIS_GROUP="redis"/REDIS_GROUP="root"/'
_p5='s|/etc/redis.conf|/etc/redis/redis.conf|'
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/redis"
sed -e "${_p2}" -e "${_p3}" -e "${_p4}" -e "${_p5}" -i "${DESTDIR}/etc/conf.d/redis"

# subversion
_p2='s|-apache|-http|g'
sed -e "${_p2}" -i "${DESTDIR}/etc/init.d/svn"

# git-daemon
sed 's| --base-path=/var/git||' -i "${DESTDIR}/etc/conf.d/git-daemon"
