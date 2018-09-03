#!/bin/bash
# download_misc.sh

_src_uri="http://dev.gentoo.org/~williamh/dist"
_dev_uri="http://dev.gentoo.org/~polynomial-c/dist/apache"

_udev="udev-init-scripts"
_uver=30

_apver=2.4.18-r1
_aprel=20160303

source_archive=("${_src_uri}/${_udev}-${_uver}.tar.gz"
	"${_dev_uri}/gentoo-apache-${_apver}-${_aprel}.tar.bz2")

source_initd=("https://github.com/dywisor/tlp-portage/raw/maint/app-laptop/tlp/files/tlp-init.openrc-r2")

source_confd=()

# Download to misc folder
mkdir -p misc
cd misc
for src in "${source_archive[@]}"; do
	wget -c "$src"
	tar xf "$(basename $src)"
done

mkdir -p init.d
cd init.d
for src in "${source_initd[@]}"; do
	wget -c "$src"
done

mkdir -p conf.d
cd ../conf.d
for src in "${source_confd[@]}"; do
	wget -c "$src"
done
