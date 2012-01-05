Name:       spin-kickstarts
Version:    0.16.2
Release:    1%{?dist}
License:    GPLv2+
Summary:    Kickstart files and templates for creating your own Fedora Spins
Group:      Applications/System
URL:        http://fedorahosted.org/spin-kickstarts
Source0:    http://fedorahosted.org/releases/s/p/%{name}/%{name}-%{version}.tar.gz
BuildRoot:  %{_tmppath}/%{name}-%{version}-%{release}-root
BuildArch:  noarch
Requires:   fedora-kickstarts

%description
A number of kickstarts you can use to create customized (Fedora) Spins

%package -n fedora-kickstarts
Summary:    Official Fedora Spins
Group:      Applications/System
Requires:   spin-kickstarts = %{version}-%{release}

%description -n fedora-kickstarts
Kickstarts used to compose the official Fedora Spins (see
http://spins.fedoraproject.org/ for a full list)

%package -n custom-kickstarts
Summary:    Kickstart files for Custom Spins (not official)
Group:      Applications/System
Requires:   spin-kickstarts = %{version}-%{release}
Requires:   fedora-kickstarts = %{version}-%{release}

%description -n custom-kickstarts
Unofficial spins (remixes) brought to us by several contributors

%package -n l10n-kickstarts
Summary:    Localized kickstarts for localized spins
Group:      Applications/System
Requires:   fedora-kickstarts = %{version}-%{release}
Requires:   custom-kickstarts = %{version}-%{release}

%description -n l10n-kickstarts
Localized versions of kickstarts for localized spins

%prep
%setup -q

%build
%configure
make

%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%doc COPYING README AUTHORS NEWS
%dir %{_datadir}/%{name}/

%files -n fedora-kickstarts
%defattr(-,root,root,-)
%{_datadir}/%{name}/*.ks

%files -n custom-kickstarts
%defattr(-,root,root,-)
%dir %{_datadir}/%{name}/custom/
%{_datadir}/%{name}/custom/*.ks
%doc %{_datadir}/%{name}/custom/README

%files -n l10n-kickstarts
%defattr(-,root,root,-)
%dir %{_datadir}/%{name}/l10n/
%{_datadir}/%{name}/l10n/*.ks
%doc %{_datadir}/%{name}/l10n/README

%changelog
* Sat Oct 15 2011 Bruno Wolff III <bruno@wolff.to> 0.16.2-1
- Get an up to date version now that we are near f16 final freeze

* Sat Aug 06 2011 Bruno Wolff III <bruno@wolff.to> 0.16.1-1
- Update for F16 branch

* Fri May 20 2011 Bruno Wolff III <bruno@wolff.to> 0.16.0-1
- Initial F16 build

* Fri Apr 01 2011 Bruno Wolff III <bruno@wolff.to> 0.15.4-1
- Enough has changed that it seems worth doing a new beta build

* Wed Mar 16 2011 Bruno Wolff III <bruno@wolff.to> 0.15.3-1
- Early beta build to facilitate testing
- The alternate KDE ks file has been added to the package

* Mon Feb 14 2011 Bruno Wolff III <bruno@wolff.to> 0.15.2-1
- Rebuild to point to branched release

* Mon Feb 07 2011 Bruno Wolff III <bruno@wolff.to> 0.15.1-1
- Pre-alpha release rebuild

* Sun Oct 31 2010 Bruno Wolff III <bruno@wolff.to> 0.15.0-1
- Now that F14 is gold, we want a separate rawhide package.
- Includes most stuff from F14, minus some last minute space cutting changes.

* Tue Jul 27 2010 Bruno Wolff III <bruno@wolff.to> 0.14.1-1
- Get a snapshot of kickstarts just prior to f14 branch

* Mon Jun 07 2010 Bruno Wolff III <bruno@wolff.to> 0.14.0-1
- New release for F14
- Add some documentation about how rebuild package from git repo
- Change custom kickstarts to use ../ to refer to included kickstarts

* Sun Jul 05 2009 Jeroen van Meeuwen <kanarip a fedoraunity.org> 0.11.4-1
- Fix repos in fedora-install-fedora.ks (#505262)

* Sun May 31 2009 Jeroen van Meeuwen <kanarip a fedoraunity.org> 0.11.3-1
- New release
- Removed developer spin from the mix

* Wed Mar 04 2009 Jeroen van Meeuwen <kanarip a fedoraunity.org> 0.11.1-1
- Added de_CH localized spins

* Tue Feb 23 2009 Jeroen van Meeuwen <kanarip a fedoraunity.org> 0.11.0-2
- Remove fedora-livecd-desktop-default.ks

* Sat Nov 29 2008 Jeroen van Meeuwen <kanarip a fedoraunity.org> 0.11.0-1
- Point fedora-live-base.ks repos to f-10
- Remove sysprof from fedora-livedvd-developer.ks
- Latest and final rebuild for Fedora 10

* Sat Nov 08 2008 Jeroen van Meeuwen <kanarip a fedoraunity.org> 0.10.2-1
- Package updates to kickstarts into F-10 package

* Fri Nov 07 2008 Jeroen van Meeuwen <kanarip a fedoraunity.org> 0.10.1-1
- Second build for review #448072

* Fri May 23 2008 Jeroen van Meeuwen <kanarip a fedoraunity.org> 0.01-1
- Initial packaging
