#!/bin/sh
# install.sh: installs the openrc scripts into /etc/init.d and /etc/conf.d

set -e  # exit on error

DESTDIR=$1
SYSCONFDIR=${SYSCONFDIR:-etc}

echo "Installing OpenRC services..."

sh install_openrc_accessible.sh "$DESTDIR"
sh install_openrc_base.sh "$DESTDIR"
sh install_openrc_desktop.sh "$DESTDIR"
sh install_openrc_devel.sh "$DESTDIR"
sh install_openrc_misc.sh "$DESTDIR"
sh install_openrc_net.sh "$DESTDIR"
sh install_openrc_slack.sh "$DESTDIR"
sh install_openrc_video.sh "$DESTDIR"

echo "Fixing some services..."

sh fix_openrc_base.sh "$DESTDIR"
sh fix_openrc_desktop.sh "$DESTDIR"
sh fix_openrc_devel.sh "$DESTDIR"
sh fix_openrc_misc.sh "$DESTDIR"
sh fix_openrc_net.sh "$DESTDIR"
sh fix_openrc_slack.sh "$DESTDIR"
sh fix_openrc_video.sh "$DESTDIR"

# Fixes for change in runscript and location of /var/run
sh fix_path.sh "$DESTDIR"

echo "Done."
