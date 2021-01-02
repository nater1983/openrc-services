#!/bin/sh
# fix_openrc_desktop.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}
LIBRCDIR=${LIBRCDIR:-usr/libexec/rc}

# bluetooth
_p1='s|libexec/bluetooth|sbin|g'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/bluetooth"

# xdm
_p1='s|/etc/profile.env|/etc/profile|g'
_p2="s|etc/init.d|${SYSCONFDIR}/init.d|g"
_p3="s|lib/rc|${LIBRCDIR}|g"
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/xdm"
sed -e "${_p2}" -e "${_p3}" -i "${DESTDIR}/etc/X11/startDM.sh"

