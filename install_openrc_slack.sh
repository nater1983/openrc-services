#!/bin/sh
# install_openrc_slack.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

_gentoo_uri="gentoo"

# install
install -Dm755 "misc/init.d/rc-firewall" "${DESTDIR}/${SYSCONFDIR}/init.d/rc-firewall"
