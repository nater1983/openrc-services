#!/bin/sh
# install_openrc_base.sh

DESTDIR=$1
DOWNLOAD_DIR=packages-openrc-master

_local_uri="${DOWNLOAD_DIR}/openrc-base"
_udev="udev-init-scripts"
_uver=30

# files
_Icron=${_local_uri}/cronie-1.3-initd
_Ccrypt=${_local_uri}/1.6.7-dmcrypt.confd
_Icrypt=${_local_uri}/1.6.7-dmcrypt.rc
_Idbus=${_local_uri}/dbus.initd-r1
_Inscd=${_local_uri}/nscd
_Cdm=${_local_uri}/device-mapper.conf-1.02.22-r3
_Idm1=${_local_uri}/device-mapper.rc-2.02.105-r2
_Idm2=${_local_uri}/dmeventd.initd-2.02.67-r1
_Clvm=${_local_uri}/lvm.confd-2.02.28-r2
_Ilvm1=${_local_uri}/lvm.rc-2.02.166-r2
_Ilvm2=${_local_uri}/lvm-monitoring.initd-2.02.105-r2
_Ilvm3=${_local_uri}/lvmetad.initd-2.02.116-r3
_Cmdadm=${_local_uri}/mdadm.confd
_Imdadm=${_local_uri}/mdadm.rc
_Idhcpcd=${_local_uri}/dhcpcd.initd
_Cmdraid=${_local_uri}/mdraid.confd
_Imdraid=${_local_uri}/mdraid.rc

# install
install -Dm755 "${_Icron}" "${DESTDIR}/etc/init.d/cronie"
install -Dm755 "${_Idhcpcd}" "${DESTDIR}/etc/init.d/dhcpcd"
install -Dm755 "${_Idbus}" "${DESTDIR}/etc/init.d/dbus"
install -Dm644 "${_Cdm}" "${DESTDIR}/etc/conf.d/device-mapper"
install -Dm755 "${_Idm1}" "${DESTDIR}/etc/init.d/device-mapper"
install -Dm755 "${_Idm2}" "${DESTDIR}/etc/init.d/dmeventd"
install -Dm644 "${_Ccrypt}" "${DESTDIR}/etc/conf.d/dmcrypt"
install -Dm755 "${_Icrypt}" "${DESTDIR}/etc/init.d/dmcrypt"
install -Dm755 "${_Inscd}" "${DESTDIR}/etc/init.d/nscd"
install -Dm644 "${_Clvm}" "${DESTDIR}/etc/conf.d/lvm"
install -Dm755 "${_Ilvm1}" "${DESTDIR}/etc/init.d/lvm"
install -Dm755 "${_Ilvm2}" "${DESTDIR}/etc/init.d/lvm-monitoring"
install -Dm755 "${_Ilvm3}" "${DESTDIR}/etc/init.d/lvmetad"
install -Dm644 "${_Cmdadm}" "${DESTDIR}/etc/conf.d/mdadm"
install -Dm755 "${_Imdadm}" "${DESTDIR}/etc/init.d/mdadm"
install -Dm644 "${_Cmdraid}" "${DESTDIR}/etc/conf.d/mdraid"
install -Dm755 "${_Imdraid}" "${DESTDIR}/etc/init.d/mdraid"
install -Dm755 "misc/init.d/kmod-static-nodes.initd" "${DESTDIR}/etc/init.d/kmod-static-nodes"
install -Dm644 "misc/${_udev}/conf.d/udev" "${DESTDIR}/etc/conf.d/udev"
install -Dm755 "misc/${_udev}/init.d/udev" "${DESTDIR}/etc/init.d/udev"
install -Dm644 "misc/${_udev}/conf.d/udev-settle" "${DESTDIR}/etc/conf.d/udev-settle"
install -Dm755 "misc/${_udev}/init.d/udev-settle" "${DESTDIR}/etc/init.d/udev-settle"
install -Dm644 "misc/${_udev}/conf.d/udev-trigger" "${DESTDIR}/etc/conf.d/udev-trigger"
install -Dm755 "misc/${_udev}/init.d/udev-trigger" "${DESTDIR}/etc/init.d/udev-trigger"
