#!/bin/sh
# install_openrc_devel.sh

DESTDIR=$1

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
_LJenk=${_gentoo_uri}/dev-util/jenkins-bin/files/jenkins-bin-r1.logrotate

# install
install -Dm644 "${_Cgit}" "${DESTDIR}/etc/conf.d/git-daemon"
install -Dm755 "${_Igit}" "${DESTDIR}/etc/init.d/git-daemon"
install -Dm644 "${_Cmy}" "${DESTDIR}/etc/conf.d/mysqld"
install -Dm755 "${_Imy}" "${DESTDIR}/etc/init.d/mysqld"
install -Dm644 "${_CPgsql}" "${DESTDIR}/etc/conf.d/postgresql"
install -Dm755 "${_IPgsql}" "${DESTDIR}/etc/init.d/postgresql"
install -Dm644 "${_Csvn}" "${DESTDIR}/etc/conf.d/svn"
install -Dm755 "${_Isvn}" "${DESTDIR}/etc/init.d/svn"
install -Dm644 "${_CDistcc}" "${DESTDIR}/etc/conf.d/distccd"
install -Dm755 "${_IDistcc}" "${DESTDIR}/etc/init.d/distccd"
install -Dm644 "${_CJenk}" "${DESTDIR}/etc/conf.d/jenkins"
install -Dm755 "${_IJenk}" "${DESTDIR}/etc/init.d/jenkins"
install -Dm644 "${_LJenk}" "${DESTDIR}/etc/logrotate.d/jenkins"
install -Dm755 "misc/init.d/php-fpm-r4.init" "${DESTDIR}/etc/init.d/php-fpm"
