#!/bin/sh
# install_openrc_devel.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

_gentoo_uri="gentoo"

# install
install -Dm644 "${_gentoo_uri}/dev-vcs/git/files/git-daemon.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/git-daemon"
install -Dm755 "${_gentoo_uri}/dev-vcs/git/files/git-daemon-r1.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/git-daemon"
install -Dm644 "${_gentoo_uri}/dev-db/mysql-init-scripts/files/conf.d-2.0" "${DESTDIR}/${SYSCONFDIR}/conf.d/mysqld"
install -Dm755 "${_gentoo_uri}/dev-db/mysql-init-scripts/files/init.d-2.2" "${DESTDIR}/${SYSCONFDIR}/init.d/mysqld"
install -Dm644 "${_gentoo_uri}/dev-db/postgresql/files/postgresql.confd-9.3" "${DESTDIR}/${SYSCONFDIR}/conf.d/postgresql"
install -Dm755 "${_gentoo_uri}/dev-db/postgresql/files/postgresql.init-9.3-r1" "${DESTDIR}/${SYSCONFDIR}/init.d/postgresql"
install -Dm644 "${_gentoo_uri}/dev-vcs/subversion/files/svnserve.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/svn"
install -Dm755 "${_gentoo_uri}/dev-vcs/subversion/files/svnserve.initd3" "${DESTDIR}/${SYSCONFDIR}/init.d/svn"
install -Dm644 "${_gentoo_uri}/sys-devel/distcc/files/3.2/conf" "${DESTDIR}/${SYSCONFDIR}/conf.d/distccd"
install -Dm755 "${_gentoo_uri}/sys-devel/distcc/files/3.2/init" "${DESTDIR}/${SYSCONFDIR}/init.d/distccd"
install -Dm644 "${_gentoo_uri}/dev-util/jenkins-bin/files/jenkins-bin.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/jenkins"
install -Dm755 "${_gentoo_uri}/dev-util/jenkins-bin/files/jenkins-bin.init2" "${DESTDIR}/${SYSCONFDIR}/init.d/jenkins"
install -Dm644 "${_gentoo_uri}/dev-db/influxdb/files/influxdb.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/influxdb"
install -Dm755 "${_gentoo_uri}/dev-db/influxdb/files/influxdb.rc-r1" "${DESTDIR}/${SYSCONFDIR}/init.d/influxdb"
install -Dm644 "${_gentoo_uri}/dev-db/redis/files/redis.confd-r1" "${DESTDIR}/${SYSCONFDIR}/conf.d/redis"
install -Dm755 "${_gentoo_uri}/dev-db/redis/files/redis.initd-5" "${DESTDIR}/${SYSCONFDIR}/init.d/redis"
install -Dm644 "${_gentoo_uri}/dev-db/mongodb/files/mongodb.confd-r3" "${DESTDIR}/${SYSCONFDIR}/conf.d/mongodb"
install -Dm755 "${_gentoo_uri}/dev-db/mongodb/files/mongodb.initd-r3" "${DESTDIR}/${SYSCONFDIR}/init.d/mongodb"
install -Dm644 "${_gentoo_uri}/dev-db/mongodb/files/mongos.confd-r3" "${DESTDIR}/${SYSCONFDIR}/conf.d/mongos"
install -Dm755 "${_gentoo_uri}/dev-db/mongodb/files/mongos.initd-r3" "${DESTDIR}/${SYSCONFDIR}/init.d/mongos"
install -Dm644 "misc/gentoo-apache/init/apache2.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/httpd"
install -Dm755 "misc/gentoo-apache/init/apache2.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/httpd"
install -Dm755 "misc/init.d/php-fpm-r4.init" "${DESTDIR}/${SYSCONFDIR}/init.d/php-fpm"
#install -Dm644 "${_gentoo_uri}/www-servers/lighttpd/files/lighttpd.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/lighttpd"
#install -Dm755 "${_gentoo_uri}/www-servers/lighttpd/files/lighttpd.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/lighttpd"

# comments
#
# lighttpd not installed by default due to lack of /etc/lighttpd/lighttpd.conf
# which is sourced by /etc/conf.d/lighttpd and causes error when starting services.
