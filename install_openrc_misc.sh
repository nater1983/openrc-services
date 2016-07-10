#!/bin/sh
# install_openrc_misc.sh

DESTDIR=$1
DOWNLOAD_DIR=packages-openrc-master

_local_uri="${DOWNLOAD_DIR}/openrc-misc"

# files
_Ifrcon=${_local_uri}/fcron.init.3
_Crsysl=${_local_uri}/rsyslog.confd-r1
_Irsysl=${_local_uri}/rsyslog.initd-r1
_Csane=${_local_uri}/saned.confd
_Isane=${_local_uri}/saned.initd
_Ifuse=${_local_uri}/fuse.init
_Cmeta=${_local_uri}/metalog.confd
_Imeta=${_local_uri}/metalog.initd
_Csyslog=${_local_uri}/syslog-ng.confd
_Isyslog=${_local_uri}/syslog-ng.rc6
_Clirc1=${_local_uri}/lircd.conf.4
_Clirc2=${_local_uri}/irexec-confd
_Ilirc1=${_local_uri}/lircd-0.8.6-r2
_Ilirc2=${_local_uri}/irexec-initd-0.8.6-r2
_Ilirc3=${_local_uri}/lircmd
_Isens1=${_local_uri}/sensord-4-init.d
_Isens2=${_local_uri}/fancontrol-init.d-2
_Isens3=${_local_uri}/lm_sensors-3-init.d
_Ccpu=${_local_uri}/conf.d-r2
_Icpu=${_local_uri}/init.d-r4
_Cntp1=${_local_uri}/ntpd.confd
_Cntp2=${_local_uri}/ntp-client.confd
_Cntp3=${_local_uri}/sntp.confd
_Intp1=${_local_uri}/ntpd.rc-r1
_Intp2=${_local_uri}/ntp-client.rc
_Intp3=${_local_uri}/sntp.rc
_Icups=${_local_uri}/cupsd.init.d-r2
_Ccon=${_local_uri}/connman.confd
_Icon=${_local_uri}/connman.initd2
_Chaveg=${_local_uri}/haveged-conf.d
_Ihaveg=${_local_uri}/haveged-init.d.3
_Csalt_mtr=${_local_uri}/master-confd-1
_Isalt_mtr=${_local_uri}/master-initd-4
_Csalt_min=${_local_uri}/minion-confd-1
_Isalt_min=${_local_uri}/minion-initd-4
_Csalt_sync=${_local_uri}/syndic-confd-1
_Isalt_sync=${_local_uri}/syndic-initd-4
_Impd=${_local_uri}/mpd2.init
_Chdparm=${_local_uri}/hdparm-conf.d.3
_Ihdparm=${_local_uri}/hdparm-init-8
_Cbit=${_local_uri}/bitlbee.confd-r1
_Ibit=${_local_uri}/bitlbee.initd-r1
_Itherm=${_local_uri}/thermald.initd
_Ixe=${_local_uri}/xe-daemon.initd
_Ivbox=${_local_uri}/virtualbox-guest-additions-8.initd
_CClam=${_local_uri}/clamd.conf-r1
_IClam=${_local_uri}/clamd.initd-r6
_CBoinc=${_local_uri}/boinc.conf
_IBoinc=${_local_uri}/boinc.init
_CAt=${_local_uri}/atd.confd
_IAt=${_local_uri}/atd.rc8
_Clibvirt=${_local_uri}/libvirtd.confd-r5
_Ilibvirt=${_local_uri}/libvirtd.init-r16
_Ivirtlock=${_local_uri}/virtlockd.init-r1

