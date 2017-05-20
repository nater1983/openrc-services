#!/bin/bash
# functions.sh

# Called after sourcing the PKGBUILD, such that the source array is declared.
download_source() {
	for file in ${source[@]}; do
		# Check if file is a downloadable link or not
		if ! echo "${file}" | grep -q http; then
			return 1
		fi
		# Get the actual file name
		filename=${file#*::}
		wget -c --tries=4 $filename
	done
}
