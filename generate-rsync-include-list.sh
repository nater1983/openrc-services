#!/bin/bash
# generate-rsync-include-list.sh

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
		# https://stackoverflow.com/questions/15687755/how-to-use-rsync-to-copy-only-specific-subdirectories-same-names-in-several-dir
		echo "/$k"
		echo "/$k/$l"
		echo "/$k/$l/files"
		echo "/$k/$l/files/*"
		echo "/$k/$l/files/*/*"  # some services have versioned folders with files within
	done
done

exit $?
