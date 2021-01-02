#!/bin/sh
# install_openrc_desktop.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

_gentoo_uri="gentoo"

# install
install -Dm644 "${_gentoo_uri}/sys-power/acpid/files/acpid-2.0.16-conf.d" "${DESTDIR}/${SYSCONFDIR}/conf.d/acpid"
install -Dm755 "${_gentoo_uri}/sys-power/acpid/files/acpid-2.0.26-init.d" "${DESTDIR}/${SYSCONFDIR}/init.d/acpid"
install -Dm644 "${_gentoo_uri}/media-sound/alsa-utils/files/alsasound.confd-r4" "${DESTDIR}/${SYSCONFDIR}/conf.d/alsasound"
install -Dm755 "${_gentoo_uri}/media-sound/alsa-utils/files/alsasound.initd-r6" "${DESTDIR}/${SYSCONFDIR}/init.d/alsasound"
install -Dm755 "${_gentoo_uri}/sys-auth/consolekit/files/consolekit-1.0.0.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/consolekit"
install -Dm755 "${_gentoo_uri}/app-admin/cgmanager/files/cgmanager.initd-r1" "${DESTDIR}/${SYSCONFDIR}/init.d/cgmanager"
install -Dm755 "${_gentoo_uri}/app-admin/cgmanager/files/cgproxy.initd-r1" "${DESTDIR}/${SYSCONFDIR}/init.d/cgproxy"
install -Dm644 "${_gentoo_uri}/sys-auth/elogind/files/elogind.conf.in" "${DESTDIR}/${SYSCONFDIR}/conf.d/elogind"
install -Dm755 "${_gentoo_uri}/sys-auth/elogind/files/elogind.init" "${DESTDIR}/${SYSCONFDIR}/init.d/elogind"
install -Dm644 "${_gentoo_uri}/x11-base/xorg-server/files/xdm.confd-4" "${DESTDIR}/${SYSCONFDIR}/conf.d/xdm"
install -Dm755 "${_gentoo_uri}/x11-base/xorg-server/files/xdm.initd-11" "${DESTDIR}/${SYSCONFDIR}/init.d/xdm"
install -Dm755 "${_gentoo_uri}/x11-base/xorg-server/files/xdm-setup.initd-1" "${DESTDIR}/${SYSCONFDIR}/init.d/xdm-setup"
install -Dm755 "${_gentoo_uri}/x11-apps/xinit/files/startDM.sh" "${DESTDIR}/etc/X11/startDM.sh"
install -Dm644 "${_gentoo_uri}/sys-libs/gpm/files/gpm.conf.d" "${DESTDIR}/${SYSCONFDIR}/conf.d/gpm"
install -Dm755 "${_gentoo_uri}/sys-libs/gpm/files/gpm.rc6-2" "${DESTDIR}/${SYSCONFDIR}/init.d/gpm"
install -Dm755 "${_gentoo_uri}/net-wireless/bluez/files/bluetooth-init.d-r4" "${DESTDIR}/${SYSCONFDIR}/init.d/bluetooth"
install -Dm644 "${_gentoo_uri}/media-sound/pulseaudio/files/pulseaudio.conf.d" "${DESTDIR}/${SYSCONFDIR}/conf.d/pulseaudio"
install -Dm755 "${_gentoo_uri}/media-sound/pulseaudio/files/pulseaudio.init.d-5" "${DESTDIR}/${SYSCONFDIR}/init.d/pulseaudio"
install -Dm644 "${_gentoo_uri}/app-accessibility/espeakup/files/espeakup.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/espeakup"
install -Dm755 "${_gentoo_uri}/app-accessibility/espeakup/files/espeakup.rc" "${DESTDIR}/${SYSCONFDIR}/init.d/espeakup"
install -Dm755 "misc/init.d/avahi-daemon" "${DESTDIR}/${SYSCONFDIR}/init.d/avahi-daemon"
install -Dm755 "misc/init.d/avahi-daemon" "${DESTDIR}/${SYSCONFDIR}/init.d/avahi-daemon"
install -Dm755 "misc/init.d/tlp-init.openrc-r2" "${DESTDIR}/${SYSCONFDIR}/init.d/tlp"
