# Automake Automagic

fedoradir = $(pkgdatadir)/
fedora_DATA = \
    fedora-aos.ks \
    fedora-install-fedora.ks \
    fedora-live-base.ks \
    fedora-live-minimization.ks \
    fedora-live-mini.ks \
    fedora-livecd-design-suite.ks \
    fedora-live-desktop.ks \
    fedora-livecd-desktop.ks \
    fedora-live-kde.ks \
    fedora-livecd-kde.ks \
    fedora-live-kde-base.ks \
    fedora-livecd-lxde.ks \
    fedora-livecd-meego.ks \
    fedora-livecd-soas.ks \
    fedora-livecd-xfce.ks \
    fedora-livedvd-electronic-lab.ks \
    fedora-livedvd-games.ks \
    fedora-livecd-security.ks

customdir = ${pkgdatadir}/custom/
custom_DATA = \
    custom/README \
    custom/fedora-livedvd-haskell.ks \
    custom/qa-test-day.ks

l10ndir = ${pkgdatadir}/l10n/
l10n_DATA = \
	l10n/README \
    l10n/fedora-livecd-desktop-de_CH.ks \
    l10n/fedora-livecd-desktop-de_DE.ks \
    l10n/fedora-livecd-desktop-nl_NL.ks \
    l10n/fedora-livecd-desktop-pt_BR.ks \
    l10n/fedora-livecd-desktop-pt_PT.ks \
    l10n/fedora-livecd-kde-de_CH.ks \
    l10n/fedora-livecd-kde-de_DE.ks \
    l10n/fedora-livecd-kde-nl_NL.ks \
    l10n/fedora-livecd-kde-pt_PT.ks \
    l10n/fedora-livecd-lxde-de_DE.ks \
    l10n/fedora-livecd-xfce-de_CH.ks \
    l10n/fedora-livecd-xfce-nl_NL.ks \
    l10n/fedora-livecd-xfce-pt_PT.ks \
    l10n/fedora-livedvd-electronic-lab-de_CH.ks \
    l10n/fedora-livedvd-electronic-lab-nl_NL.ks \
    l10n/fedora-livedvd-electronic-lab-pt_PT.ks \
    l10n/fedora-livedvd-games-de_CH.ks \
    l10n/fedora-livedvd-games-nl_NL.ks \
    l10n/fedora-livedvd-games-pt_PT.ks

EXTRA_DIST =               \
    $(fedora_DATA) \
	$(custom_DATA) \
	$(l10n_DATA) \
    spin-kickstarts.spec.in\
    spin-kickstarts.spec   \
    ChangeLog              \
    COPYING                \
    AUTHORS                \
    README

DISTCLEANFILES =           \
    intltool-extract       \
    intltool-merge         \
    intltool-update

install-exec-local:

uninstall-local:
	rm -rf $(DESTDIR)$(pkgdatadir)

clean:
	rm -f ChangeLog
	rm -f *~
	rm -f spin-kickstarts.spec
	rm -f config.status config.log
	rm -rf autom4te.cache/
	find -type f -name "Makefile" -exec rm -f {} \;
	find -type f -name "*.rpmnew" -exec rm -f {} \;
	find -type f -name "*.rpmsave" -exec rm -f {} \;
	find -type f -name "Makefile.in" -exec rm -f {} \;
	find -type f -name "*.log" -exec rm -f {} \;
	find -type f -name "spin-kickstarts-*.tar.gz" -exec mv -f {} .. \;
	rm -f aclocal.m4 configure

ChangeLog:
	(GIT_DIR=.git git log > .changelog.tmp && mv .changelog.tmp ChangeLog; rm -f .changelog.tmp) || (touch ChangeLog; echo 'git directory not found: installing possibly empty changelog.' >&2)

rpm: ChangeLog dist
	@(rpmbuild -ta ${PACKAGE}-$(PACKAGE_VERSION).tar.gz)

srpm: ChangeLog dist
	@(rpmbuild -ts ${PACKAGE}-$(PACKAGE_VERSION).tar.gz)

CVS_PKGVERSION=`echo $(PACKAGE_VERSION) | sed -e 's/\./_/g'`
CVSTAG=$(PACKAGE_NAME)-$(CVS_PACKAGEVERSION)
tag:
	@cvs tag -F $(CVSTAG)

RELEASE=`rpm -q --qf="%{RELEASE}\n" --specfile ${PACKAGE}.spec | head -n 1`

