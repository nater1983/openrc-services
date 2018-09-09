#!/bin/sh
# install_openrc_slack.sh

DESTDIR=$1

_gentoo_uri="gentoo"

# files
_Cdcron="${_gentoo_uri}/sys-process/dcron/files/dcron.confd"
_Idcron="${_gentoo_uri}/sys-process/dcron/files/dcron.init"
_Csysklogd="${_gentoo_uri}/app-admin/sysklogd/files/sysklogd.confd"
_Isysklogd="${_gentoo_uri}/app-admin/sysklogd/files/sysklogd.rc7"
_Csnmp="${_gentoo_uri}/net-analyzer/net-snmp/files/snmpd.conf"
_Isnmp="${_gentoo_uri}/net-analyzer/net-snmp/files/snmpd.init.2"
_Csnmptrap="${_gentoo_uri}/net-analyzer/net-snmp/files/snmptrapd.conf"
_Isnmptrap="${_gentoo_uri}/net-analyzer/net-snmp/files/snmptrapd.init.2"
_Isendmail="${_gentoo_uri}/mail-mta/sendmail/files/sendmail"
_Iulogd="${_gentoo_uri}/app-admin/ulogd/files/ulogd.init"
_Imonit="${_gentoo_uri}/app-admin/monit/files/monit.initd-5.0-r1"
_Itherm="${_gentoo_uri}/sys-power/thermald/files/thermald"

# install
install -Dm644 "${_Cdcron}" "${DESTDIR}/etc/conf.d/dcron"
install -Dm755 "${_Idcron}" "${DESTDIR}/etc/init.d/dcron"
install -Dm644 "${_Csysklogd}" "${DESTDIR}/etc/conf.d/sysklogd"
install -Dm755 "${_Isysklogd}" "${DESTDIR}/etc/init.d/sysklogd"
install -Dm644 "${_Csnmp}" "${DESTDIR}/etc/conf.d/snmpd"
install -Dm755 "${_Isnmp}" "${DESTDIR}/etc/init.d/snmpd"
install -Dm644 "${_Csnmptrap}" "${DESTDIR}/etc/conf.d/snmptrapd"
install -Dm755 "${_Isnmptrap}" "${DESTDIR}/etc/init.d/snmptrapd"
install -Dm755 "${_Isendmail}" "${DESTDIR}/etc/init.d/sendmail"
install -Dm644 "misc/conf.d/sendmail.confd" "${DESTDIR}/etc/conf.d/sendmail"
install -Dm755 "${_Iulogd}" "${DESTDIR}/etc/init.d/ulogd"
install -Dm755 "${_Imonit}" "${DESTDIR}/etc/init.d/monit"
install -Dm755 "${_Itherm}" "${DESTDIR}/etc/init.d/thermald"
install -Dm755 "misc/init.d/php-fpm-r4.init" "${DESTDIR}/etc/init.d/php-fpm"
install -Dm644 "misc/conf.d/fail2ban.confd" "${DESTDIR}/etc/conf.d/fail2ban"
install -Dm755 "misc/init.d/fail2ban.initd" "${DESTDIR}/etc/init.d/fail2ban"
