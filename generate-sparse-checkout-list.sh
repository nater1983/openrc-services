#!/bin/bash
# generate-spare-checkout-list.sh

# Copyright (C) 2018 Aaditya Bagga <aaditya_gnulinux@zoho.com>
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

# get source list
SOURCE_DIR=$(cd `dirname $0` && pwd)
. ${SOURCE_DIR}/source_list.sh || exit 1

# Searching in the indices of CATEGORIES
for i in ${!CATEGORIES[*]}; do
	# Now we get the actual category
	k=${CATEGORIES[$i]}
	# Now we need to evaluate the array pointed by CATEGORY index
	eval "j=\${$i[*]}"
	for l in $j; do
		# add to file list
		echo "/$k/$l/files"
	done
done

exit $?
