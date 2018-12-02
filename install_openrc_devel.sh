#!/bin/sh
# install_openrc_devel.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

_gentoo_uri="gentoo"

# files
_Cgit=${_gentoo_uri}/dev-vcs/git/files/git-daemon.confd
_Igit=${_gentoo_uri}/dev-vcs/git/files/git-daemon-r1.initd
_Cmy=${_gentoo_uri}/dev-db/mysql-init-scripts/files/conf.d-2.0
_Imy=${_gentoo_uri}/dev-db/mysql-init-scripts/files/init.d-2.2
_Csvn=${_gentoo_uri}/dev-vcs/subversion/files/svnserve.confd
_Isvn=${_gentoo_uri}/dev-vcs/subversion/files/svnserve.initd3
_CPgsql=${_gentoo_uri}/dev-db/postgresql/files/postgresql.confd-9.3
_IPgsql=${_gentoo_uri}/dev-db/postgresql/files/postgresql.init-9.3-r1
_CDistcc=${_gentoo_uri}/sys-devel/distcc/files/3.2/conf
_IDistcc=${_gentoo_uri}/sys-devel/distcc/files/3.2/init
_CJenk=${_gentoo_uri}/dev-util/jenkins-bin/files/jenkins-bin.confd
_IJenk=${_gentoo_uri}/dev-util/jenkins-bin/files/jenkins-bin.init2
_Cinflux=${_gentoo_uri}/dev-db/influxdb/files/influxdb.confd
_Iinflux=${_gentoo_uri}/dev-db/influxdb/files/influxdb.rc
_CRedS="${_gentoo_uri}/dev-db/redis/files/redis.confd-r1"
_IRedS="${_gentoo_uri}/dev-db/redis/files/redis.initd-5"

# install
install -Dm644 "${_Cgit}" "${DESTDIR}/${SYSCONFDIR}/conf.d/git-daemon"
install -Dm755 "${_Igit}" "${DESTDIR}/${SYSCONFDIR}/init.d/git-daemon"
install -Dm644 "${_Cmy}" "${DESTDIR}/${SYSCONFDIR}/conf.d/mysqld"
install -Dm755 "${_Imy}" "${DESTDIR}/${SYSCONFDIR}/init.d/mysqld"
install -Dm644 "${_CPgsql}" "${DESTDIR}/${SYSCONFDIR}/conf.d/postgresql"
install -Dm755 "${_IPgsql}" "${DESTDIR}/${SYSCONFDIR}/init.d/postgresql"
install -Dm644 "${_Csvn}" "${DESTDIR}/${SYSCONFDIR}/conf.d/svn"
install -Dm755 "${_Isvn}" "${DESTDIR}/${SYSCONFDIR}/init.d/svn"
install -Dm644 "${_CDistcc}" "${DESTDIR}/${SYSCONFDIR}/conf.d/distccd"
install -Dm755 "${_IDistcc}" "${DESTDIR}/${SYSCONFDIR}/init.d/distccd"
install -Dm644 "${_CJenk}" "${DESTDIR}/${SYSCONFDIR}/conf.d/jenkins"
install -Dm755 "${_IJenk}" "${DESTDIR}/${SYSCONFDIR}/init.d/jenkins"
install -Dm644 "${_Cinflux}" "${DESTDIR}/${SYSCONFDIR}/conf.d/influxdb"
install -Dm755 "${_Iinflux}" "${DESTDIR}/${SYSCONFDIR}/init.d/influxdb"
install -Dm644 "${_CRedS}" "${DESTDIR}/${SYSCONFDIR}/conf.d/redis"
install -Dm755 "${_IRedS}" "${DESTDIR}/${SYSCONFDIR}/init.d/redis"
