#!/bin/sh
# fix_openrc_misc.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

# bitlbee
_p1='s|need logger net|need net\n	use logger|'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/bitlbee"

# boinc
if [ "$(uname -m)" = x86_64 ] || [ "$(uname -m)" = aarch64 ]; then
  _p1='s|@libdir@|lib64|g'
else
  _p1='s|@libdir@|lib|g'
fi
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/boinc"

# cups
_p1='s|lp:lpadmin|daemon:sys|'
_p2='s|@neededservices@|need dbus|'
sed -e "${_p1}" -e "${_p2}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/cupsd"

# dcron
_p1='/ebegin "Starting \${SVCNAME}"/a \ \tmkdir -p /run/cron'
_p2='/start-stop-daemon/,+1d'
_p3='/ebegin "Stopping \${SVCNAME}"/a \\t# adapted from \/etc\/rc.d\/rc.crond\
	\/usr\/bin\/pkill --ns \$\$ --euid root -f "^\/usr\/sbin\/crond" 2> \/dev\/null'
sed -e "${_p1}" -e "${_p2}" -e "${_p3}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/dcron"

# fcron
_p1='s|/usr/libexec|/usr/sbin|g'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/fcron"

# haveged
_p1='s|/usr/sbin|/sbin|g'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/haveged"

# ntpd
_p1='s| -u ntp:ntp||'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/conf.d/ntpd"

# vboxservice
_p1='s|vboxguest-service|VBoxService|'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/vboxservice"

# libvirt
_p1='s|USE_FLAG_FIREWALLD||'
_p2='s|USE_FLAG_AVAHI||'
_p3='s|USE_FLAG_ISCSI||'
_p4='s|USE_FLAG_RBD||'
sed -e "${_p1}" -e "${_p2}" -e "${_p3}" -e "${_p4}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/libvirtd"

cat << "EOF" >> "${DESTDIR}/${SYSCONFDIR}/init.d/libvirtd"

# adapted from SBo's rc.libvirt
# https://slackbuilds.org/repository/14.2/libraries/libvirt/
check_running_machines() {

  count=0

  for machine in $(/usr/sbin/virsh list --name --state-running | grep -v ^$) ; do
    /usr/sbin/virsh shutdown $machine
  done

  einfo "Waiting for machines"

  while [ $(/usr/sbin/virsh list --name --state-running | grep -v ^$ | wc -l) -gt "0" ]; do
    if [ "$count" -ge "$TIMEOUT" ];then
      break
    fi
    echo -n "."
    count=$(expr $count + 1)
    sleep 1
  done

  echo ""

  if [ $(/usr/sbin/virsh list --name --state-running | grep -v ^$ | wc -l) -gt "0" ];then

    einfo "The following machines are still running, forcing shutdown: "
    for machine in $(/usr/sbin/virsh list --name --state-running | grep -v ^$) ; do
      /usr/sbin/virsh destroy $machine
      echo -n "$machine "
    done

    echo ""
    sleep 2
  fi

}

stop_pre() {
	check_running_machines
	for network in $(/usr/sbin/virsh net-list | tail -n +3 | awk '{print $1}'); do
		/usr/sbin/virsh net-destroy "$network"
	done
}
EOF

# saned
_p1='s|saned/saned.pid|saned.pid|g'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/saned"

# zfs
_p1='s|/usr/bin/zfs|/sbin/zfs|'
_p2='s|/usr/bin/zpool|/sbin/zpool|'
sed -e "${_p1}" -e "${_p2}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/zfs"

# ulogd
_p1='s| --uid ulogd||g'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/ulogd"