F-7: srpm
	@(mock -v -r fedora-7-i386 rebuild ~/rpmbuild/SRPMS/${PACKAGE}-$(PACKAGE_VERSION)-$(RELEASE).src.rpm)

F-8: srpm
	@(mock -v -r fedora-8-i386 rebuild ~/rpmbuild/SRPMS/${PACKAGE}-$(PACKAGE_VERSION)-$(RELEASE).src.rpm)

F-9: srpm
	@(mock -v -r fedora-9-i386 rebuild ~/rpmbuild/SRPMS/${PACKAGE}-$(PACKAGE_VERSION)-$(RELEASE).src.rpm)

devel: srpm
	@(mock -v -r fedora-devel-i386 rebuild ~/rpmbuild/SRPMS/${PACKAGE}-$(PACKAGE_VERSION)-$(RELEASE).src.rpm)

EL-5: srpm
	@(mock -v -r epel-5-i386 rebuild ~/rpmbuild/SRPMS/${PACKAGE}-$(PACKAGE_VERSION)-$(RELEASE).src.rpm)

mock: srpm F-7 F-8 F-9 devel EL-5

RELEASE_NUM=`rpm -q --qf="%{RELEASE}\n" --specfile ${PACKAGE}.spec | head -n 1 | cut -d'.' -f 1`

fpeople: mock
	rm -rf public_html
	mkdir -p public_html/${PACKAGE}/$(PACKAGE_VERSION)-$(RELEASE_NUM)/{el5,fc7,fc8,fc9}
	cp ${PACKAGE}-$(PACKAGE_VERSION).tar.gz public_html/${PACKAGE}/$(PACKAGE_VERSION)-$(RELEASE_NUM)/.
	cp ${PACKAGE}.spec public_html/${PACKAGE}/$(PACKAGE_VERSION)-$(RELEASE_NUM)/.
	cp /var/lib/mock/epel-5-i386/result/* public_html/${PACKAGE}/$(PACKAGE_VERSION)-$(RELEASE_NUM)/el5/.
	cp /var/lib/mock/fedora-7-i386/result/* public_html/${PACKAGE}/$(PACKAGE_VERSION)-$(RELEASE_NUM)/fc7/.
	cp /var/lib/mock/fedora-8-i386/result/* public_html/${PACKAGE}/$(PACKAGE_VERSION)-$(RELEASE_NUM)/fc8/.
	cp /var/lib/mock/fedora-development-i386/result/* public_html/${PACKAGE}/$(PACKAGE_VERSION)-$(RELEASE_NUM)/fc9/.
	scp -r public_html fedorapeople.org:.

custom: mock
	rm -rf custom
	mkdir -p custom/{el5,f7,f8,f9}/{i386,x86_64,ppc,SRPMS}/
	cp /var/lib/mock/epel-5-i386/result/*.noarch.rpm custom/el5/i386/.
	cp /var/lib/mock/epel-5-i386/result/*.noarch.rpm custom/el5/x86_64/.
	cp /var/lib/mock/epel-5-i386/result/*.noarch.rpm custom/el5/ppc/.
	cp /var/lib/mock/epel-5-i386/result/*.src.rpm custom/el5/SRPMS/.
	cp /var/lib/mock/fedora-7-i386/result/*.noarch.rpm custom/f7/i386/.
	cp /var/lib/mock/fedora-7-i386/result/*.noarch.rpm custom/f7/x86_64/.
	cp /var/lib/mock/fedora-7-i386/result/*.noarch.rpm custom/f7/ppc/.
	cp /var/lib/mock/fedora-7-i386/result/*.src.rpm custom/f7/SRPMS/.
	cp /var/lib/mock/fedora-8-i386/result/*.noarch.rpm custom/f8/i386/.
	cp /var/lib/mock/fedora-8-i386/result/*.noarch.rpm custom/f8/x86_64/.
	cp /var/lib/mock/fedora-8-i386/result/*.noarch.rpm custom/f8/ppc/.
	cp /var/lib/mock/fedora-8-i386/result/*.src.rpm custom/f8/SRPMS/.
	cp /var/lib/mock/fedora-development-i386/result/*.noarch.rpm custom/f9/i386/.
	cp /var/lib/mock/fedora-development-i386/result/*.noarch.rpm custom/f9/x86_64/.
	cp /var/lib/mock/fedora-development-i386/result/*.noarch.rpm custom/f9/ppc/.
	cp /var/lib/mock/fedora-development-i386/result/*.src.rpm custom/f9/SRPMS/.
	scp -r custom elwood.kanarip.com:/data/os/repos/.
