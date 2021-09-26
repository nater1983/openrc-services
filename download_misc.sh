#!/bin/bash
# download_misc.sh

_dev_uri1="https://dev.gentoo.org/~williamh/dist"
_dev_uri2="https://dev.gentoo.org/~polynomial-c/dist/apache"
_dev_uri3="https://dev.gentoo.org/~andrey_utkin/distfiles"

source_archive=(
	"${_dev_uri1}/udev-init-scripts-32.tar.gz"
	"${_dev_uri2}/gentoo-apache-2.4.46-r6-20210212.tar.bz2"
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

source_sh=(
	"https://raw.githubusercontent.com/gentoo/gentoo-functions/master/functions.sh"
)

# Download to misc folder
mkdir -p misc
cd misc

mkdir -p download
cd download
for src in "${source_archive[@]}"; do
	wget -c "$src"
done
cd ..
# Extract to relevant place
for src in "${source_archive[@]}"; do
	tar xf "download/$(basename ${src})"
done

mkdir -p init.d
cd init.d
for src in "${source_initd[@]}"; do
	wget --backups=1 "$src"
done
cd ..

mkdir -p conf.d
cd conf.d
for src in "${source_confd[@]}"; do
	wget --backups=1 "$src"
done
cd ..

mkdir -p sh
cd sh
for src in "${source_sh[@]}"; do
	wget --backups=1 "$src"
done
cd ..
