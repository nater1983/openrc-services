#!/bin/bash
# download_misc.sh

_src_uri="https://dev.gentoo.org/~williamh/dist"
_dev_uri="https://dev.gentoo.org/~polynomial-c/dist/apache"

_udev="udev-init-scripts"
_uver=32

_apache=gentoo-apache
_apver=2.4.34
_aprel=20180716

source_archive=(
	"${_src_uri}/${_udev}-${_uver}.tar.gz"
	"${_dev_uri}/gentoo-apache-${_apver}-${_aprel}.tar.bz2"
)

source_initd=(
	"https://github.com/dywisor/tlp-portage/raw/maint/app-laptop/tlp/files/tlp-init.openrc-r2",
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

# move downloaded files to common place
[ -d "misc/${_apache}-${_apver}" ] && rm -r "misc/${_apache}"
[ -d "misc/${_udev}-${_uver}" ] && rm -r "misc/${_udev}"

mv "misc/${_apache}-${_apver}" "misc/${_apache}"
mv "misc/${_udev}-${_uver}" "misc/${_udev}"
