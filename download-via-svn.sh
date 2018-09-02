#!/bin/bash
# download.sh: downloads openrc scripts from gentoo sources

# Copyright (C) 2015-2018 Aaditya Bagga <aaditya_gnulinux@zoho.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed WITHOUT ANY WARRANTY;
# without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
##

# for safety and robustness
set -e

# get source list
. "$(pwd)/source_list.sh"

REMOTE_REPO="gentoo"
REMOTE_REPO_URL="https://github.com/gentoo/gentoo"

# Test
if [ "$1" = -t ]; then
	# Searching in the indices of CATEGORIES
	for i in ${!CATEGORIES[*]}; do
		# Now we get the actual category
		k=${CATEGORIES[$i]}
		# Now we need to evaluate the array pointed by CATEGORY index
		eval "j=\${$i[*]}"
		# Print programs in each category
		for l in $j; do
			echo "$k: $l"
		done
	done
	exit 0
elif [ "$1" = -p ]; then
	# Second argument is the package category
	cat="$2"
	# Third argument is the package name
	package="$3"
	# Checkout the source
	svn export --force "$REMOTE_REPO_URL/trunk/$cat/$package/files" "$REMOTE_REPO/$cat/$package/files"
	# Exit with status
	exit $?
fi

log="logs/download.log"
# Check for log directory
[ ! -d logs ] && mkdir logs
# Initialize log with date
date +"%F_%T" >> $log

# Searching in the indices of CATEGORIES
for i in ${!CATEGORIES[*]}; do
	# Now we get the actual category
	k=${CATEGORIES[$i]}
	# Now we need to evaluate the array pointed by CATEGORY index
	eval "j=\${$i[*]}"
	for l in $j; do
		# Checkout the source and write to log
		svn export --force "$REMOTE_REPO_URL/trunk/$k/$l/files" "$REMOTE_REPO/$k/$l/files" 2>&1 | tee -a "$log"
	done
done

# Some special downloads
SPECIAL_DOWNLOAD_FOLDERS=('app-admin/syslog-ng/files/3.7' 'sys-devel/distcc/files/3.2' 'net-fs/samba/files/4.2')

for folder in "${SPECIAL_DOWNLOAD_FOLDERS[@]}"; do
	svn export --force "$REMOTE_REPO_URL/trunk/$folder" "$REMOTE_REPO/$folder" 2>&1 | tee -a "$log"
done

exit $?
