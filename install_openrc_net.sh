#!/bin/sh
# install_openrc_net.sh

DESTDIR=$1
DOWNLOAD_DIR=packages-openrc-master

_local_uri="${DOWNLOAD_DIR}/openrc-net"
_gentoo_uri="gentoo"
_apver=2.4.18-r1

# files
_Cbind=${_local_uri}/named.confd-r7
_Ibind=${_local_uri}/named.init-r13
_Csasl=${_gentoo_uri}/dev-libs/cyrus-sasl/files/saslauthd-2.1.26.conf
_Isasl=${_local_uri}/saslauthd2.rc7
_Cdhcp1=${_local_uri}/dhcpd.conf2
_Cdhcp2=${_local_uri}/dhcrelay.conf
_Cdhcp3=${_local_uri}/dhcrelay6.conf
_Idhcp1=${_local_uri}/dhcpd.init5
_Idhcp2=${_local_uri}/dhcrelay.init3
_Chost=${_local_uri}/hostapd-conf.d
_Ihost=${_local_uri}/hostapd-init.d
_Cip1=${_local_uri}/iptables-1.4.13.confd
_Cip2=${_local_uri}/ip6tables-1.4.13.confd
_Iip=${_local_uri}/iptables-1.4.13-r1.init
#_Ikrb1=app-crypt/mit-krb5/files/mit-krb5kadmind.initd-r1
#_Ikrb2=app-crypt/mit-krb5/files/mit-krb5kdc.initd-r1
#_Ikrb3=app-crypt/mit-krb5/files/mit-krb5kpropd.initd-r1
#_Clight=www-servers/lighttpd/files/lighttpd.confd
#_Ilight=www-servers/lighttpd/files/lighttpd.initd
_Cnfs=${_local_uri}/nfs.confd
_Infs=${_local_uri}/nfs.initd
_Cnfsc=${_local_uri}/nfsclient.confd
_Infsc=${_local_uri}/nfsclient.initd
_Iidmapd=${_local_uri}/rpc.idmapd.initd
_Ipipefs=${_local_uri}/rpc.pipefs.initd
_Igssd=${_local_uri}/rpc.gssd.initd
_Isvcgssd=${_local_uri}/rpc.svcgssd.initd
_Istatd=${_local_uri}/rpc.statd.initd
_Cldap=${_local_uri}/slapd-confd-2.4.28-r1
_Ildap=${_local_uri}/slapd-initd-2.4.40-r2
#_Islp=net-nds/openldap/files/slpd-init
_Cssh=${_local_uri}/sshd.confd
_Issh=${_local_uri}/sshd.rc6.4
_Ipolip=${_local_uri}/polipo.initd-5
_Ipostfix=${_local_uri}/postfix.rc6.2.7
_Ipriv=${_local_uri}/privoxy.initd-3
_Cquota=${_local_uri}/quota.confd
_Iquota1=${_local_uri}/quota.rc7
_Iquota2=${_local_uri}/rpc.rquotad.initd
_Irpc=${_local_uri}/rpcbind.initd
_Crsync=${_local_uri}/rsyncd.conf.d
_Irsync=${_local_uri}/rsyncd.init.d-r1
_Csmb=${_local_uri}/samba4.confd
_Ismb=${_local_uri}/samba4.initd-r1
_Csquid=${_local_uri}/squid.confd-r1
_Isquid=${_local_uri}/squid.initd-r4
_Ctrans=${_local_uri}/transmission-daemon.confd.4
_Itrans=${_local_uri}/transmission-daemon.initd.10
_Cufw=${_local_uri}/ufw.confd
_Iufw=${_local_uri}/ufw-2.initd
_Ivsftp=${_local_uri}/vsftpd.init
_Svsftp=${_local_uri}/vsftpd-checkconfig.sh
_Iproftp=${_gentoo_uri}/net-ftp/proftpd/files/proftpd.initd
_Cvnstat=${_local_uri}/vnstatd.confd
_Ivnstat=${_local_uri}/vnstatd.initd-r1
_Cxinet=${_local_uri}/xinetd.confd
_Ixinet=${_local_uri}/xinetd.rc6
_Cypbind=${_local_uri}/ypbind.confd-r1
_Iypbind=${_local_uri}/ypbind.initd
_Cypserv1=${_local_uri}/ypserv.confd
#_Cypserv2=net-nds/ypserv/files/rpc.yppasswdd.confd
#_Cypserv3=net-nds/ypserv/files/rpc.ypxfrd.confd
_Iypserv1=${_local_uri}/ypserv
#_Iypserv2=net-nds/ypserv/files/rpc.yppasswdd-r1
#_Iypserv3=net-nds/ypserv/files/rpc.ypxfrd-2.23
_Iautofs=${_local_uri}/autofs5.initd
_Cvpn=${_local_uri}/openvpn-2.1.conf
_Ivpn=${_local_uri}/openvpn-2.1.init
_Contp=${_local_uri}/openntpd.conf.d-20080406-r6
_Iontp=${_local_uri}/openntpd.init.d-20080406-r6
_Ctor=${_local_uri}/tor.confd
_Itor=${_local_uri}/tor.initd-r7
_Inginx=${_local_uri}/nginx.initd-r3

