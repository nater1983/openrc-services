#!/bin/sh
# install_openrc_accessible.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

_gentoo_uri="gentoo"

# install
install -Dm644 "${_gentoo_uri}/app-accessibility/espeakup/files/espeakup.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/espeakup"
install -Dm755 "${_gentoo_uri}/app-accessibility/espeakup/files/espeakup.rc" "${DESTDIR}/${SYSCONFDIR}/init.d/espeakup"
