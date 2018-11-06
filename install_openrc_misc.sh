#!/bin/sh
# install_openrc_misc.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

_gentoo_uri="gentoo"

# files
_Iacron=${_gentoo_uri}/sys-process/anacron/files/anacron.rc6
_Ifrcon=${_gentoo_uri}/sys-process/fcron/files/fcron.init.4
_Crsysl=${_gentoo_uri}/app-admin/rsyslog/files/rsyslog.confd-r1
_Irsysl=${_gentoo_uri}/app-admin/rsyslog/files/rsyslog.initd-r1
_Csane=${_gentoo_uri}/media-gfx/sane-backends/files/saned.confd
_Isane=${_gentoo_uri}/media-gfx/sane-backends/files/saned.initd
_Ifuse=${_gentoo_uri}/sys-fs/fuse/files/fuse.init
_Cmeta=${_gentoo_uri}/app-admin/metalog/files/metalog.confd
_Imeta=${_gentoo_uri}/app-admin/metalog/files/metalog.initd
_Csyslog=${_gentoo_uri}/app-admin/syslog-ng/files/3.7/syslog-ng.confd
_Isyslog=${_gentoo_uri}/app-admin/syslog-ng/files/3.7/syslog-ng.rc6
_Clirc1=${_gentoo_uri}/app-misc/lirc/files/lircd.conf.4
_Clirc2=${_gentoo_uri}/app-misc/lirc/files/irexec-confd
_Ilirc1=${_gentoo_uri}/app-misc/lirc/files/lircd-0.8.6-r2
_Ilirc2=${_gentoo_uri}/app-misc/lirc/files/irexec-initd-0.8.6-r2
_Ilirc3=${_gentoo_uri}/app-misc/lirc/files/lircmd
_Csens=${_gentoo_uri}/sys-apps/lm_sensors/files/sensord.confd
_Csens1=${_gentoo_uri}/sys-apps/lm_sensors/files/fancontrol.confd
_Csens2=${_gentoo_uri}/sys-apps/lm_sensors/files/lm_sensors.confd
_Isens1=${_gentoo_uri}/sys-apps/lm_sensors/files/sensord.initd
_Isens2=${_gentoo_uri}/sys-apps/lm_sensors/files/fancontrol.initd
_Isens3=${_gentoo_uri}/sys-apps/lm_sensors/files/lm_sensors.initd
_Ccpu=${_gentoo_uri}/sys-power/cpupower/files/conf.d-r2
_Icpu=${_gentoo_uri}/sys-power/cpupower/files/init.d-r4
_Cntp1=${_gentoo_uri}/net-misc/ntp/files/ntpd.confd
_Cntp2=${_gentoo_uri}/net-misc/ntp/files/ntp-client.confd
_Cntp3=${_gentoo_uri}/net-misc/ntp/files/sntp.confd
_Intp1=${_gentoo_uri}/net-misc/ntp/files/ntpd.rc-r1
_Intp2=${_gentoo_uri}/net-misc/ntp/files/ntp-client.rc
_Intp3=${_gentoo_uri}/net-misc/ntp/files/sntp.rc
_Icups=${_gentoo_uri}/net-print/cups/files/cupsd.init.d-r3
_Ccon=${_gentoo_uri}/net-misc/connman/files/connman.confd
_Icon=${_gentoo_uri}/net-misc/connman/files/connman.initd2
_Chaveg=${_gentoo_uri}/sys-apps/haveged/files/haveged-conf.d
_Ihaveg=${_gentoo_uri}/sys-apps/haveged/files/haveged-init.d.3
_Csalt_mtr=${_gentoo_uri}/app-admin/salt/files/master-confd-1
_Isalt_mtr=${_gentoo_uri}/app-admin/salt/files/master-initd-4
_Csalt_min=${_gentoo_uri}/app-admin/salt/files/minion-confd-1
_Isalt_min=${_gentoo_uri}/app-admin/salt/files/minion-initd-4
_Csalt_sync=${_gentoo_uri}/app-admin/salt/files/syndic-confd-1
_Isalt_sync=${_gentoo_uri}/app-admin/salt/files/syndic-initd-4
_Impd=${_gentoo_uri}/media-sound/mpd/files/mpd-0.20.4.init
_Chdparm=${_gentoo_uri}/sys-apps/hdparm/files/hdparm-conf.d.3
_Ihdparm=${_gentoo_uri}/sys-apps/hdparm/files/hdparm-init-8
_Cbit=${_gentoo_uri}/net-im/bitlbee/files/bitlbee.confd-r1
_Ibit=${_gentoo_uri}/net-im/bitlbee/files/bitlbee.initd-r1
_Itherm=${_gentoo_uri}/sys-power/thermald/files/thermald
_Ixe=${_gentoo_uri}/app-emulation/xe-guest-utilities/files/xe-daemon.initd
_Ivbox=${_gentoo_uri}/app-emulation/virtualbox-guest-additions/files/virtualbox-guest-additions-8.initd
_CClam=${_gentoo_uri}/app-antivirus/clamav/files/clamd.conf-r1
_IClam=${_gentoo_uri}/app-antivirus/clamav/files/clamd.initd-r6
_CBoinc=${_gentoo_uri}/sci-misc/boinc/files/boinc.conf
_IBoinc=${_gentoo_uri}/sci-misc/boinc/files/boinc.init.in
_CAt=${_gentoo_uri}/sys-process/at/files/atd.confd
_IAt=${_gentoo_uri}/sys-process/at/files/atd.rc8
_Clibvirt=${_gentoo_uri}/app-emulation/libvirt/files/libvirtd.confd-r5
_Ilibvirt=${_gentoo_uri}/app-emulation/libvirt/files/libvirtd.init-r16
_Ivirtlock=${_gentoo_uri}/app-emulation/libvirt/files/virtlockd.init-r1
_Ivirtlog=${_gentoo_uri}/app-emulation/libvirt/files/virtlogd.init-r1
_CPulseAudio=${_gentoo_uri}/media-sound/pulseaudio/files/pulseaudio.conf.d
_IPulseAudio=${_gentoo_uri}/media-sound/pulseaudio/files/pulseaudio.init.d-5