# install
install -Dm755 "${_Iautofs}" "${DESTDIR}/etc/init.d/autofs"
install -Dm644 "${_Cbind}" "${DESTDIR}/etc/conf.d/named"
install -Dm755 "${_Ibind}" "${DESTDIR}/etc/init.d/named"
install -Dm644 "${_Csasl}" "${DESTDIR}/etc/conf.d/saslauthd"
install -Dm755 "${_Isasl}" "${DESTDIR}/etc/init.d/saslauthd"
install -Dm644 "${_Cdhcp1}" "${DESTDIR}/etc/conf.d/dhcpd"
install -Dm644 "${_Cdhcp2}" "${DESTDIR}/etc/conf.d/dhcrelay"
install -Dm644 "${_Cdhcp3}" "${DESTDIR}/etc/conf.d/dhcrelay6"
install -Dm755 "${_Idhcp1}" "${DESTDIR}/etc/init.d/dhcpd"
install -Dm755 "${_Idhcp2}" "${DESTDIR}/etc/init.d/dhcrelay"
install -Dm755 "${_Idhcp2}" "${DESTDIR}/etc/init.d/dhcrelay6"
install -Dm644 "${_Chost}" "${DESTDIR}/etc/conf.d/hostapd"
install -Dm755 "${_Ihost}" "${DESTDIR}/etc/init.d/hostapd"
install -Dm644 "${_Cip1}" "${DESTDIR}/etc/conf.d/iptables"
install -Dm755 "${_Iip}" "${DESTDIR}/etc/init.d/iptables"
install -Dm644 "${_Cip2}" "${DESTDIR}/etc/conf.d/ip6tables"
install -Dm755 "${_Iip}" "${DESTDIR}/etc/init.d/ip6tables"
#install -Dm755 "${_gentoo_uri}/${_Ikrb1}" "${DESTDIR}/etc/init.d/krb5kadmind"
#install -Dm755 "${_gentoo_uri}/${_Ikrb2}" "${DESTDIR}/etc/init.d/krb5kdc"
#install -Dm755 "${_gentoo_uri}/${_Ikrb3}" "${DESTDIR}/etc/init.d/krb5kpropd"
#install -Dm644 "${_gentoo_uri}/${_Clight}" "${DESTDIR}/etc/conf.d/lighttpd"
#install -Dm755 "${_gentoo_uri}/${_Ilight}" "${DESTDIR}/etc/init.d/lighttpd"
install -Dm755 "${_Irpc}" "${DESTDIR}/etc/init.d/rpcbind"
install -Dm644 "${_Cnfs}" "${DESTDIR}/etc/conf.d/nfs"
install -Dm755 "${_Infs}" "${DESTDIR}/etc/init.d/nfs"
install -Dm644 "${_Cnfsc}" "${DESTDIR}/etc/conf.d/nfsclient"
install -Dm755 "${_Infsc}" "${DESTDIR}/etc/init.d/nfsclient"
install -Dm755 "${_Igssd}" "${DESTDIR}/etc/init.d/rpc.gssd"
install -Dm755 "${_Iidmapd}" "${DESTDIR}/etc/init.d/rpc.idmapd"
install -Dm755 "${_Ipipefs}" "${DESTDIR}/etc/init.d/rpc.pipefs"
install -Dm755 "${_Istatd}" "${DESTDIR}/etc/init.d/rpc.statd"
install -Dm755 "${_Isvcgssd}" "${DESTDIR}/etc/init.d/rpc.svcgssd"
install -Dm644 "${_Contp}" "${DESTDIR}/etc/conf.d/openntpd"
install -Dm755 "${_Iontp}" "${DESTDIR}/etc/init.d/openntpd"
install -Dm644 "${_Cldap}" "${DESTDIR}/etc/conf.d/slapd"
install -Dm755 "${_Ildap}" "${DESTDIR}/etc/init.d/slapd"
#install -Dm755 "${_gentoo_uri}/${_Islp}" "${DESTDIR}/etc/init.d/slpd"
install -Dm644 "${_Cssh}" "${DESTDIR}/etc/conf.d/sshd"
install -Dm755 "${_Issh}" "${DESTDIR}/etc/init.d/sshd"
install -Dm644 "${_Cvpn}" "${DESTDIR}/etc/conf.d/openvpn"
install -Dm755 "${_Ivpn}" "${DESTDIR}/etc/init.d/openvpn"
install -Dm755 "${_Ipolip}" "${DESTDIR}/etc/init.d/polipo"
install -Dm755 "${_Ipostfix}" "${DESTDIR}/etc/init.d/postfix"
install -Dm755 "${_Ipriv}" "${DESTDIR}/etc/init.d/privoxy"
install -Dm644 "${_Cquota}" "${DESTDIR}/etc/conf.d/quota"
install -Dm755 "${_Iquota1}" "${DESTDIR}/etc/init.d/quota"
install -Dm755 "${_Iquota2}" "${DESTDIR}/etc/init.d/rpc.rquotad"
install -Dm644 "${_Crsync}" "${DESTDIR}/etc/conf.d/rsyncd"
install -Dm755 "${_Irsync}" "${DESTDIR}/etc/init.d/rsyncd"
install -Dm644 "${_Csmb}" "${DESTDIR}/etc/conf.d/samba"
install -Dm755 "${_Ismb}" "${DESTDIR}/etc/init.d/samba"
install -Dm644 "${_Csquid}" "${DESTDIR}/etc/conf.d/squid"
install -Dm755 "${_Isquid}" "${DESTDIR}/etc/init.d/squid"
install -Dm644 "${_Ctrans}" "${DESTDIR}/etc/conf.d/transmission-daemon"
install -Dm755 "${_Itrans}" "${DESTDIR}/etc/init.d/transmission-daemon"
install -Dm644 "${_Cufw}" "${DESTDIR}/etc/conf.d/ufw"
install -Dm755 "${_Iufw}" "${DESTDIR}/etc/init.d/ufw"
install -Dm755 "${_Ivsftp}" "${DESTDIR}/etc/init.d/vsftpd"
install -Dm755 "${_Svsftp}" "${DESTDIR}/usr/libexec/vsftpd-checkconfig.sh"
install -Dm755 "${_Iproftp}" "${DESTDIR}/etc/init.d/proftpd"
install -Dm644 "${_Cvnstat}" "${DESTDIR}/etc/conf.d/vnstatd"
install -Dm755 "${_Ivnstat}" "${DESTDIR}/etc/init.d/vnstatd"
install -Dm644 "${_Cxinet}" "${DESTDIR}/etc/conf.d/xinetd"
install -Dm755 "${_Ixinet}" "${DESTDIR}/etc/init.d/xinetd"
install -Dm644 "${_Cypbind}" "${DESTDIR}/etc/conf.d/ypbind"
install -Dm755 "${_Iypbind}" "${DESTDIR}/etc/init.d/ypbind"
install -Dm644 "${_Iypserv1}" "${DESTDIR}/etc/conf.d/ypserv"
install -Dm755 "${_Cypserv1}" "${DESTDIR}/etc/init.d/ypserv"
#install -Dm644 "${_gentoo_uri}/${_Cypserv2}" "${DESTDIR}/etc/conf.d/rpc.yppasswdd"
#install -Dm755 "${_gentoo_uri}/${_Iypserv2}" "${DESTDIR}/etc/init.d/rpc.yppasswdd"
#install -Dm644 "${_gentoo_uri}/${_Cypserv3}" "${DESTDIR}/etc/conf.d/rpc.ypxfrd"
#install -Dm755 "${_gentoo_uri}/${_Iypserv3}" "${DESTDIR}/etc/init.d/rpc.ypxfrd"
install -Dm644 "${_Ctor}" "${DESTDIR}/etc/conf.d/tor"
install -Dm755 "${_Itor}" "${DESTDIR}/etc/init.d/tor"
install -Dm755 "${_Inginx}" "${DESTDIR}/etc/init.d/nginx"
install -Dm644 "misc/gentoo-apache-${_apver}/init/apache2.confd" "${DESTDIR}/etc/conf.d/httpd"
install -Dm755 "misc/gentoo-apache-${_apver}/init/apache2.initd" "${DESTDIR}/etc/init.d/httpd"
install -Dm755 "misc/init.d/wicd.initd" "${DESTDIR}/etc/init.d/wicd"
install -Dm644 "misc/conf.d/syncthing.confd" "${DESTDIR}/etc/conf.d/syncthing"
install -Dm755 "misc/init.d/syncthing.initd" "${DESTDIR}/etc/init.d/syncthing"
install -Dm644 "misc/conf.d/dnsmasq.confd" "${DESTDIR}/etc/conf.d/dnsmasq"
install -Dm755 "misc/init.d/dnsmasq.init" "${DESTDIR}/etc/init.d/dnsmasq"
install -Dm644 "misc/conf.d/rpcbind.confd" "${DESTDIR}/etc/conf.d/rpcbind"

# comments
#
# lighttpd not installed by default due to lack of /etc/lighttpd/lighttpd.conf
# which is sourced by /etc/conf.d/lighttpd and causes error when starting services.
