#!/bin/sh
# install_openrc_slack.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

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
install -Dm644 "${_Cdcron}" "${DESTDIR}/${SYSCONFDIR}/conf.d/dcron"
install -Dm755 "${_Idcron}" "${DESTDIR}/${SYSCONFDIR}/init.d/dcron"
install -Dm644 "${_Csysklogd}" "${DESTDIR}/${SYSCONFDIR}/conf.d/sysklogd"
install -Dm755 "${_Isysklogd}" "${DESTDIR}/${SYSCONFDIR}/init.d/sysklogd"
install -Dm644 "${_Csnmp}" "${DESTDIR}/${SYSCONFDIR}/conf.d/snmpd"
install -Dm755 "${_Isnmp}" "${DESTDIR}/${SYSCONFDIR}/init.d/snmpd"
install -Dm644 "${_Csnmptrap}" "${DESTDIR}/${SYSCONFDIR}/conf.d/snmptrapd"
install -Dm755 "${_Isnmptrap}" "${DESTDIR}/${SYSCONFDIR}/init.d/snmptrapd"
install -Dm755 "${_Isendmail}" "${DESTDIR}/${SYSCONFDIR}/init.d/sendmail"
install -Dm644 "misc/conf.d/sendmail.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/sendmail"
install -Dm755 "${_Iulogd}" "${DESTDIR}/${SYSCONFDIR}/init.d/ulogd"
install -Dm755 "${_Imonit}" "${DESTDIR}/${SYSCONFDIR}/init.d/monit"
install -Dm755 "${_Itherm}" "${DESTDIR}/${SYSCONFDIR}/init.d/thermald"
install -Dm755 "misc/init.d/php-fpm-r4.init" "${DESTDIR}/${SYSCONFDIR}/init.d/php-fpm"
install -Dm644 "misc/conf.d/fail2ban.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/fail2ban"
install -Dm755 "misc/init.d/fail2ban.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/fail2ban"
install -Dm755 "misc/init.d/rc.firewall" "${DESTDIR}/${SYSCONFDIR}/init.d/rc.firewall"
