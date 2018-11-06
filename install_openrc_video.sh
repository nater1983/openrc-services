#!/bin/sh
# install_openrc_video.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

_gentoo_uri="gentoo"

# arch detection for /lib
LIBDIRSUFFIX=""
if [ "$(uname -m)" = "x86_64" ]; then
  LIBDIRSUFFIX="64"
fi

# files
_Cbumb=${_gentoo_uri}/x11-misc/bumblebee/files/bumblebee.confd
_Ibumb=${_gentoo_uri}/x11-misc/bumblebee/files/bumblebee.initd
_Inv=${_gentoo_uri}/x11-drivers/nvidia-drivers/files/nvidia-smi.init
_Cnvp=${_gentoo_uri}/x11-drivers/nvidia-drivers/files/nvidia-persistenced.conf
_Invp=${_gentoo_uri}/x11-drivers/nvidia-drivers/files/nvidia-persistenced.init
_Cvgl=${_gentoo_uri}/x11-misc/virtualgl/files/vgl.confd-r2
_Ivgl=${_gentoo_uri}/x11-misc/virtualgl/files/vgl.initd-r3
_Svgl=${_gentoo_uri}/x11-misc/virtualgl/files/vgl-helper.sh

# install
install -Dm755 "${_Inv}" "${DESTDIR}/${SYSCONFDIR}/init.d/nvidia-smi"
install -Dm644 "${_Cnvp}" "${DESTDIR}/${SYSCONFDIR}/conf.d/nvidia-persistenced"
install -Dm755 "${_Invp}" "${DESTDIR}/${SYSCONFDIR}/init.d/nvidia-persistenced"
install -Dm644 "${_Cvgl}" "${DESTDIR}/${SYSCONFDIR}/conf.d/vgl"
install -Dm755 "${_Ivgl}" "${DESTDIR}/${SYSCONFDIR}/init.d/vgl"
install -Dm755 "${_Svgl}" "${DESTDIR}/usr/lib${LIBDIRSUFFIX}/vgl-helper.sh"
install -dm750 "${DESTDIR}/var/lib/VirtualGL"
install -Dm644 "${_Cbumb}" "${DESTDIR}/${SYSCONFDIR}/conf.d/bumblebee"
install -Dm755 "${_Ibumb}" "${DESTDIR}/${SYSCONFDIR}/init.d/bumblebee"
