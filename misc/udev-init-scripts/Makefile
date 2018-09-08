VERSION = 32
PACKAGE = udev-init-scripts
TARBALL = $(PACKAGE)-$(VERSION).tar.gz

SYSCONFDIR ?= /etc
CONFD ?= $(SYSCONFDIR)/conf.d
INITD ?= $(SYSCONFDIR)/init.d

all:

install:
	install -d $(DESTDIR)$(CONFD)
	install -m 0644 conf.d/* $(DESTDIR)$(CONFD)
	install -d $(DESTDIR)$(INITD)
	install -m 0755 init.d/* $(DESTDIR)$(INITD)

check-git-repository:
	git diff --quiet || { echo 'STOP, you have uncommitted changes in the working directory' ; false ; }
	git diff --cached --quiet || { echo 'STOP, you have uncommitted changes in the index' ; false ; }

dist:
	git archive --prefix=$(PACKAGE)-$(VERSION)/ $(VERSION) -o $(TARBALL)

snapshot: check-git-repository
	git archive --format=tar --prefix=$(PACKAGE)/ HEAD | \
		bzip2 > $(PACKAGE).tar.bz2

.PHONY: install

