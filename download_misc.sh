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

source_initd=("https://github.com/dywisor/tlp-portage/raw/maint/app-laptop/tlp/files/tlp-init.openrc-r2" "https://cgit.gentoo.org/user/lmiphay.git/plain/dev-db/influxdb/files/influxdb.init.d")

source_confd=("https://cgit.gentoo.org/user/lmiphay.git/plain/dev-db/influxdb/files/influxdb.conf.d")

# Download to misc folder
cd misc
for src in "${source[@]}"; do
	wget -Nc "$src"
done

cd init.d
for src in "${source_initd[@]}"; do
	wget -Nc "$src"
done

cd ../conf.d
for src in "${source_confd[@]}"; do
	wget -Nc "$src"
done

# Extra
source_devdb=("https://raw.githubusercontent.com/gentoo/gentoo/eca95e70409810b07a07795df3e4a020118479ac/dev-db/redis/files/redis.initd"
	"https://raw.githubusercontent.com/gentoo/gentoo/eca95e70409810b07a07795df3e4a020118479ac/dev-db/redis/files/redis.confd"
	"https://raw.githubusercontent.com/gentoo/gentoo/master/sys-power/thermald/files/thermald")

source_appadmin=("https://raw.githubusercontent.com/gentoo/gentoo/eca95e70409810b07a07795df3e4a020118479ac/app-admin/monit/files/monit.initd-5.0-r1")
