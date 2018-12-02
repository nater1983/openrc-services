#!/bin/sh
# fix_openrc_desktop.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

# bluetooth
_p1='s|libexec/bluetooth|sbin|g'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/bluetooth"

# xdm
_p1='s|/etc/profile.env|/etc/profile|g'
_p2="s|etc/init.d|${SYSCONFDIR}/init.d|g"
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/xdm"
sed -e "${_p2}" -i "${DESTDIR}/etc/X11/startDM.sh"

# wpa_supplicant
if [ -f /etc/os-release ]; then
  sed -e "s|gentoo-release|os-release|" -i "${DESTDIR}/etc/wpa_supplicant/wpa_cli.sh"
fi

# networkmanager
sed -e 's|@EPREFIX@||g' -i "${DESTDIR}/etc/NetworkManager/dispatcher.d/10-openrc-status"
