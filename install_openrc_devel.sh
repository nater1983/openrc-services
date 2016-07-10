#!/bin/sh
# install_openrc_devel.sh

DESTDIR=$1
DOWNLOAD_DIR=packages-openrc-master

_local_uri="${DOWNLOAD_DIR}/openrc-devel"

# files
_Cgit=${_local_uri}/git-daemon.confd
_Igit=${_local_uri}/git-daemon-r1.initd
_Cmy=${_local_uri}/conf.d-2.0
_Imy=${_local_uri}/init.d-2.0
_Csvn=${_local_uri}/svnserve.confd
_Isvn=${_local_uri}/svnserve.initd3
_CPgsql=${_local_uri}/postgresql.confd
_IPgsql=${_local_uri}/postgresql.init-9.3
_Iphp="misc/init.d/php-fpm-r4.init"

# install
install -Dm644 "${_Cgit}" "${DESTDIR}/etc/conf.d/git-daemon"
install -Dm755 "${_Igit}" "${DESTDIR}/etc/init.d/git-daemon"
install -Dm644 "${_Cmy}" "${DESTDIR}/etc/conf.d/mysqld"
install -Dm755 "${_Imy}" "${DESTDIR}/etc/init.d/mysqld"
install -Dm644 "${_CPgsql}" "${DESTDIR}/etc/conf.d/postgresql"
install -Dm755 "${_IPgsql}" "${DESTDIR}/etc/init.d/postgresql"
install -Dm644 "${_Csvn}" "${DESTDIR}/etc/conf.d/svn"
install -Dm755 "${_Isvn}" "${DESTDIR}/etc/init.d/svn"
install -Dm755 "${_Iphp}" "${DESTDIR}/etc/init.d/php-fpm"
