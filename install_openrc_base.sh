#!/bin/sh
# install_openrc_base.sh

DESTDIR=$1

_gentoo_uri="gentoo"
_udev="udev-init-scripts"

# files
_Icron=${_gentoo_uri}/sys-process/cronie/files/cronie-1.3-initd
_Ccrypt=${_gentoo_uri}/sys-fs/cryptsetup/files/1.6.7-dmcrypt.confd
_Icrypt=${_gentoo_uri}/sys-fs/cryptsetup/files/1.6.7-dmcrypt.rc
_Idbus=${_gentoo_uri}/sys-apps/dbus/files/dbus.initd-r1
_Cdm=${_gentoo_uri}/sys-fs/lvm2/files/device-mapper.conf-1.02.22-r3
_Idm1=${_gentoo_uri}/sys-fs/lvm2/files/device-mapper.rc-2.02.105-r2
_Idm2=${_gentoo_uri}/sys-fs/lvm2/files/dmeventd.initd-2.02.67-r1
_Clvm=${_gentoo_uri}/sys-fs/lvm2/files/lvm.confd-2.02.28-r2
_Ilvm1=${_gentoo_uri}/sys-fs/lvm2/files/lvm.rc-2.02.166-r2
_Ilvm2=${_gentoo_uri}/sys-fs/lvm2/files/lvm-monitoring.initd-2.02.105-r2
_Ilvm3=${_gentoo_uri}/sys-fs/lvm2/files/lvmetad.initd-2.02.116-r3
_Cmdadm=${_gentoo_uri}/sys-fs/mdadm/files/mdadm.confd
_Imdadm=${_gentoo_uri}/sys-fs/mdadm/files/mdadm.rc
_Idhcpcd=${_gentoo_uri}/net-misc/dhcpcd/files/dhcpcd.initd
_Cmdraid=${_gentoo_uri}/sys-fs/mdadm/files/mdraid.confd
_Imdraid=${_gentoo_uri}/sys-fs/mdadm/files/mdraid.rc
_Ikmod=${_gentoo_uri}/sys-apps/kmod/files/kmod-static-nodes-r1

# install
install -Dm755 "${_Icron}" "${DESTDIR}/etc/init.d/cronie"
install -Dm755 "${_Idhcpcd}" "${DESTDIR}/etc/init.d/dhcpcd"
install -Dm755 "${_Idbus}" "${DESTDIR}/etc/init.d/dbus"
install -Dm644 "${_Cdm}" "${DESTDIR}/etc/conf.d/device-mapper"
install -Dm755 "${_Idm1}" "${DESTDIR}/etc/init.d/device-mapper"
install -Dm755 "${_Idm2}" "${DESTDIR}/etc/init.d/dmeventd"
install -Dm644 "${_Ccrypt}" "${DESTDIR}/etc/conf.d/dmcrypt"
install -Dm755 "${_Icrypt}" "${DESTDIR}/etc/init.d/dmcrypt"
install -Dm644 "${_Clvm}" "${DESTDIR}/etc/conf.d/lvm"
install -Dm755 "${_Ilvm1}" "${DESTDIR}/etc/init.d/lvm"
install -Dm755 "${_Ilvm2}" "${DESTDIR}/etc/init.d/lvm-monitoring"
install -Dm755 "${_Ilvm3}" "${DESTDIR}/etc/init.d/lvmetad"
install -Dm644 "${_Cmdadm}" "${DESTDIR}/etc/conf.d/mdadm"
install -Dm755 "${_Imdadm}" "${DESTDIR}/etc/init.d/mdadm"
install -Dm644 "${_Cmdraid}" "${DESTDIR}/etc/conf.d/mdraid"
install -Dm755 "${_Imdraid}" "${DESTDIR}/etc/init.d/mdraid"
install -Dm755 "${_Ikmod}" "${DESTDIR}/etc/init.d/kmod-static-nodes"
install -Dm644 "misc/${_udev}/conf.d/udev" "${DESTDIR}/etc/conf.d/udev"
install -Dm755 "misc/${_udev}/init.d/udev" "${DESTDIR}/etc/init.d/udev"
install -Dm644 "misc/${_udev}/conf.d/udev-settle" "${DESTDIR}/etc/conf.d/udev-settle"
install -Dm755 "misc/${_udev}/init.d/udev-settle" "${DESTDIR}/etc/init.d/udev-settle"
install -Dm644 "misc/${_udev}/conf.d/udev-trigger" "${DESTDIR}/etc/conf.d/udev-trigger"
install -Dm755 "misc/${_udev}/init.d/udev-trigger" "${DESTDIR}/etc/init.d/udev-trigger"
