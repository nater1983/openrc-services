#!/bin/bash
# download.sh: Downloads openrc PKGBUILDS from https://github.com/manjaro/packages-openrc
#              and fetches the source for the files.

. "$(pwd)/functions.sh"

UPSTREAM_DIR=packages-openrc-master

# Remove files previously present
rm master.zip

# Download and extract packages-openrc-master.zip
wget -c https://github.com/manjaro/packages-openrc/archive/master.zip &&
unzip -uo master.zip

# Directories to download files for
DIRS_TO_CONSIDER=(openrc-base openrc-desktop openrc-devel openrc-misc openrc-net openrc-video udev-openrc)

cd $UPSTREAM_DIR

for dir in ${DIRS_TO_CONSIDER[@]}; do
	cd $dir
	. "$(pwd)/PKGBUILD"
	download_source
	cd ..
done
