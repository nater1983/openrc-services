#!/bin/sh
# fix_path.sh: fixes path in runscript and location of /var/run

DESTDIR=$1

_shebang='s|#!/sbin/runscript|#!/sbin/openrc-run|'
_runpath='s|/var/run|/run|g'

for file in ${DESTDIR}/etc/init.d/*; do
  sed -e "${_shebang}" -e "${_runpath}" -i "$file"
done

for file in ${DESTDIR}/etc/conf.d/*; do
  sed -e "${_runpath}" -i "$file"
done
