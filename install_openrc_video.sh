#!/bin/sh
# install_openrc_video.sh

DESTDIR=$1
DOWNLOAD_DIR=packages-openrc-master

_local_uri="${DOWNLOAD_DIR}/openrc-video"
_gentoo_uri="gentoo"

# arch detection for /lib
if [ -z "$ARCH" ]; then
  case "$( uname -m )" in
    i?86) ARCH=i486 ;;
    arm*) ARCH=arm ;;
       *) ARCH=$( uname -m ) ;;
  esac
fi

LIBDIRSUFFIX=""
if [ "$ARCH" = "x86_64" ]; then
  LIBDIRSUFFIX="64"
fi

# files
_Cbumb=${_gentoo_uri}/x11-misc/bumblebee/files/bumblebee.confd
_Ibumb=${_gentoo_uri}/x11-misc/bumblebee/files/bumblebee.initd
_Inv=${_local_uri}/nvidia-smi.init
_Cnvp=${_gentoo_uri}/x11-drivers/nvidia-drivers/files/nvidia-persistenced.conf
_Invp=${_gentoo_uri}/x11-drivers/nvidia-drivers/files/nvidia-persistenced.init
_Iati=${_local_uri}/atieventsd.init
_Cvgl=${_local_uri}/vgl.confd-r2
_Ivgl=${_local_uri}/vgl.initd-r3
_Svgl=${_local_uri}/vgl-helper.sh

# install
install -Dm755 "${_Inv}" "${DESTDIR}"/etc/init.d/nvidia-smi
install -Dm644 "${_Cnvp}" "${DESTDIR}"/etc/conf.d/nvidia-persistenced
install -Dm755 "${_Invp}" "${DESTDIR}"/etc/init.d/nvidia-persistenced
install -Dm755 "${_Iati}" "${DESTDIR}"/etc/init.d/atieventsd
echo 'ATIEVENTSDOPTS=""' > "${DESTDIR}"/etc/conf.d/atieventsd
install -Dm644 "${_Cvgl}" "${DESTDIR}"/etc/conf.d/vgl
install -Dm755 "${_Ivgl}" "${DESTDIR}"/etc/init.d/vgl
install -Dm755 "${_Svgl}" "${DESTDIR}"/usr/lib${LIBDIRSUFFIX}/${_Svgl}
install -d "${DESTDIR}"/var/lib/VirtualGL
install -Dm644 "${_Cbumb}" "${DESTDIR}"/etc/conf.d/bumblebee
install -Dm755 "${_Ibumb}" "${DESTDIR}"/etc/init.d/bumblebee
