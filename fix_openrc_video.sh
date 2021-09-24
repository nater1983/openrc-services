#!/bin/sh
# fix_openrc_video.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

# nvidia
_p1='s|/opt/bin/nvidia-persistenced|/usr/bin/nvidia-persistenced|g'
sed -e "${_p1}" -i "${DESTDIR}/${SYSCONFDIR}/init.d/nvidia-persistenced"