# install
install -Dm644 "${_Cbit}" "${DESTDIR}/etc/conf.d/bitlbee"
install -Dm755 "${_Ibit}" "${DESTDIR}/etc/init.d/bitlbee"
install -Dm644 "${_Ccpu}" "${DESTDIR}/etc/conf.d/cpupower"
install -Dm755 "${_Icpu}" "${DESTDIR}/etc/init.d/cpupower"
install -Dm644 "${_Ccon}" "${DESTDIR}/etc/conf.d/connman"
install -Dm755 "${_Icon}" "${DESTDIR}/etc/init.d/connman"
install -Dm755 "${_Icups}" "${DESTDIR}/etc/init.d/cupsd"
install -Dm755 "${_Ifrcon}" "${DESTDIR}/etc/init.d/fcron"
install -Dm644 "${_Cntp1}" "${DESTDIR}/etc/conf.d/ntpd"
install -Dm755 "${_Intp1}" "${DESTDIR}/etc/init.d/ntpd"
install -Dm644 "${_Cntp2}" "${DESTDIR}/etc/conf.d/ntp-client"
install -Dm755 "${_Intp2}" "${DESTDIR}/etc/init.d/ntp-client"
install -Dm644 "${_Cntp3}" "${DESTDIR}/etc/conf.d/sntp"
install -Dm755 "${_Intp3}" "${DESTDIR}/etc/init.d/sntp"
install -Dm644 "${_Crsysl}" "${DESTDIR}/etc/conf.d/rsyslog"
install -Dm755 "${_Irsysl}" "${DESTDIR}/etc/init.d/rsyslog"
install -Dm644 "${_Csane}" "${DESTDIR}/etc/conf.d/saned"
install -Dm755 "${_Isane}" "${DESTDIR}/etc/init.d/saned"
install -Dm755 "${_Ifuse}" "${DESTDIR}/etc/init.d/fuse"
install -Dm644 "${_Cmeta}" "${DESTDIR}/etc/conf.d/metalog"
install -Dm755 "${_Imeta}" "${DESTDIR}/etc/init.d/metalog"
install -Dm644 "${_Csyslog}" "${DESTDIR}/etc/conf.d/syslog-ng"
install -Dm755 "${_Isyslog}" "${DESTDIR}/etc/init.d/syslog-ng"
install -Dm755 "${_Isens1}" "${DESTDIR}/etc/init.d/sensord"
install -Dm755 "${_Isens2}" "${DESTDIR}/etc/init.d/fancontrol"
install -Dm755 "${_Isens3}" "${DESTDIR}/etc/init.d/lm_sensors"
install -Dm644 "${_Clirc1}" "${DESTDIR}/etc/conf.d/lircd"
install -Dm755 "${_Ilirc1}" "${DESTDIR}/etc/init.d/lircd"
install -Dm644 "${_Clirc2}" "${DESTDIR}/etc/conf.d/irexec"
install -Dm755 "${_Ilirc2}" "${DESTDIR}/etc/init.d/irexec"
install -Dm755 "${_Ilirc3}" "${DESTDIR}/etc/init.d/lircmd"
install -Dm644 "${_Chaveg}" "${DESTDIR}/etc/conf.d/haveged"
install -Dm755 "${_Ihaveg}" "${DESTDIR}/etc/init.d/haveged"
install -Dm644 "${_Csalt_mtr}" "${DESTDIR}/etc/conf.d/salt-master"
install -Dm755 "${_Isalt_mtr}" "${DESTDIR}/etc/init.d/salt-master"
install -Dm644 "${_Csalt_min}" "${DESTDIR}/etc/conf.d/salt-minion"
install -Dm755 "${_Isalt_min}" "${DESTDIR}/etc/init.d/salt-minion"
install -Dm644 "${_Csalt_sync}" "${DESTDIR}/etc/conf.d/salt-syncdic"
install -Dm755 "${_Isalt_sync}" "${DESTDIR}/etc/init.d/salt-syncdic"
install -Dm755 "${_Impd}" "${DESTDIR}/etc/init.d/mpd"
install -Dm644 "${_Chdparm}" "${DESTDIR}/etc/conf.d/hdparm"
install -Dm755 "${_Ihdparm}" "${DESTDIR}/etc/init.d/hdparm"
install -Dm755 "${_Itherm}" "${DESTDIR}/etc/init.d/thermald"
install -Dm755 "${_Ixe}" "${DESTDIR}/etc/init.d/xe-daemon"
install -Dm755 "${_Ivbox}" "${DESTDIR}/etc/init.d/vboxservice"
install -Dm644 "${_CClam}" "${DESTDIR}/etc/conf.d/clamd"
install -Dm755 "${_IClam}" "${DESTDIR}/etc/init.d/clamd"
install -Dm644 "${_CBoinc}" "${DESTDIR}/etc/conf.d/boinc"
install -Dm755 "${_IBoinc}" "${DESTDIR}/etc/init.d/boinc"
install -Dm644 "${_CAt}" "${DESTDIR}/etc/conf.d/atd"
install -Dm755 "${_IAt}" "${DESTDIR}/etc/init.d/atd"
install -Dm644 "${_Clibvirt}" "${DESTDIR}/etc/conf.d/libvirtd"
install -Dm755 "${_Ilibvirt}" "${DESTDIR}/etc/init.d/libvirtd"
install -Dm755 "${_Ivirtlock}" "${DESTDIR}/etc/init.d/virtlockd"
install -Dm755 "misc/init.d/zfs.initd" "${DESTDIR}/etc/init.d/zfs"
install -Dm755 "misc/init.d/anacron.rc6" "${DESTDIR}/etc/init.d/anacron"
install -Dm644 "misc/conf.d/sensord-conf.d" "${DESTDIR}/etc/conf.d/sensord"
install -Dm644 "misc/conf.d/pulseaudio.conf.d" "${DESTDIR}/etc/conf.d/pulseaudio"
install -Dm755 "misc/init.d/pulseaudio.init.d-5" "${DESTDIR}/etc/init.d/pulseaudio"
