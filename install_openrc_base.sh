#!/bin/sh
# install_openrc_base.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

_gentoo_uri="gentoo"

# install
install -Dm755 "${_gentoo_uri}/sys-process/cronie/files/cronie-1.3-initd" "${DESTDIR}/${SYSCONFDIR}/init.d/cronie"
install -Dm755 "${_gentoo_uri}/net-misc/dhcpcd/files/dhcpcd.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/dhcpcd"
install -Dm755 "${_gentoo_uri}/sys-apps/dbus/files/dbus.initd.in" "${DESTDIR}/${SYSCONFDIR}/init.d/dbus"
install -Dm644 "${_gentoo_uri}/sys-fs/lvm2/files/device-mapper.conf-1.02.22-r3" "${DESTDIR}/${SYSCONFDIR}/conf.d/device-mapper"
install -Dm755 "${_gentoo_uri}/sys-fs/lvm2/files/device-mapper.rc-2.02.105-r2" "${DESTDIR}/${SYSCONFDIR}/init.d/device-mapper"
install -Dm755 "${_gentoo_uri}/sys-fs/lvm2/files/dmeventd.initd-2.02.184-r2" "${DESTDIR}/${SYSCONFDIR}/init.d/dmeventd"
install -Dm644 "${_gentoo_uri}/sys-fs/cryptsetup/files/2.4.0-dmcrypt.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/dmcrypt"
install -Dm755 "${_gentoo_uri}/sys-fs/cryptsetup/files/2.4.0-dmcrypt.rc"  "${DESTDIR}/${SYSCONFDIR}/init.d/dmcrypt"
install -Dm644 "${_gentoo_uri}/sys-fs/lvm2/files/lvm.confd-2.02.184-r3" "${DESTDIR}/${SYSCONFDIR}/conf.d/lvm"
install -Dm755 "${_gentoo_uri}/sys-fs/lvm2/files/lvm.rc-2.02.187" "${DESTDIR}/${SYSCONFDIR}/init.d/lvm"
install -Dm755 "${_gentoo_uri}/sys-fs/lvm2/files/lvm-monitoring.initd-2.02.105-r2" "${DESTDIR}/${SYSCONFDIR}/init.d/lvm-monitoring"
install -Dm755 "${_gentoo_uri}/sys-fs/lvm2/files/lvmetad.initd-2.02.116-r3" "${DESTDIR}/${SYSCONFDIR}/init.d/lvmetad"
install -Dm644 "${_gentoo_uri}/sys-fs/mdadm/files/mdadm.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/mdadm"
install -Dm755 "${_gentoo_uri}/sys-fs/mdadm/files/mdadm.rc" "${DESTDIR}/${SYSCONFDIR}/init.d/mdadm"
install -Dm644 "${_gentoo_uri}/sys-fs/mdadm/files/mdraid.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/mdraid"
install -Dm755 "${_gentoo_uri}/sys-fs/mdadm/files/mdraid.rc" "${DESTDIR}/${SYSCONFDIR}/init.d/mdraid"
install -Dm755 "${_gentoo_uri}/sys-apps/kmod/files/kmod-static-nodes-r1" "${DESTDIR}/${SYSCONFDIR}/init.d/kmod-static-nodes"
install -Dm644 "misc/udev-init-scripts-32/conf.d/udev" "${DESTDIR}/${SYSCONFDIR}/conf.d/udev"
install -Dm755 "misc/udev-init-scripts-32/init.d/udev" "${DESTDIR}/${SYSCONFDIR}/init.d/udev"
install -Dm644 "misc/udev-init-scripts-32/conf.d/udev-settle" "${DESTDIR}/${SYSCONFDIR}/conf.d/udev-settle"
install -Dm755 "misc/udev-init-scripts-32/init.d/udev-settle" "${DESTDIR}/${SYSCONFDIR}/init.d/udev-settle"
install -Dm644 "misc/udev-init-scripts-32/conf.d/udev-trigger" "${DESTDIR}/${SYSCONFDIR}/conf.d/udev-trigger"
install -Dm755 "misc/udev-init-scripts-32/init.d/udev-trigger" "${DESTDIR}/${SYSCONFDIR}/init.d/udev-trigger"