# install
install -Dm755 "${_Iacron}" "${DESTDIR}/${SYSCONFDIR}/init.d/anacron"
install -Dm755 "${_Ifrcon}" "${DESTDIR}/${SYSCONFDIR}/init.d/fcron"
install -Dm644 "${_Cbit}" "${DESTDIR}/${SYSCONFDIR}/conf.d/bitlbee"
install -Dm755 "${_Ibit}" "${DESTDIR}/${SYSCONFDIR}/init.d/bitlbee"
install -Dm644 "${_Ccpu}" "${DESTDIR}/${SYSCONFDIR}/conf.d/cpupower"
install -Dm755 "${_Icpu}" "${DESTDIR}/${SYSCONFDIR}/init.d/cpupower"
install -Dm644 "${_Ccon}" "${DESTDIR}/${SYSCONFDIR}/conf.d/connman"
install -Dm755 "${_Icon}" "${DESTDIR}/${SYSCONFDIR}/init.d/connman"
install -Dm755 "${_Icups}" "${DESTDIR}/${SYSCONFDIR}/init.d/cupsd"
install -Dm644 "${_Cntp1}" "${DESTDIR}/${SYSCONFDIR}/conf.d/ntpd"
install -Dm755 "${_Intp1}" "${DESTDIR}/${SYSCONFDIR}/init.d/ntpd"
install -Dm644 "${_Cntp2}" "${DESTDIR}/${SYSCONFDIR}/conf.d/ntp-client"
install -Dm755 "${_Intp2}" "${DESTDIR}/${SYSCONFDIR}/init.d/ntp-client"
install -Dm644 "${_Cntp3}" "${DESTDIR}/${SYSCONFDIR}/conf.d/sntp"
install -Dm755 "${_Intp3}" "${DESTDIR}/${SYSCONFDIR}/init.d/sntp"
install -Dm644 "${_Crsysl}" "${DESTDIR}/${SYSCONFDIR}/conf.d/rsyslog"
install -Dm755 "${_Irsysl}" "${DESTDIR}/${SYSCONFDIR}/init.d/rsyslog"
install -Dm644 "${_Csane}" "${DESTDIR}/${SYSCONFDIR}/conf.d/saned"
install -Dm755 "${_Isane}" "${DESTDIR}/${SYSCONFDIR}/init.d/saned"
install -Dm755 "${_Ifuse}" "${DESTDIR}/${SYSCONFDIR}/init.d/fuse"
install -Dm644 "${_Cmeta}" "${DESTDIR}/${SYSCONFDIR}/conf.d/metalog"
install -Dm755 "${_Imeta}" "${DESTDIR}/${SYSCONFDIR}/init.d/metalog"
install -Dm644 "${_Csyslog}" "${DESTDIR}/${SYSCONFDIR}/conf.d/syslog-ng"
install -Dm755 "${_Isyslog}" "${DESTDIR}/${SYSCONFDIR}/init.d/syslog-ng"
install -Dm644 "${_Csens}" "${DESTDIR}/${SYSCONFDIR}/conf.d/sensord"
install -Dm644 "${_Csens1}" "${DESTDIR}/${SYSCONFDIR}/conf.d/fancontrol"
install -Dm644 "${_Csens2}" "${DESTDIR}/${SYSCONFDIR}/conf.d/lm_sensors"
install -Dm755 "${_Isens1}" "${DESTDIR}/${SYSCONFDIR}/init.d/sensord"
install -Dm755 "${_Isens2}" "${DESTDIR}/${SYSCONFDIR}/init.d/fancontrol"
install -Dm755 "${_Isens3}" "${DESTDIR}/${SYSCONFDIR}/init.d/lm_sensors"
install -Dm644 "${_Clirc1}" "${DESTDIR}/${SYSCONFDIR}/conf.d/lircd"
install -Dm755 "${_Ilirc1}" "${DESTDIR}/${SYSCONFDIR}/init.d/lircd"
install -Dm644 "${_Clirc2}" "${DESTDIR}/${SYSCONFDIR}/conf.d/irexec"
install -Dm755 "${_Ilirc2}" "${DESTDIR}/${SYSCONFDIR}/init.d/irexec"
install -Dm755 "${_Ilirc3}" "${DESTDIR}/${SYSCONFDIR}/init.d/lircmd"
install -Dm644 "${_Chaveg}" "${DESTDIR}/${SYSCONFDIR}/conf.d/haveged"
install -Dm755 "${_Ihaveg}" "${DESTDIR}/${SYSCONFDIR}/init.d/haveged"
install -Dm644 "${_Csalt_mtr}" "${DESTDIR}/${SYSCONFDIR}/conf.d/salt-master"
install -Dm755 "${_Isalt_mtr}" "${DESTDIR}/${SYSCONFDIR}/init.d/salt-master"
install -Dm644 "${_Csalt_min}" "${DESTDIR}/${SYSCONFDIR}/conf.d/salt-minion"
install -Dm755 "${_Isalt_min}" "${DESTDIR}/${SYSCONFDIR}/init.d/salt-minion"
install -Dm644 "${_Csalt_sync}" "${DESTDIR}/${SYSCONFDIR}/conf.d/salt-syncdic"
install -Dm755 "${_Isalt_sync}" "${DESTDIR}/${SYSCONFDIR}/init.d/salt-syncdic"
install -Dm755 "${_Impd}" "${DESTDIR}/${SYSCONFDIR}/init.d/mpd"
install -Dm644 "${_Chdparm}" "${DESTDIR}/${SYSCONFDIR}/conf.d/hdparm"
install -Dm755 "${_Ihdparm}" "${DESTDIR}/${SYSCONFDIR}/init.d/hdparm"
install -Dm755 "${_Itherm}" "${DESTDIR}/${SYSCONFDIR}/init.d/thermald"
install -Dm755 "${_Ixe}" "${DESTDIR}/${SYSCONFDIR}/init.d/xe-daemon"
install -Dm755 "${_Ivbox}" "${DESTDIR}/${SYSCONFDIR}/init.d/vboxservice"
install -Dm644 "${_CClam}" "${DESTDIR}/${SYSCONFDIR}/conf.d/clamd"
install -Dm755 "${_IClam}" "${DESTDIR}/${SYSCONFDIR}/init.d/clamd"
install -Dm644 "${_CBoinc}" "${DESTDIR}/${SYSCONFDIR}/conf.d/boinc"
install -Dm755 "${_IBoinc}" "${DESTDIR}/${SYSCONFDIR}/init.d/boinc"
install -Dm644 "${_CAt}" "${DESTDIR}/${SYSCONFDIR}/conf.d/atd"
install -Dm755 "${_IAt}" "${DESTDIR}/${SYSCONFDIR}/init.d/atd"
install -Dm644 "${_Clibvirt}" "${DESTDIR}/${SYSCONFDIR}/conf.d/libvirtd"
install -Dm755 "${_Ilibvirt}" "${DESTDIR}/${SYSCONFDIR}/init.d/libvirtd"
install -Dm755 "${_Ivirtlock}" "${DESTDIR}/${SYSCONFDIR}/init.d/virtlockd"
install -Dm755 "${_Ivirtlog}" "${DESTDIR}/${SYSCONFDIR}/init.d/virtlogd"
install -Dm644 "${_CPulseAudio}" "${DESTDIR}/${SYSCONFDIR}/conf.d/pulseaudio"
install -Dm755 "${_IPulseAudio}" "${DESTDIR}/${SYSCONFDIR}/init.d/pulseaudio"
install -Dm755 "misc/init.d/zfs.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/zfs"
install -Dm755 "misc/init.d/netdata-openrc.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/netdata"
install -Dm644 "misc/conf.d/docker.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/docker"
install -Dm755 "misc/init.d/docker.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/docker"
