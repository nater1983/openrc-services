#!/bin/sh
# fix_path.sh: fixes path in runscript and location of /var/run

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-/etc}

_shebang='s|#!/sbin/runscript|#!/sbin/openrc-run|'
_runpath='s|/var/run|/run|g'
_sysconfdir="s|etc/conf.d|etc/${SYSCONFDIR}|g"
_sysinitdir="s|etc/init.d|etc/${SYSCONFDIR}|g"

for file in ${DESTDIR}/${SYSCONFDIR}/init.d/*; do
  sed -e "${_shebang}" -e "${_runpath}" -e "${_sysconfdir}" -e "${_sysinitdir}" -i "$file"
done

for file in ${DESTDIR}/${SYSCONFDIR}/conf.d/*; do
  sed -e "${_runpath}" -e "${_sysconfdir}" -e "${_sysinitdir}" -i "$file"
done
