#!/bin/sh
# fix_openrc_base.sh

DESTDIR=$1

# dbus
_p1='s|dbus.pid|dbus/dbus.pid|g'
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/dbus"

# dhcpcd
# get dhcpcd version
dhcpcd_ver=$(ls /var/log/packages/ | grep dhcpcd | cut -f 2 -d "-")
if [ ! "$dhcpcd_ver" = '6.0.5' ]; then
  # fix for slackware current
  _p1='s|dhcpcd.pid|dhcpcd/dhcpcd.pid|g'
  sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/dhcpcd"
fi

# dmeventd
sed 's| --pidfile $PIDFILE||g' -i "${DESTDIR}/etc/init.d/dmeventd"
