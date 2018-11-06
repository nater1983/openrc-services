#!/bin/sh
# install_openrc_desktop.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

_gentoo_uri="gentoo"

# files
_Cacpi=${_gentoo_uri}/sys-power/acpid/files/acpid-2.0.16-conf.d
_Iacpi=${_gentoo_uri}/sys-power/acpid/files/acpid-2.0.26-init.d
_Calsa=${_gentoo_uri}/media-sound/alsa-utils/files/alsasound.confd-r4
_Ialsa=${_gentoo_uri}/media-sound/alsa-utils/files/alsasound.initd-r6
_Ick=${_gentoo_uri}/sys-auth/consolekit/files/consolekit-1.0.0.initd
_Icgm=${_gentoo_uri}/app-admin/cgmanager/files/cgmanager.initd-r1
_Icgp=${_gentoo_uri}/app-admin/cgmanager/files/cgproxy.initd-r1
_Cxdm=${_gentoo_uri}/x11-base/xorg-server/files/xdm.confd-4
_Ixdm1=${_gentoo_uri}/x11-base/xorg-server/files/xdm.initd-11
_Ixdm2=${_gentoo_uri}/x11-base/xorg-server/files/xdm-setup.initd-1
_Sxdm=${_gentoo_uri}/x11-apps/xinit/files/startDM.sh
_Cgpm=${_gentoo_uri}/sys-libs/gpm/files/gpm.conf.d
_Igpm=${_gentoo_uri}/sys-libs/gpm/files/gpm.rc6-2
_Iblue1=${_gentoo_uri}/net-wireless/bluez/files/rfcomm-init.d-r2
_Iblue2=${_gentoo_uri}/net-wireless/bluez/files/bluetooth-init.d-r4
_Cwpa=${_gentoo_uri}/net-wireless/wpa_supplicant/files/wpa_supplicant-conf.d
_Iwpa=${_gentoo_uri}/net-wireless/wpa_supplicant/files/wpa_supplicant-init.d
_Swpa=${_gentoo_uri}/net-wireless/wpa_supplicant/files/wpa_cli.sh
_CNM=${_gentoo_uri}/net-misc/networkmanager/files/conf.d.NetworkManager
_INM=${_gentoo_uri}/net-misc/networkmanager/files/init.d.NetworkManager-r1
_SNM=${_gentoo_uri}/net-misc/networkmanager/files/10-openrc-status-r4

# install
install -Dm644 "${_Cacpi}" "${DESTDIR}/${SYSCONFDIR}/conf.d/acpid"
install -Dm755 "${_Iacpi}" "${DESTDIR}/${SYSCONFDIR}/init.d/acpid"
install -Dm644 "${_Calsa}" "${DESTDIR}/${SYSCONFDIR}/conf.d/alsasound"
install -Dm755 "${_Ialsa}" "${DESTDIR}/${SYSCONFDIR}/init.d/alsasound"
install -Dm755 "${_Ick}" "${DESTDIR}/${SYSCONFDIR}/init.d/consolekit"
install -Dm755 "${_Icgm}" "${DESTDIR}/${SYSCONFDIR}/init.d/cgmanager"
install -Dm755 "${_Icgp}" "${DESTDIR}/${SYSCONFDIR}/init.d/cgproxy"
install -Dm644 "${_Cxdm}" "${DESTDIR}/${SYSCONFDIR}/conf.d/xdm"
install -Dm755 "${_Ixdm1}" "${DESTDIR}/${SYSCONFDIR}/init.d/xdm"
install -Dm755 "${_Ixdm2}" "${DESTDIR}/${SYSCONFDIR}/init.d/xdm-setup"
install -Dm755 "${_Sxdm}" "${DESTDIR}/etc/X11/startDM.sh"
install -Dm644 "${_Cgpm}" "${DESTDIR}/${SYSCONFDIR}/conf.d/gpm"
install -Dm755 "${_Igpm}" "${DESTDIR}/${SYSCONFDIR}/init.d/gpm"
install -Dm755 "${_Iblue1}" "${DESTDIR}/${SYSCONFDIR}/init.d/rfcomm"
install -Dm755 "${_Iblue2}" "${DESTDIR}/${SYSCONFDIR}/init.d/bluetooth"
install -Dm644 "${_Cwpa}" "${DESTDIR}/${SYSCONFDIR}/conf.d/wpa_supplicant"
install -Dm755 "${_Iwpa}" "${DESTDIR}/${SYSCONFDIR}/init.d/wpa_supplicant"
install -Dm755 "${_Swpa}" "${DESTDIR}/etc/wpa_supplicant/wpa_cli.sh"
install -Dm644 "${_CNM}" "${DESTDIR}/${SYSCONFDIR}/conf.d/NetworkManager"
install -Dm755 "${_INM}" "${DESTDIR}/${SYSCONFDIR}/init.d/NetworkManager"
install -Dm755 "${_SNM}" "${DESTDIR}/etc/NetworkManager/dispatcher.d/10-openrc-status"
install -Dm755 "misc/init.d/avahi-daemon" "${DESTDIR}/${SYSCONFDIR}/init.d/avahi-daemon"
install -Dm755 "misc/init.d/avahi-daemon" "${DESTDIR}/${SYSCONFDIR}/init.d/avahi-daemon"
install -Dm755 "misc/init.d/tlp-init.openrc-r2" "${DESTDIR}/${SYSCONFDIR}/init.d/tlp"
