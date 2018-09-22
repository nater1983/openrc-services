#!/bin/sh
# install_openrc_misc.sh

DESTDIR=$1

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
install -Dm755 "${_Iacron}" "${DESTDIR}/etc/init.d/anacron"
install -Dm755 "${_Ifrcon}" "${DESTDIR}/etc/init.d/fcron"
install -Dm644 "${_Cbit}" "${DESTDIR}/etc/conf.d/bitlbee"
install -Dm755 "${_Ibit}" "${DESTDIR}/etc/init.d/bitlbee"
install -Dm644 "${_Ccpu}" "${DESTDIR}/etc/conf.d/cpupower"
install -Dm755 "${_Icpu}" "${DESTDIR}/etc/init.d/cpupower"
install -Dm644 "${_Ccon}" "${DESTDIR}/etc/conf.d/connman"
install -Dm755 "${_Icon}" "${DESTDIR}/etc/init.d/connman"
install -Dm755 "${_Icups}" "${DESTDIR}/etc/init.d/cupsd"
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
install -Dm644 "${_Csens}" "${DESTDIR}/etc/conf.d/sensord"
install -Dm644 "${_Csens1}" "${DESTDIR}/etc/conf.d/fancontrol"
install -Dm644 "${_Csens2}" "${DESTDIR}/etc/conf.d/lm_sensors"
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
install -Dm755 "${_Ivirtlog}" "${DESTDIR}/etc/init.d/virtlogd"
install -Dm644 "${_CPulseAudio}" "${DESTDIR}/etc/conf.d/pulseaudio"
install -Dm755 "${_IPulseAudio}" "${DESTDIR}/etc/init.d/pulseaudio"
install -Dm755 "misc/init.d/zfs.initd" "${DESTDIR}/etc/init.d/zfs"
install -Dm755 "misc/init.d/netdata-openrc.initd" "${DESTDIR}/etc/init.d/netdata"
install -Dm644 "misc/conf.d/docker.confd" "${DESTDIR}/etc/conf.d/docker"
install -Dm755 "misc/init.d/docker.initd" "${DESTDIR}/etc/init.d/docker"
