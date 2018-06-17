#!/bin/sh
# fix_openrc_net.sh

DESTDIR=$1

# apache (httpd)
_p1='s|/usr/sbin/apache2|/usr/sbin/apachectl|'
_p2='s|/etc/apache2/httpd.conf|/etc/httpd/httpd.conf|'
if [ "$(uname -m)" = x86_64 ]; then
  _p4='s|/usr/lib/apache2|/usr/lib64/httpd|'
else
  _p4='s|/usr/lib/apache2|/usr/lib/httpd|'
fi
_p5='s|apache2.pid|httpd.pid|'
_p6='s|apache2 >/dev/null|httpd >/dev/null|'
_p7='s|apache2|httpd|g'
_p8='s|/run/apache_ssl_mutex|/run/httpd|'
_p9='s|start-stop-daemon --start|start-stop-daemon --start --pidfile ${PIDFILE}|'
sed -e "${_p1}" -e "${_p2}" -e "${_p4}" -e "${_p5}" -e "${_p6}" -e "${_p8}" -e "${_p9}" -i "${DESTDIR}/etc/init.d/httpd"
sed -e "${_p2}" -e "${_p4}" -e "${_p5}" -e "${_p7}" -i "${DESTDIR}/etc/conf.d/httpd"

# named
_p1='s|/etc/bind/named.conf|/etc/named.conf|g'
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/named"

# hostapd
sed -e "s|INTERFACES=|#INTERFACES=|" -i "${DESTDIR}/etc/conf.d/hostapd"

# iptables
_p1='s|/sbin/${iptables_name}|/usr/sbin/${iptables_name}|g'
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/iptables"
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/ip6tables"

# proftpd
_p1='s|/etc/proftpd|/etc|g'
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/proftpd"

# saslauthd
_p1='s|-a pam|-a shadow|'
sed -e "${_p1}" -i "${DESTDIR}/etc/conf.d/saslauthd"

# vsftpd
_p1='s|/etc/vsftpd|/etc|g'
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/vsftpd"

# vnstatd
_p1='/checkpath -q/d'
_p2='/--user vnstat --group vnstat/d'
sed -e "${_p1}" -e "${_p2}" -i "${DESTDIR}/etc/init.d/vnstatd"
