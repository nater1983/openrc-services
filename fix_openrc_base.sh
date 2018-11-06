#!/bin/sh
# fix_openrc_base.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

# https://stackoverflow.com/a/29394504/4005566
function ver { printf "%03d%03d%03d%03d" $(echo "$1" | tr '.' ' '); }

# dbus
_p1='s|dbus.pid|dbus/dbus.pid|g'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/dbus"

# dhcpcd
# get dhcpcd version
dhcpcd_ver=$(ls /var/log/packages/ | grep dhcpcd | cut -f 2 -d "-")
if [ $(ver "$dhcpcd_ver") -lt $(ver "6.10") ]; then
  # fix for slackware 14.2
  _p1='s|dhcpcd.pid|dhcpcd/dhcpcd.pid|g'
  sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/dhcpcd"
fi

# dmeventd
sed 's| --pidfile $PIDFILE||g' -i "${DESTDIR}/${SYSCONFDIR}/init.d/dmeventd"
