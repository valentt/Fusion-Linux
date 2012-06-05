%define theme minty-colors
%define launcher %{theme}.exec
%define desktopfile %{theme}.desktop

Name: cinnamon-theme-minty-colors
Version: 0.1
Release: 0%{?dist}
Summary: Minty Colors Cinnamon Theme
License: GPLv3+
Group: User Interface/Desktops
URL: http://satya164.deviantart.com/
Packager: Satyajit Sahoo <satyajit.happy@gmail.com>
Source0: %{name}-%{version}.tar.gz
BuildArch: noarch
BuildRoot: %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)
Requires: gnome-shell >= 3.4.0, ImageMagick

%description
Minty Colors is a chameleon theme for Cinnamon.

%prep
%setup -q

%install
%{__rm} -rf $RPM_BUILD_ROOT
%{__mkdir_p} $RPM_BUILD_ROOT%{_datadir}/%{theme}
%{__cp} -a %{theme} $RPM_BUILD_ROOT%{_datadir}/%{theme}
%{__install} -Dpm 0755 %{launcher} %{buildroot}%{_bindir}/%{launcher}

desktop-file-install --delete-original --dir %{buildroot}%{_datadir}/applications --add-category X-Fedora %{desktopfile}

%{__mkdir_p} $RPM_BUILD_ROOT%{_sysconfdir}/xdg/autostart
%{__cp} $RPM_BUILD_ROOT%{_datadir}/applications/%{desktopfile} $RPM_BUILD_ROOT%{_sysconfdir}/xdg/autostart

%clean
%{__rm} -rf $RPM_BUILD_ROOT

%files
%doc COPYING
%{_bindir}/%{launcher}
%{_datadir}/%{theme}
%{_datadir}/applications/%{theme}.desktop
%{_sysconfdir}/xdg/autostart/%{theme}.desktop

%changelog

* Sun Jun 03 2012 Satyajit Sahoo <satyajit.happy@gmail.com> 0.1
- Initial Release
