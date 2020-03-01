#!/bin/sh
# fix_openrc_net.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

# dnsmasq
_p1='/DNSMASQ_OPTS/s/^/#/'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/conf.d/dnsmasq"

# named
_p1='s|/etc/bind/named.conf|/etc/named.conf|g'
_p2='s|-u named||g'
_p3='s|root:named|root|g'
sed -e "${_p1}" -e "${_p2}" -e "${_p3}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/named"

# hostapd
sed -e "s|INTERFACES=|#INTERFACES=|" -i "${DESTDIR}/${SYSCONFDIR}/conf.d/hostapd"

# wpa_supplicant
if [ -f /etc/os-release ]; then
  sed -e "s|gentoo-release|os-release|" -i "${DESTDIR}/etc/wpa_supplicant/wpa_cli.sh"
fi
_p1="s|etc/init.d|${SYSCONFDIR}/init.d|g"
sed -e "${_p1}" -i "${DESTDIR}/etc/wpa_supplicant/wpa_cli.sh"

# networkmanager
sed -e 's|@EPREFIX@||g' -i "${DESTDIR}/etc/NetworkManager/dispatcher.d/10-openrc-status"

# iptables
_p1='s|/sbin/${iptables_name}|/usr/sbin/${iptables_name}|g'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/iptables"
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/ip6tables"

# proftpd
_p1='s|/etc/proftpd|/etc|g'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/proftpd"

# saslauthd
_p1='s|-a pam|-a shadow|'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/conf.d/saslauthd"

# vsftpd
_p1='s|/etc/vsftpd|/etc|g'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/vsftpd"

# vnstatd
_p1='/checkpath -q/d'
_p2='/--user vnstat --group vnstat/d'
_p3='s|/usr/bin/vnstatd|/usr/sbin/vnstatd|'
sed -e "${_p1}" -e "${_p2}" -e "${_p3}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/vnstatd"
