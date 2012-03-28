Name:       fusion-linux-config
Version:    16.0
Release:    1%{?dist}
Summary:    Fusion Linux Configuration Customizations

Group:      System Environment/Base
URL:        http://fusionlinux.org/
Source0:    http://downloads.sourceforge.net/fusion-linux/%{name}-%{version}.tar.bz2
License:    GPLv2+
BuildArch:  noarch

# for gnome default background
Requires:   fusion-linux-backgrounds-gnome gsettings-desktop-schemas

# for touchpad settings
Requires:   gnome-settings-daemon

%description
This package contains Parsidora specific user configuration.

%package fa
Summary:    Parsidora Configuration for Persian Users

# for keyboard settings
Requires:   libgnomekbd

%description fa
This package contains Parsidora specific user configuration which is prepared
for Persian users, such as enabling Persian keyboard layout.

%prep
%setup -q

%build

%install
# Install OO configuration
OO_CONFIG_DIR=%{_sysconfdir}/skel/.libreoffice/3/user/
mkdir -p %{buildroot}${OO_CONFIG_DIR}
install -p -m 600 libreoffice/registrymodifications.xcu %{buildroot}${OO_CONFIG_DIR}

# install config schemas
mkdir -p %{buildroot}%{_datadir}/glib-2.0/schemas
install -p -m 644 schemas/* %{buildroot}%{_datadir}/glib-2.0/schemas/

%posttrans
glib-compile-schemas %{_datadir}/glib-2.0/schemas &> /dev/null || :

%posttrans fa
glib-compile-schemas %{_datadir}/glib-2.0/schemas &> /dev/null || :

%postun
if [ $1 -eq 0 ]; then
  glib-compile-schemas %{_datadir}/glib-2.0/schemas &> /dev/null || :
fi

%postun fa
if [ $1 -eq 0 ]; then
  glib-compile-schemas %{_datadir}/glib-2.0/schemas &> /dev/null || :
fi


%files
%{_sysconfdir}/skel/.[^.]*
%{_datadir}/glib-2.0/schemas/*desktop*
%{_datadir}/glib-2.0/schemas/*settings*

%files fa
%{_datadir}/glib-2.0/schemas/*keyboard*

%changelog
* Fri Dec 30 2011 Hedayat Vatankhah <hedayat.fwd+rpmchlog@gmail.com> - 16.0-3
- fixed schema for gnome default background

* Wed Dec 28 2011 Hedayat Vatankhah <hedayat.fwd+rpmchlog@gmail.com> - 16.0-2
- Depend on backgrounds-gnome package

* Tue Dec 27 2011 Hedayat Vatankhah <hedayat.fwd+rpmchlog@gmail.com> - 16.0-1
- Updated for Parsidora 16

* Sat Jul 23 2011 Hedayat Vatankhah <hedayat.fwd+rpmchlog@gmail.com> - 15.0-1
- Updated for Fedora 15

* Fri Dec 10 2010 Hedayat Vatankhah <hedayat.fwd+rpmchlog@gmail.com> - 1.0-1
- Add touchpad tapping settings as used usually

* Thu Dec 09 2010 Hedayat Vatankhah <hedayat.fwd+rpmchlog@gmail.com> - 1.0-1
- Initial version with OO CTL support and initial configuration
- Added gconf settings setup, with the support for ir keyboard layout
