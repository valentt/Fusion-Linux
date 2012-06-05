%define instdir %{_datadir}/icons

Name: faience-icon-theme
Version: 0.3
Release: 0%{?dist}
Summary: Faience Icon Theme
License: GPLv3+
Group: User Interface/Desktops
URL: http://tiheum.deviantart.com/art/Faience-icon-theme-255099649
Packager: Satyajit Sahoo <satyajit.happy@gmail.com>
Source0: %{name}-%{version}.tar.gz
BuildArch: noarch
BuildRoot: %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)
Requires: faenza-icon-theme

%description
Faience is a Work In Progress that include an icon theme based on Faenza.

%prep
%setup -q

%install
%{__rm} -rf %{buildroot}
%{__mkdir_p} %{buildroot}%{instdir}
%{__cp} -a Faience %{buildroot}%{instdir}
%{__cp} -a Faience-Azur %{buildroot}%{instdir}
%{__cp} -a Faience-Ocre %{buildroot}%{instdir}

%clean
%{__rm} -rf %{buildroot}

%files
%{instdir}/Faience
%{instdir}/Faience-Azur
%{instdir}/Faience-Ocre

%changelog

* Sun Jun 03 2012 Satyajit Sahoo <satyajit.happy@gmail.com> 0.3
- Initial Release
