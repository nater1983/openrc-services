#!/bin/sh
# install_openrc_accessible.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

_gentoo_uri="gentoo"

# files
_Cespk=${_gentoo_uri}/app-accessibility/espeakup/files/espeakup.confd
_Iespk=${_gentoo_uri}/app-accessibility/espeakup/files/espeakup.rc

# install
install -Dm644 "${_Cespk}" "${DESTDIR}/${SYSCONFDIR}/conf.d/espeakup"
install -Dm755 "${_Iespk}" "${DESTDIR}/${SYSCONFDIR}/init.d/espeakup"
