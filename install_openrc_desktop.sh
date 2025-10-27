#!/bin/sh
# install_openrc_desktop.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}
LIBRCDIR=${LIBRCDIR:-usr/libexec/rc}

_gentoo_uri="gentoo"

# install
install -Dm644 "${_gentoo_uri}/media-sound/alsa-utils/files/alsasound.confd-r4" "${DESTDIR}/${SYSCONFDIR}/conf.d/alsasound"
install -Dm755 "${_gentoo_uri}/media-sound/alsa-utils/files/alsasound.initd-r8" "${DESTDIR}/${SYSCONFDIR}/init.d/alsasound"
install -Dm644 "${_gentoo_uri}/sys-auth/elogind/files/elogind.conf.in" "${DESTDIR}/${SYSCONFDIR}/conf.d/elogind"
install -Dm755 "${_gentoo_uri}/sys-auth/elogind/files/elogind.init-r1" "${DESTDIR}/${SYSCONFDIR}/init.d/elogind"
install -Dm644 "${_gentoo_uri}/sys-libs/gpm/files/gpm.conf.d" "${DESTDIR}/${SYSCONFDIR}/conf.d/gpm"
install -Dm755 "${_gentoo_uri}/sys-libs/gpm/files/gpm.rc6-2" "${DESTDIR}/${SYSCONFDIR}/init.d/gpm"
install -Dm644 "${_gentoo_uri}/net-wireless/bluez/files/bluetooth-conf.d" "${DESTDIR}/${SYSCONFDIR}/conf.d/bluetooth"
install -Dm755 "${_gentoo_uri}/net-wireless/bluez/files/bluetooth-init.d-r5" "${DESTDIR}/${SYSCONFDIR}/init.d/bluetooth"
install -Dm644 "${_gentoo_uri}/media-sound/pulseaudio/files/pulseaudio.conf.d" "${DESTDIR}/${SYSCONFDIR}/conf.d/pulseaudio"
install -Dm755 "${_gentoo_uri}/media-sound/pulseaudio/files/pulseaudio.init.d-5" "${DESTDIR}/${SYSCONFDIR}/init.d/pulseaudio"
install -Dm644 "${_gentoo_uri}/app-accessibility/espeakup/files/espeakup.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/espeakup"
install -Dm755 "${_gentoo_uri}/app-accessibility/espeakup/files/espeakup.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/espeakup"
install -Dm644 "${_gentoo_uri}/gui-libs/display-manager-init/files/display-manager.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/display-manager"
install -Dm755 "${_gentoo_uri}/gui-libs/display-manager-init/files/xdm.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/xdm"
install -Dm755 "${_gentoo_uri}/gui-libs/display-manager-init/files/display-manager-setup.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/display-manager-setup"
install -Dm755 "${_gentoo_uri}/gui-libs/display-manager-init/files/display-manager.initd-r1" "${DESTDIR}/${SYSCONFDIR}/init.d/display-manager"
install -Dm755 "${_gentoo_uri}/gui-libs/display-manager-init/files/startDM-r1" "${DESTDIR}/usr/bin/startDM"
install -Dm644 "${_gentoo_uri}/gui-libs/display-manager-init/files/sddm.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/sddm"
install -Dm755 "${_gentoo_uri}/gui-libs/display-manager-init/files/sddm.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/sddm"
install -Dm644 "misc/sys-power_acpid_2.0.32-r2_extras/acpid-2.0.16-conf.d" "${DESTDIR}/${SYSCONFDIR}/conf.d/acpid"
install -Dm755 "misc/sys-power_acpid_2.0.32-r2_extras/acpid-2.0.26-init.d" "${DESTDIR}/${SYSCONFDIR}/init.d/acpid"
install -Dm755 "misc/init.d/avahi-daemon" "${DESTDIR}/${SYSCONFDIR}/init.d/avahi-daemon"
install -Dm755 "misc/init.d/avahi-dnsconfd" "${DESTDIR}/${SYSCONFDIR}/init.d/avahi-dnsconfd"
install -Dm755 "misc/init.d/consolekit-1.0.0.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/consolekit"
install -Dm755 "misc/init.d/tlp-init.openrc-r3" "${DESTDIR}/${SYSCONFDIR}/init.d/tlp"
install -Dm644 "misc/sh/functions.sh" "${DESTDIR}/${LIBRCDIR}/sh/gentoo-functions.sh"
