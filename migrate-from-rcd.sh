#!/bin/bash
# to migrate existing services from Slackware's default init scripts in
# /etc/rc.d to OpenRC services

SYSCONFDIR=${SYSCONFDIR:-/etc}

enable_service=()
running_service=()

# Display exising enabled services
echo "Currently executable:"
for file in ${SYSCONFDIR}/rc.d/*; do
	if [ -x "${file}" ]; then
		echo "${file}"
		# Check corresponding init.d service
		service_name=$(basename "${file}" | sed 's/rc.//')
		if [ -f "${SYSCONFDIR}/init.d/${service_name}" ]; then
			if ! service "${service_name}" status > /dev/null; then
				enable_service+=(${service_name})
			else
				running_service+=(${service_name})
			fi
		fi
	fi
done

echo -e "\nCan be enabled: "
for service in "${enable_service[@]}"; do
	echo "${service}"
done

echo -e "\nCurrently running: "
for service in "${running_service[@]}"; do
	echo "${service}"
done
