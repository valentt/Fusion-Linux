%define binary %{name}
%define instdir fusion-linux
%define libdir %{name}-libs
%define desktopfile %{name}.desktop

Name: fusion-creator
Version: 1.0
Release: 0%{?dist}
Summary: Fusion Creator
Group: Applications/Productivity
License: GPLv3+
Packager: Satyajit Sahoo <satyajit.happy@gmail.com>
URL: http://fusionlinux.org/
Source0: %{name}-%{version}.tar.gz
BuildRoot: %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)
BuildArch: noarch

%description
Fusion Linux post installation script borrowed from CrunchBang Linux.

%prep
%setup -q 

%build

%install
%{__rm} -rf %{buildroot}
%{__mkdir_p} %{buildroot}%{_bindir}
%{__mkdir_p} %{buildroot}%{_datadir}/%{instdir}/%{name}
%{__mkdir_p} %{buildroot}%{_datadir}/%{instdir}/%{name}/%{libdir}
%{__cp} -a %{libdir} %{buildroot}%{_datadir}/%{instdir}/%{name}/
%{__install} -Dpm 0755 %{binary} %{buildroot}%{_datadir}/%{instdir}/%{name}/%{binary}
%{__mkdir_p} %{buildroot}%{_bindir}
ln -sf %{_datadir}/%{instdir}/%{name}/%{binary} %{buildroot}%{_bindir}/%{binary}

desktop-file-install --delete-original --dir %{buildroot}%{_datadir}/applications --add-category X-Fedora %{desktopfile}

%{__mkdir_p} %{buildroot}%{_sysconfdir}/xdg/autostart
%{__cp} %{buildroot}%{_datadir}/applications/%{desktopfile} %{buildroot}%{_sysconfdir}/xdg/autostart

%clean
%{__rm} -rf %{buildroot}

%post

%files
%defattr(-,root,root,-)
%{_bindir}/%{name}
%{_datadir}/%{instdir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_sysconfdir}/xdg/autostart/%{name}.desktop

%changelog

* Tue Jun 05 2012 Satyajit Sahoo <satyajit.happy@gmail.com> 0.1
- rpm package built
