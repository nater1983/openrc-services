#!/bin/sh
# install_openrc_net.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

_gentoo_uri="gentoo"

# files
_Cbind=${_gentoo_uri}/net-dns/bind/files/named.confd-r7
_Ibind=${_gentoo_uri}/net-dns/bind/files/named.init-r13
_Csasl=${_gentoo_uri}/dev-libs/cyrus-sasl/files/saslauthd-2.1.26.conf
_Isasl=${_gentoo_uri}/dev-libs/cyrus-sasl/files/saslauthd2.rc7
_Cdhcp1=${_gentoo_uri}/net-misc/dhcp/files/dhcpd.conf2
_Cdhcp2=${_gentoo_uri}/net-misc/dhcp/files/dhcrelay.conf
_Cdhcp3=${_gentoo_uri}/net-misc/dhcp/files/dhcrelay6.conf
_Idhcp1=${_gentoo_uri}/net-misc/dhcp/files/dhcpd.init5
_Idhcp2=${_gentoo_uri}/net-misc/dhcp/files/dhcrelay.init3
_Chost=${_gentoo_uri}/net-wireless/hostapd/files/hostapd-conf.d
_Ihost=${_gentoo_uri}/net-wireless/hostapd/files/hostapd-init.d
_Cipt=${_gentoo_uri}/net-firewall/iptables/files/iptables-r1.confd
_Iipt=${_gentoo_uri}/net-firewall/iptables/files/iptables-r2.init
_Cip6t=${_gentoo_uri}/net-firewall/iptables/files/ip6tables-r1.confd
_Iip6t=${_gentoo_uri}/net-firewall/iptables/files/iptables-r2.init
#_Ikrb1=app-crypt/mit-krb5/files/mit-krb5kadmind.initd-r1
#_Ikrb2=app-crypt/mit-krb5/files/mit-krb5kdc.initd-r1
#_Ikrb3=app-crypt/mit-krb5/files/mit-krb5kpropd.initd-r1
#_Clight=www-servers/lighttpd/files/lighttpd.confd
#_Ilight=www-servers/lighttpd/files/lighttpd.initd
_Cnfs=${_gentoo_uri}/net-fs/nfs-utils/files/nfs.confd
_Infs=${_gentoo_uri}/net-fs/nfs-utils/files/nfs.initd
_Cnfsc=${_gentoo_uri}/net-fs/nfs-utils/files/nfsclient.confd
_Infsc=${_gentoo_uri}/net-fs/nfs-utils/files/nfsclient.initd
_Iidmapd=${_gentoo_uri}/net-fs/nfs-utils/files/rpc.idmapd.initd
_Ipipefs=${_gentoo_uri}/net-fs/nfs-utils/files/rpc.pipefs.initd
_Igssd=${_gentoo_uri}/net-fs/nfs-utils/files/rpc.gssd.initd
_Isvcgssd=${_gentoo_uri}/net-fs/nfs-utils/files/rpc.svcgssd.initd
_Istatd=${_gentoo_uri}/net-fs/nfs-utils/files/rpc.statd.initd
_Cldap=${_gentoo_uri}/net-nds/openldap/files/slapd-confd-2.4.28-r1
_Ildap=${_gentoo_uri}/net-nds/openldap/files/slapd-initd-2.4.40-r2
#_Islp=net-nds/openldap/files/slpd-init
_Cssh=${_gentoo_uri}/net-misc/openssh/files/sshd.confd
_Issh=${_gentoo_uri}/net-misc/openssh/files/sshd.rc6.4
_Ipolip=${_gentoo_uri}/net-proxy/polipo/files/polipo.initd-5
_Ipostfix=${_gentoo_uri}/mail-mta/postfix/files/postfix.rc6.2.7
_Ipriv=${_gentoo_uri}/net-proxy/privoxy/files/privoxy.initd-3
_Cquota=${_gentoo_uri}/sys-fs/quota/files/quota.confd
_Iquota1=${_gentoo_uri}/sys-fs/quota/files/quota.rc7
_Iquota2=${_gentoo_uri}/sys-fs/quota/files/rpc.rquotad.initd
_Crpc=${_gentoo_uri}/net-nds/rpcbind/files/rpcbind.confd
_Irpc=${_gentoo_uri}/net-nds/rpcbind/files/rpcbind.initd
_Crsync=${_gentoo_uri}/net-misc/rsync/files/rsyncd.conf.d
_Irsync=${_gentoo_uri}/net-misc/rsync/files/rsyncd.init.d-r1
_Csmb=${_gentoo_uri}/net-fs/samba/files/4.4/samba4.confd
_Ismb=${_gentoo_uri}/net-fs/samba/files/4.4/samba4.initd-r1
_Csquid=${_gentoo_uri}/net-proxy/squid/files/squid.confd-r1
_Isquid=${_gentoo_uri}/net-proxy/squid/files/squid.initd-r4
_Ctrans=${_gentoo_uri}/net-p2p/transmission/files/transmission-daemon.confd.4
_Itrans=${_gentoo_uri}/net-p2p/transmission/files/transmission-daemon.initd.10
_Cufw=${_gentoo_uri}/net-firewall/ufw/files/ufw.confd
_Iufw=${_gentoo_uri}/net-firewall/ufw/files/ufw-2.initd
_Ivsftp=${_gentoo_uri}/net-ftp/vsftpd/files/vsftpd.init
_Svsftp=${_gentoo_uri}/net-ftp/vsftpd/files/vsftpd-checkconfig.sh
_Iproftp=${_gentoo_uri}/net-ftp/proftpd/files/proftpd.initd
_Cvnstat=${_gentoo_uri}/net-analyzer/vnstat/files/vnstatd.confd
_Ivnstat=${_gentoo_uri}/net-analyzer/vnstat/files/vnstatd.initd-r1
_Cxinet=${_gentoo_uri}/sys-apps/xinetd/files/xinetd.confd
_Ixinet=${_gentoo_uri}/sys-apps/xinetd/files/xinetd.rc6
_Iautofs=${_gentoo_uri}/net-fs/autofs/files/autofs5.initd
_Cvpn=${_gentoo_uri}/net-vpn/openvpn/files/openvpn-2.1.conf
_Ivpn=${_gentoo_uri}/net-vpn/openvpn/files/openvpn-2.1.init
_Contp=${_gentoo_uri}/net-misc/openntpd/files/openntpd.conf.d-20080406-r6
_Iontp=${_gentoo_uri}/net-misc/openntpd/files/openntpd.init.d-20080406-r6
_Ctor=${_gentoo_uri}/net-vpn/tor/files/tor.confd
_Itor=${_gentoo_uri}/net-vpn/tor/files/tor.initd-r8
_Cnginx=${_gentoo_uri}/www-servers/nginx/files/nginx.confd
_Inginx=${_gentoo_uri}/www-servers/nginx/files/nginx.initd-r4
_Cdnsmasq=${_gentoo_uri}/net-dns/dnsmasq/files/dnsmasq.confd-r1
_Idnsmasq=${_gentoo_uri}/net-dns/dnsmasq/files/dnsmasq-init-r3
_Csyncthing=${_gentoo_uri}/net-p2p/syncthing/files/syncthing.confd
_Isyncthing=${_gentoo_uri}/net-p2p/syncthing/files/syncthing.initd
_Iteamvd=${_gentoo_uri}/net-misc/teamviewer/files/teamviewerd13.init
_Ctftphpa=${_gentoo_uri}/net-ftp/tftp-hpa/files/in.tftpd.confd-0.44
_Itftphpa=${_gentoo_uri}/net-ftp/tftp-hpa/files/in.tftpd.rc6

