#!/bin/sh
# install_openrc_desktop.sh

DESTDIR=$1
DOWNLOAD_DIR=packages-openrc-master

_local_uri="${DOWNLOAD_DIR}/openrc-desktop"

# files
_Cacpi=${_local_uri}/acpid-2.0.16-conf.d
_Iacpi=${_local_uri}/acpid-2.0.26-init.d
_Calsa=${_local_uri}/alsasound.confd-r4
_Ialsa=${_local_uri}/alsasound.initd-r6
_Ick=${_local_uri}/consolekit-1.0.0.initd
_Icgm=${_local_uri}/cgmanager.initd-r1
_Icgp=${_local_uri}/cgproxy.initd-r1
_Cxdm=${_local_uri}/xdm.confd-4
_Ixdm1=${_local_uri}/xdm.initd-11
_Ixdm2=${_local_uri}/xdm-setup.initd-1
_Sxdm=${_local_uri}/startDM.sh
_Cgpm=${_local_uri}/gpm.conf.d
_Igpm=${_local_uri}/gpm.rc6-2
_Cblue=${_local_uri}/rfcomm-conf.d
_Iblue1=${_local_uri}/rfcomm-init.d-r2
_Iblue2=${_local_uri}/bluetooth-init.d-r3
_Cwpa=${_local_uri}/wpa_supplicant-conf.d
_Iwpa=${_local_uri}/wpa_supplicant-init.d
_Swpa=${_local_uri}/wpa_cli.sh
_CNM=${_local_uri}/conf.d.NetworkManager
_INM=${_local_uri}/init.d.NetworkManager
_SNM=${_local_uri}/10-openrc-status-r4

# install
install -Dm644 "${_Cacpi}" "${DESTDIR}/etc/conf.d/acpid"
install -Dm755 "${_Iacpi}" "${DESTDIR}/etc/init.d/acpid"
install -Dm644 "${_Calsa}" "${DESTDIR}/etc/conf.d/alsasound"
install -Dm755 "${_Ialsa}" "${DESTDIR}/etc/init.d/alsasound"
install -Dm755 "${_Ick}" "$DESTDIR/etc/init.d/consolekit"
install -Dm755 "${_Icgm}" "$DESTDIR/etc/init.d/cgmanager"
install -Dm755 "${_Icgp}" "$DESTDIR/etc/init.d/cgproxy"
install -Dm644 "${_Cxdm}" "${DESTDIR}/etc/conf.d/xdm"
install -Dm755 "${_Ixdm1}" "${DESTDIR}/etc/init.d/xdm"
install -Dm755 "${_Ixdm2}" "${DESTDIR}/etc/init.d/xdm-setup"
install -Dm755 "${_Sxdm}" "${DESTDIR}/etc/X11/startDM.sh"
install -Dm644 "${_Cgpm}" "${DESTDIR}/etc/conf.d/gpm"
install -Dm755 "${_Igpm}" "${DESTDIR}/etc/init.d/gpm"
install -Dm644 "${_Cblue}" "${DESTDIR}/etc/conf.d/rfcomm"
install -Dm755 "${_Iblue1}" "${DESTDIR}/etc/init.d/rfcomm"
install -Dm755 "${_Iblue2}" "${DESTDIR}/etc/init.d/bluetooth"
install -Dm644 "${_Cwpa}" "${DESTDIR}/etc/conf.d/wpa_supplicant"
install -Dm755 "${_Iwpa}" "${DESTDIR}/etc/init.d/wpa_supplicant"
install -Dm755 "${_Swpa}" "${DESTDIR}/etc/wpa_supplicant/wpa_cli.sh"
install -Dm644 "${_CNM}" "${DESTDIR}/etc/conf.d/NetworkManager"
install -Dm755 "${_INM}" "${DESTDIR}/etc/init.d/NetworkManager"
install -Dm755 "${_SNM}" "${DESTDIR}/etc/NetworkManager/dispatcher.d/10-openrc-status"
install -Dm755 "misc/init.d/avahi-daemon" "${DESTDIR}/etc/init.d/avahi-daemon"
install -Dm755 "misc/init.d/avahi-daemon" "${DESTDIR}/etc/init.d/avahi-daemon"
install -Dm755 "misc/init.d/tlp-init.openrc-r2" "${DESTDIR}/etc/init.d/tlp"
