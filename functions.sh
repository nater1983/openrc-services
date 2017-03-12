#!/bin/bash
# functions.sh

# Called after sourcing the PKGBUILD, such that the source array is declared.
download_source() {
	for file in ${source[@]}; do
		# Check if file is a link or not
		echo ${file} | grep -q http
		[ $? -ne 0 ] && return 1
		# Get the actual file name
		filename=${file#*::}
		wget -c --tries=6 $filename
	done
}
