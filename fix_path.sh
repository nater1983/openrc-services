#!/bin/sh
# fix_path.sh: fixes path in runscript and location of /var/run

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

_shebang='s|#!/sbin/runscript|#!/sbin/openrc-run|'
_runpath='s|/var/run|/run|g'
_rundir1="s|@rundir@|/run|g"
_rundir2="s|@RUNDIR@|/run|g"
if [ "$(uname -m)" = x86_64 ] || [ "$(uname -m)" = aarch64 ]; then
  _libdir1="s|@libdir@|lib64|g"
  _libdir2="s|@LIBDIR@|lib64|g"
else
  _libdir1="s|@libdir@|lib|g"
  _libdir2="s|@LIBDIR@|lib|g"
fi
_sysconfdir="s|etc/conf.d|${SYSCONFDIR}/conf.d|g"
_sysinitdir="s|etc/init.d|${SYSCONFDIR}/init.d|g"

for file in ${DESTDIR}/${SYSCONFDIR}/init.d/*; do
  sed -e "${_shebang}" -e "${_runpath}" -e "${_rundir1}" -e "${_rundir2}" -e "${_libdir1}" -e "${_libdir2}" -e "${_sysconfdir}" -e "${_sysinitdir}" -i "$file"
done

for file in ${DESTDIR}/${SYSCONFDIR}/conf.d/*; do
  sed -e "${_runpath}" -e "${_rundir1}" -e "${_rundir2}" -e "${_libdir1}" -e "${_libdir2}" -e "${_sysconfdir}" -e "${_sysinitdir}" -i "$file"
done
