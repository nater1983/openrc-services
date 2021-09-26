#!/bin/bash
# source_list.sh: list of sources we handle

# CATEGORIES are sorted alphabetically
# PROGRAMS in each CATEGORY are present as separate arrays

# make CATEGORIES an associative array, so that its items can be accessed by name
declare -A CATEGORIES

CATEGORIES=(
	[app_accessibility]='app-accessibility'
	[app_admin]='app-admin'
	[app_crypt]='app-crypt'
	[app_emulation]='app-emulation'
	[app_misc]='app-misc'
	[dev_db]='dev-db'
	[dev_lang]='dev-lang'
	[dev_libs]='dev-libs'
	[dev_util]='dev-util'
	[dev_vcs]='dev-vcs'
	[gui_libs]='gui-libs'
	[mail_mta]='mail-mta'
	[media_gfx]='media-gfx'
	[media_sound]='media-sound'
	[net_analyzer]='net-analyzer'
	[net_dns]='net-dns'
	[net_firewall]='net-firewall'
	[net_fs]='net-fs'
	[net_ftp]='net-ftp'
	[net_im]='net-im'
	[net_libs]='net-libs'
	[net_misc]='net-misc'
	[net_nds]='net-nds'
	[net_p2p]='net-p2p'
	[net_print]='net-print'
	[net_proxy]='net-proxy'
	[net_vpn]='net-vpn'
	[net_wireless]='net-wireless'
	[sci_misc]='sci-misc'
	[sys_apps]='sys-apps'
	[sys_auth]='sys-auth'
	[sys_devel]='sys-devel'
	[sys_fs]='sys-fs'
	[sys_libs]='sys-libs'
	[sys_power]='sys-power'
	[sys_process]='sys-process'
	[www_servers]='www-servers'
	[x11_apps]='x11-apps'
	[x11_drivers]='x11-drivers'
	[x11_misc]='x11-misc'
)

# We cannot store a variable dev-db, so we use associative array above
# and set arrays like dev_db

app_accessibility=(espeakup)
app_admin=(metalog mcelog monit rsyslog salt sysklogd syslog-ng ulogd)
app_crypt=(mit-krb5)
app_emulation=(libvirt virtualbox-guest-additions xe-guest-utilities)
app_misc=(lirc)
dev_db=(influxdb mongodb mysql-init-scripts postgresql redis)
dev_lang=(php)
dev_libs=(cyrus-sasl)
dev_util=(jenkins-bin)
dev_vcs=(git subversion)
gui_libs=(display-manager-init)
mail_mta=(postfix sendmail)
media_gfx=(sane-backends)
media_sound=(alsa-utils mpd pulseaudio)
net_analyzer=(vnstat net-snmp)
net_dns=(bind dnscrypt-proxy dnsmasq unbound)
net_firewall=(iptables ufw)
net_fs=(autofs nfs-utils samba)
net_ftp=(proftpd tftp-hpa vsftpd)
net_im=(bitlbee)
net_libs=(openslp)
net_misc=(chrony connman dhcp dhcpcd networkmanager ntp openntpd openssh rsync teamviewer tor)
net_nds=(openldap rpcbind)
net_p2p=(syncthing transmission)
net_print=(cups)
net_proxy=(privoxy squid)
net_vpn=(openvpn tor)
net_wireless=(bluez hostapd wpa_supplicant)
sci_misc=(boinc)
sys_apps=(dbus haveged hdparm kmod lm-sensors xinetd)
sys_auth=(elogind)
sys_devel=(distcc)
sys_fs=(cryptsetup eudev fuse-common lvm2 mdadm quota)
sys_libs=(gpm)
sys_power=(acpid cpupower thermald)
sys_process=(anacron at cronie dcron fcron)
www_servers=(lighttpd nginx)
x11_apps=(xinit)
x11_drivers=(nvidia-drivers)
x11_misc=(virtualgl bumblebee)

# missing
# OPENRC_BASE: inetutils
# OPENRC_DESKTOP: avahi
# OPENRC_MISC: zfs
# OPENRC_NET: apache wicd
