Name:       fusion-linux-config
Version:    16.1
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
This package contains Fusion Linux specific user configuration.

%package fa
Summary:    Fusion Linux Custom Configuration

# for keyboard settings
Requires:   libgnomekbd

%description fa
This package contains Fusion Linux specific user configuration which is prepared
for Desktop users.

%prep
%setup -q

%build

%install
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
* Tue Dec 27 2011 Hedayat Vatankhah <valent.turkovic@gmail.com> - 16.1-1
- Initial release for Fusion Linux 16.1
