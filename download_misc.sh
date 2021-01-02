#!/bin/bash
# download_misc.sh

_dev_uri1="https://dev.gentoo.org/~williamh/dist"
_dev_uri2="https://dev.gentoo.org/~polynomial-c/dist/apache"
_dev_uri3="https://dev.gentoo.org/~andrey_utkin/distfiles"

_udev="udev-init-scripts"
_uver=32

_apache=gentoo-apache
_apver=2.4.34
_aprel=20180716

source_archive=(
	"${_dev_uri1}/udev-init-scripts-32.tar.gz"
	"${_dev_uri2}/gentoo-apache-2.4.34-20180716.tar.bz2"
	"${_dev_uri3}/net-wireless_hostapd_2.7-r2_extras.tar.xz"
	"${_dev_uri3}/sys-power_acpid_2.0.32-r2_extras.tar.xz"
)

source_initd=(
	"https://github.com/dywisor/tlp-portage/raw/maint/app-laptop/tlp/files/tlp-init.openrc-r3"
	"https://github.com/moby/moby/raw/master/contrib/init/openrc/docker.initd"
)

source_confd=(
	"https://github.com/moby/moby/raw/master/contrib/init/openrc/docker.confd"
)

# Download to misc folder
cd misc
for src in "${source_archive[@]}"; do
	wget -c "$src"
done

cd init.d
for src in "${source_initd[@]}"; do
	wget -c "$src"
done

cd ../conf.d
for src in "${source_confd[@]}"; do
	wget -c "$src"
done
cd ..

# Extract to relevant place
for src in "${source_archive[@]}"; do
	tar xf "$(basename $src)"
done
cd ..

