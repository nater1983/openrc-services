#!/bin/sh
# fix_openrc_desktop.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}
LIBRCDIR=${LIBRCDIR:-usr/libexec/rc}

# bluetooth
_p1='s|libexec/bluetooth|sbin|g'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/bluetooth"

# display-manager
_p1='s|/etc/profile.env|/etc/profile|g'
_p2="s|lib/rc|${LIBRCDIR}|g"
_p3="s|/lib/gentoo/functions.sh|${LIBRCDIR}/gentoo-functions.sh|g"
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/display-manager"
sed -e "${_p1}" -e "${_p2}" -e "${_p3}" -i "${DESTDIR}/usr/bin/startDM"
