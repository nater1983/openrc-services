#!/bin/sh
# fix_openrc_desktop.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

# bluetooth
_p1='s|libexec/bluetooth|sbin|g'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/bluetooth"

# xdm
_p1='s|/etc/profile.env|/etc/profile|g'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/xdm"

# wpa_supplicant
if [ -f /etc/os-release ]; then
  sed -e "s|gentoo-release|os-release|" -i "${DESTDIR}/etc/wpa_supplicant/wpa_cli.sh"
fi

# networkmanager
sed -e 's|@EPREFIX@||g' -i "${DESTDIR}/etc/NetworkManager/dispatcher.d/10-openrc-status"
