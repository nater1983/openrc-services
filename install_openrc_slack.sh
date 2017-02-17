#!/bin/sh
# install_openrc_slack.sh

DESTDIR=$1
DOWNLOAD_DIR=packages-openrc-master

_local_uri="${DOWNLOAD_DIR}/openrc-base"

_gentoo_uri="gentoo"

# files
_Cdcron=sys-process/dcron/files/dcron.confd-4.4
_Idcron=sys-process/dcron/files/dcron.init-4.5
_Csysklogd=app-admin/sysklogd/files/sysklogd.confd
_Isysklogd=app-admin/sysklogd/files/sysklogd.rc7
_Csnmp=net-analyzer/net-snmp/files/snmpd.conf
_Isnmp=net-analyzer/net-snmp/files/snmpd.init.2
_Csnmptrap=net-analyzer/net-snmp/files/snmptrapd.conf
_Isnmptrap=net-analyzer/net-snmp/files/snmptrapd.init.2
_Isendmail=mail-mta/sendmail/files/sendmail
_Iulogd=app-admin/ulogd/files/ulogd.init
_IPhpF="misc/init.d/php-fpm-r4.init"
_CRedS="dev-db/redis/files/redis.confd"
_IRedS="dev-db/redis/files/redis.initd"
_Imonit="app-admin/monit/files/monit.initd-5.0-r1"
_Cf2b="conf.d/fail2ban.confd"
_If2b="init.d/fail2ban.initd"

# install
install -Dm644 "${_gentoo_uri}/${_Cdcron}" "${DESTDIR}/etc/conf.d/dcron"
install -Dm755 "${_gentoo_uri}/${_Idcron}" "${DESTDIR}/etc/init.d/dcron"
install -Dm644 "${_gentoo_uri}/${_Csysklogd}" "${DESTDIR}/etc/conf.d/sysklogd"
install -Dm755 "${_gentoo_uri}/${_Isysklogd}" "${DESTDIR}/etc/init.d/sysklogd"
install -Dm644 "${_gentoo_uri}/${_Csnmp}" "${DESTDIR}/etc/conf.d/snmpd"
install -Dm755 "${_gentoo_uri}/${_Isnmp}" "${DESTDIR}/etc/init.d/snmpd"
install -Dm644 "${_gentoo_uri}/${_Csnmptrap}" "${DESTDIR}/etc/conf.d/snmptrapd"
install -Dm755 "${_gentoo_uri}/${_Isnmptrap}" "${DESTDIR}/etc/init.d/snmptrapd"
install -Dm755 "${_gentoo_uri}/${_Isendmail}" "${DESTDIR}/etc/init.d/sendmail"
install -Dm644 misc/conf.d/sendmail.confd "${DESTDIR}/etc/conf.d/sendmail"
install -Dm755 "${_gentoo_uri}/${_Iulogd}" "${DESTDIR}/etc/init.d/ulogd"
install -Dm755 "${_IPhpF}" "${DESTDIR}/etc/init.d/php-fpm"
install -Dm644 "${_gentoo_uri}/${_CRedS}" "${DESTDIR}/etc/conf.d/redis"
install -Dm755 "${_gentoo_uri}/${_IRedS}" "${DESTDIR}/etc/init.d/redis"
install -Dm755 "${_gentoo_uri}/${_Imonit}" "${DESTDIR}/etc/init.d/monit"
install -Dm644 "misc/${_Cf2b}" "${DESTDIR}/etc/conf.d/fail2ban"
install -Dm755 "misc/${_If2b}" "${DESTDIR}/etc/init.d/fail2ban"
