# Get the version name first by seeing if HEAD is tagged
version := $(shell git tag --points-at HEAD -l '0.*.*' | head -1)
# And if it wasn't use a git hash
ifeq ($(version),)
  version := $(shell git log -1 --abbrev=8 --pretty=git%h)
endif

DESTDIR := /usr

DATADIR := $(DESTDIR)/share

DOCDIR := $(DATADIR)/doc

name := spin-kickstarts

all: dist

install:
	mkdir -p -m 755 $(DATADIR)/$(name)
	install *.ks* -m 644 $(DATADIR)/$(name)
	mkdir -p -m 755 $(DATADIR)/$(name)/custom
	install -m 644 custom/* $(DATADIR)/$(name)/custom
	mkdir -p -m 755 $(DATADIR)/$(name)/l10n
	install -m 644 l10n/* $(DATADIR)/$(name)/l10n

clean:
	rm -f $(name)-*.tar.gz

dist:	$(name)-$(version).tar.gz

$(name)-$(version).tar.gz:
	git archive --format=tar --prefix=$(name)-$(version)/ HEAD | gzip > $(name)-$(version).tar.gz

publish:	$(name)-$(version).tar.gz
	scp $(name)-$(version).tar.gz fedorahosted.org:$(name)

dist-clean:
	git clean -f -d
