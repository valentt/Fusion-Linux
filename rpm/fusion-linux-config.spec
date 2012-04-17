#
# fusion-linux-config
# Copyright (c) 2012 Fusion Linux - http://www.fusionlinux.org
#


Name:           fusion-linux-config
Version:        17.0
Release:        1%{?dist}
Summary:        Fusion Linux base customizations
Group:          System Environment/Base
License:        GPLv2+
URL:            http://www.fusionlinux.org
Source0:        org.fusion.linux.settings.gschema.override
Source1:        COPYING
BuildArch:      noarch
BuildRoot:      %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)
# -- FIXME default icon theme
#Requires:       faience-icon-theme
# -- FIXME wallpapers
#Requires:       fusion-linux-wallpapers >= 17.0
Requires:       gnome-settings-daemon
Requires:       gsettings-desktop-schemas

%description
This package provides the default system wide configuration prepared for
Fusion Linux Desktop users.


%prep
cp %{S:1} .


%build


%install
rm -rf %{buildroot}
install -D -m 0644 %{S:0} %{buildroot}%{_datadir}/glib-2.0/schemas/org.fusion.linux.settings.gschema.override


%clean
rm -rf %{buildroot}


%postun
if [ $1 -eq 0 ] ; then
    /usr/bin/glib-compile-schemas %{_datadir}/glib-2.0/schemas &> /dev/null || :
fi

%posttrans
/usr/bin/glib-compile-schemas %{_datadir}/glib-2.0/schemas &> /dev/null || :


%files
%defattr(-,root,root,-)
%doc COPYING
%{_datadir}/glib-2.0/schemas/*.override



%changelog
* Tue Apr 03 2012 Nelson Marques <nmarques@fedoraproject.org> - 17.0-1
- Cleanups and updates on spec file.

* Tue Dec 27 2011 Hedayat Vatankhah <valent.turkovic@gmail.com> - 16.1-1
- Initial release for Fusion Linux 16.1
