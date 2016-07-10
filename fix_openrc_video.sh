#!/bin/sh
# fix_openrc_video.sh

DESTDIR=$1

# nvidia
_p1='s|/opt/bin/nvidia-smi|/usr/bin/nvidia-smi|g'
_p2='s|/opt/bin/nvidia-persistenced|/usr/bin/nvidia-persistenced|g'
sed -e "${_p1}" -i "${DESTDIR}/etc/init.d/nvidia-smi"
sed -e "${_p2}" -i "${DESTDIR}/etc/init.d/nvidia-persistenced"
