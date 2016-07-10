#!/bin/bash
# download_misc.sh

_src_uri="http://dev.gentoo.org/~williamh/dist"
_dev_uri="http://dev.gentoo.org/~polynomial-c/dist/apache"

_udev="udev-init-scripts"
_uver=30

_apver=2.4.18-r1
_aprel=20160303

source=("${_src_uri}/${_udev}-${_uver}.tar.gz"
	"${_dev_uri}/gentoo-apache-${_apver}-${_aprel}.tar.bz2")

# Download to misc folder
cd misc

for src in "${source[@]}"; do
	wget -Nc "$src"
done

cd init.d
wget -Nc https://github.com/dywisor/tlp-portage/raw/maint/app-laptop/tlp/files/tlp-init.openrc-r2