# install
install -Dm755 "${_Iautofs}" "${DESTDIR}/${SYSCONFDIR}/init.d/autofs"
install -Dm644 "${_Cbind}" "${DESTDIR}/${SYSCONFDIR}/conf.d/named"
install -Dm755 "${_Ibind}" "${DESTDIR}/${SYSCONFDIR}/init.d/named"
install -Dm644 "${_Csasl}" "${DESTDIR}/${SYSCONFDIR}/conf.d/saslauthd"
install -Dm755 "${_Isasl}" "${DESTDIR}/${SYSCONFDIR}/init.d/saslauthd"
install -Dm644 "${_Cdhcp1}" "${DESTDIR}/${SYSCONFDIR}/conf.d/dhcpd"
install -Dm644 "${_Cdhcp2}" "${DESTDIR}/${SYSCONFDIR}/conf.d/dhcrelay"
install -Dm644 "${_Cdhcp3}" "${DESTDIR}/${SYSCONFDIR}/conf.d/dhcrelay6"
install -Dm755 "${_Idhcp1}" "${DESTDIR}/${SYSCONFDIR}/init.d/dhcpd"
install -Dm755 "${_Idhcp2}" "${DESTDIR}/${SYSCONFDIR}/init.d/dhcrelay"
install -Dm755 "${_Idhcp2}" "${DESTDIR}/${SYSCONFDIR}/init.d/dhcrelay6"
install -Dm644 "${_Chost}" "${DESTDIR}/${SYSCONFDIR}/conf.d/hostapd"
install -Dm755 "${_Ihost}" "${DESTDIR}/${SYSCONFDIR}/init.d/hostapd"
install -Dm644 "${_Cipt}" "${DESTDIR}/${SYSCONFDIR}/conf.d/iptables"
install -Dm755 "${_Iipt}" "${DESTDIR}/${SYSCONFDIR}/init.d/iptables"
install -Dm644 "${_Cip6t}" "${DESTDIR}/${SYSCONFDIR}/conf.d/ip6tables"
install -Dm755 "${_Iip6t}" "${DESTDIR}/${SYSCONFDIR}/init.d/ip6tables"
#install -Dm755 "${_gentoo_uri}/${_Ikrb1}" "${DESTDIR}/${SYSCONFDIR}/init.d/krb5kadmind"
#install -Dm755 "${_gentoo_uri}/${_Ikrb2}" "${DESTDIR}/${SYSCONFDIR}/init.d/krb5kdc"
#install -Dm755 "${_gentoo_uri}/${_Ikrb3}" "${DESTDIR}/${SYSCONFDIR}/init.d/krb5kpropd"
#install -Dm644 "${_gentoo_uri}/${_Clight}" "${DESTDIR}/${SYSCONFDIR}/conf.d/lighttpd"
#install -Dm755 "${_gentoo_uri}/${_Ilight}" "${DESTDIR}/${SYSCONFDIR}/init.d/lighttpd"
install -Dm644 "${_Crpc}" "${DESTDIR}/${SYSCONFDIR}/conf.d/rpcbind"
install -Dm755 "${_Irpc}" "${DESTDIR}/${SYSCONFDIR}/init.d/rpcbind"
install -Dm644 "${_Cnfs}" "${DESTDIR}/${SYSCONFDIR}/conf.d/nfs"
install -Dm755 "${_Infs}" "${DESTDIR}/${SYSCONFDIR}/init.d/nfs"
install -Dm644 "${_Cnfsc}" "${DESTDIR}/${SYSCONFDIR}/conf.d/nfsclient"
install -Dm755 "${_Infsc}" "${DESTDIR}/${SYSCONFDIR}/init.d/nfsclient"
install -Dm755 "${_Igssd}" "${DESTDIR}/${SYSCONFDIR}/init.d/rpc.gssd"
install -Dm755 "${_Iidmapd}" "${DESTDIR}/${SYSCONFDIR}/init.d/rpc.idmapd"
install -Dm755 "${_Ipipefs}" "${DESTDIR}/${SYSCONFDIR}/init.d/rpc.pipefs"
install -Dm755 "${_Istatd}" "${DESTDIR}/${SYSCONFDIR}/init.d/rpc.statd"
install -Dm755 "${_Isvcgssd}" "${DESTDIR}/${SYSCONFDIR}/init.d/rpc.svcgssd"
install -Dm644 "${_Contp}" "${DESTDIR}/${SYSCONFDIR}/conf.d/openntpd"
install -Dm755 "${_Iontp}" "${DESTDIR}/${SYSCONFDIR}/init.d/openntpd"
install -Dm644 "${_Cldap}" "${DESTDIR}/${SYSCONFDIR}/conf.d/slapd"
install -Dm755 "${_Ildap}" "${DESTDIR}/${SYSCONFDIR}/init.d/slapd"
#install -Dm755 "${_gentoo_uri}/${_Islp}" "${DESTDIR}/${SYSCONFDIR}/init.d/slpd"
install -Dm644 "${_Cssh}" "${DESTDIR}/${SYSCONFDIR}/conf.d/sshd"
install -Dm755 "${_Issh}" "${DESTDIR}/${SYSCONFDIR}/init.d/sshd"
install -Dm644 "${_Cvpn}" "${DESTDIR}/${SYSCONFDIR}/conf.d/openvpn"
install -Dm755 "${_Ivpn}" "${DESTDIR}/${SYSCONFDIR}/init.d/openvpn"
install -Dm755 "${_Ipolip}" "${DESTDIR}/${SYSCONFDIR}/init.d/polipo"
install -Dm755 "${_Ipostfix}" "${DESTDIR}/${SYSCONFDIR}/init.d/postfix"
install -Dm755 "${_Ipriv}" "${DESTDIR}/${SYSCONFDIR}/init.d/privoxy"
install -Dm644 "${_Cquota}" "${DESTDIR}/${SYSCONFDIR}/conf.d/quota"
install -Dm755 "${_Iquota1}" "${DESTDIR}/${SYSCONFDIR}/init.d/quota"
install -Dm755 "${_Iquota2}" "${DESTDIR}/${SYSCONFDIR}/init.d/rpc.rquotad"
install -Dm644 "${_Crsync}" "${DESTDIR}/${SYSCONFDIR}/conf.d/rsyncd"
install -Dm755 "${_Irsync}" "${DESTDIR}/${SYSCONFDIR}/init.d/rsyncd"
install -Dm644 "${_Csmb}" "${DESTDIR}/${SYSCONFDIR}/conf.d/samba"
install -Dm755 "${_Ismb}" "${DESTDIR}/${SYSCONFDIR}/init.d/samba"
install -Dm644 "${_Csquid}" "${DESTDIR}/${SYSCONFDIR}/conf.d/squid"
install -Dm755 "${_Isquid}" "${DESTDIR}/${SYSCONFDIR}/init.d/squid"
install -Dm644 "${_Ctrans}" "${DESTDIR}/${SYSCONFDIR}/conf.d/transmission-daemon"
install -Dm755 "${_Itrans}" "${DESTDIR}/${SYSCONFDIR}/init.d/transmission-daemon"
install -Dm644 "${_Cufw}" "${DESTDIR}/${SYSCONFDIR}/conf.d/ufw"
install -Dm755 "${_Iufw}" "${DESTDIR}/${SYSCONFDIR}/init.d/ufw"
install -Dm755 "${_Ivsftp}" "${DESTDIR}/${SYSCONFDIR}/init.d/vsftpd"
install -Dm755 "${_Svsftp}" "${DESTDIR}/usr/libexec/vsftpd-checkconfig.sh"
install -Dm755 "${_Iproftp}" "${DESTDIR}/${SYSCONFDIR}/init.d/proftpd"
install -Dm644 "${_Cvnstat}" "${DESTDIR}/${SYSCONFDIR}/conf.d/vnstatd"
install -Dm755 "${_Ivnstat}" "${DESTDIR}/${SYSCONFDIR}/init.d/vnstatd"
install -Dm644 "${_Cxinet}" "${DESTDIR}/${SYSCONFDIR}/conf.d/xinetd"
install -Dm755 "${_Ixinet}" "${DESTDIR}/${SYSCONFDIR}/init.d/xinetd"
install -Dm644 "${_Ctor}" "${DESTDIR}/${SYSCONFDIR}/conf.d/tor"
install -Dm755 "${_Itor}" "${DESTDIR}/${SYSCONFDIR}/init.d/tor"
install -Dm644 "${_Cnginx}" "${DESTDIR}/${SYSCONFDIR}/conf.d/nginx"
install -Dm755 "${_Inginx}" "${DESTDIR}/${SYSCONFDIR}/init.d/nginx"
install -Dm644 "${_Cdnsmasq}" "${DESTDIR}/${SYSCONFDIR}/conf.d/dnsmasq"
install -Dm755 "${_Idnsmasq}" "${DESTDIR}/${SYSCONFDIR}/init.d/dnsmasq"
install -Dm644 "${_Csyncthing}" "${DESTDIR}/${SYSCONFDIR}/conf.d/syncthing"
install -Dm755 "${_Isyncthing}" "${DESTDIR}/${SYSCONFDIR}/init.d/syncthing"
install -Dm755 "${_Iteamvd}" "${DESTDIR}/${SYSCONFDIR}/init.d/teamviewerd"
install -Dm644 "${_Ctftphpa}" "${DESTDIR}/${SYSCONFDIR}/conf.d/tftpd-hpa"
install -Dm755 "${_Itftphpa}" "${DESTDIR}/${SYSCONFDIR}/init.d/tftpd-hpa"
install -Dm644 "misc/gentoo-apache/init/apache2.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/httpd"
install -Dm755 "misc/gentoo-apache/init/apache2.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/httpd"
install -Dm755 "misc/init.d/wicd.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/wicd"

# comments
#
# lighttpd not installed by default due to lack of /etc/lighttpd/lighttpd.conf
# which is sourced by /etc/conf.d/lighttpd and causes error when starting services.
