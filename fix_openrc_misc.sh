#!/bin/sh
# fix_openrc_misc.sh

DESTDIR=$1

# bitlbee
_p1='s|need logger net|need net\n	use logger|'
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/bitlbee"

# cups
_p1='s|lp:lpadmin|daemon:sys|'
_p2='s|@neededservices@|need dbus|'
sed -e "${_p1}" -e "${_p2}" -i "${DESTDIR}/etc/init.d/cupsd"

# fcron
_p1='s|/usr/libexec|/usr/sbin|g'
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/fcron"

# vboxservice
_p1='s|vboxguest-service|VBoxService|'
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/vboxservice"

# libvirt
_p1='s|USE_FLAG_FIREWALLD||'
_p2='s|USE_FLAG_AVAHI||'
_p3='s|USE_FLAG_ISCSI||'
_p4='s|USE_FLAG_RBD||'
sed -e "${_p1}" -e "${_p2}" -e "${_p3}" -e "${_p4}" -i "${DESTDIR}/etc/init.d/libvirtd"

# saned
_p1='s|saned/saned.pid|saned.pid|g'
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/saned"

# zfs
_p1='s|/usr/bin/zfs|/sbin/zfs|'
_p2='s|/usr/bin/zpool|/sbin/zpool|'
sed -e "${_p1}" -e "${_p2}" -i "${DESTDIR}/etc/init.d/zfs"
