#!/bin/bash
# download.sh: downloads openrc scripts from gentoo sources

# for safety and robustness
set -e

# get source list
. "$(pwd)/source_list.sh"

REMOTE_REPO="gentoo"
REMOTE_REPO_URL="rsync://rsync.de.gentoo.org/gentoo-portage"

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
	folder_to_sync="$cat/$package/files"
	mkdir -p "$REMOTE_REPO/$folder_to_sync"
	rsync -av "$REMOTE_REPO_URL/$folder_to_sync/*" "$REMOTE_REPO/$folder_to_sync/"
	# Exit with status
	exit $?
fi

log="logs/download.log"
# Check for log directory
[ ! -d logs ] && mkdir logs
# Initialize log with date
date +"%F_%T" >> $log

# Checkout the source and write to log
[ -f "rsync-include-list" ] && rm "rsync-include-list"
./generate-rsync-include-list.sh >> "rsync-include-list"
mkdir -p "$REMOTE_REPO"
rsync -av --exclude '*.patch' --prune-empty-dirs --include-from "rsync-include-list" --exclude '*' "$REMOTE_REPO_URL/*" "$REMOTE_REPO/" 2>&1 | tee -a "$log"

exit $?
