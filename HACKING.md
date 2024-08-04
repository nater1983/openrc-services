### Source list

The list of services fetched upstream can be found in [source_list.sh](source_list.sh).

Other miscellaneous sources can be found under [misc](misc).

### Downloading

The default method to download is via rsync to the gentoo repo and fetching source files
 for the services present in sources_list.sh

### Patching and Installing

The services are categorized roughly according to their function, like net, desktop, base, etc.

After the source files have been fetched, we inspect them to make sure they use the paths
 specific to our distribution. If we need to change a path or something else in the service file,
 we can patch it by editing the corresponding fix_openrc_type file, for example [fix_openrc_net.sh](fix_openrc_net.sh).

The purpose of keeping the base service intact and doing the patching via an external file is to make it easier to keep
the service files in sync with the upstream gentoo.

For installation we use the install_openrc_type file. Here we can choose which version of the service
 to install from the gentoo repo (sometimes there are multiple). For example to see how network services are installed.
 please check [install_openrc_net.sh](install_openrc_net.sh).

[install.sh](install.sh) serves as overall makefile.

### Verification and testing

We can patch and install the files to a local directory and inspect them to make sure they have been patched and installed
 correctly. For example we can run ./install.sh ./test to install the files to a test folder and inspect them there.
