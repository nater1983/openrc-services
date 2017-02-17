#!/bin/bash
# to migrate existing services from Slackware's default init scripts in
# /etc/rc.d to OpenRC services

# Display exising enabled services
for file in /etc/rc.d/*; do
	if [ -x "${file}" ]; then
		echo "enabled ${file}"
	fi
done
