#!/bin/sh
# install_openrc_video.sh

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

_gentoo_uri="gentoo"

# arch detection for /lib
LIBDIRSUFFIX=""
if [ "$(uname -m)" = "x86_64" ] || [ "$(uname -m)" = "aarch64" ]; then
  LIBDIRSUFFIX="64"
fi

# install
install -Dm644 "${_gentoo_uri}/x11-drivers/nvidia-drivers/files/nvidia-persistenced.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/nvidia-persistenced"
install -Dm755 "${_gentoo_uri}/x11-drivers/nvidia-drivers/files/nvidia-persistenced.initd" "${DESTDIR}/${SYSCONFDIR}/init.d/nvidia-persistenced"
install -Dm644 "${_gentoo_uri}/x11-misc/virtualgl/files/vgl.confd-r2" "${DESTDIR}/${SYSCONFDIR}/conf.d/vgl"
install -Dm755 "${_gentoo_uri}/x11-misc/virtualgl/files/vgl.initd-r4" "${DESTDIR}/${SYSCONFDIR}/init.d/vgl"
install -Dm644 "${_gentoo_uri}/x11-misc/bumblebee/files/bumblebee.confd" "${DESTDIR}/${SYSCONFDIR}/conf.d/bumblebee"
install -Dm755 "${_gentoo_uri}/x11-misc/bumblebee/files/bumblebee.initd-r1" "${DESTDIR}/${SYSCONFDIR}/init.d/bumblebee"
