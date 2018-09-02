#!/bin/bash
# download-via-git.sh: downloads openrc scripts from gentoo sources

# for safety and robustness
set -e

# get source list
. "$(pwd)/source_list.sh"

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
fi

REMOTE_REPO="gentoo"
REMOTE_REPO_URL="https://github.com/gentoo/gentoo.git"

# checking out selective directories via git
# https://askubuntu.com/a/645276/183206
mkdir -p "${REMOTE_REPO}"
cd "$REMOTE_REPO"
if [ ! -d .git ]; then
	git init
	git remote add origin "$REMOTE_REPO_URL"
	git config core.sparseCheckout true
fi

cd -
sparse_checkout_file="${REMOTE_REPO}/.git/info/sparse-checkout"
[ -f "$sparse_checkout_file" ] && rm "$sparse_checkout_file"
./generate-sparse-checkout-list.sh >> "$sparse_checkout_file"

cd "$REMOTE_REPO"
git pull origin master

exit $?
