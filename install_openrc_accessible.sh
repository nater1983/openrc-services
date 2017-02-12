#!/bin/sh
# install_openrc_accessible.sh

DESTDIR=$1
DOWNLOAD_DIR=packages-openrc-master

_local_uri="${DOWNLOAD_DIR}/openrc-accessible"

# files
_Cespk=${_local_uri}/espeakup.confd
_Iespk=${_local_uri}/espeakup.rc

# install
install -Dm644 "${_Cespk}" "${DESTDIR}/etc/conf.d/espeakup"
install -Dm755 "${_Iespk}" "${DESTDIR}/etc/init.d/espeakup"
