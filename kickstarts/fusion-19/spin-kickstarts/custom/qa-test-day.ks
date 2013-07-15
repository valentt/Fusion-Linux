### Fedora Test Day LiveCD ###
# Read more at: https://fedoraproject.org/wiki/QA/Test_Days/Live_Image
# Contact QA team if you have any improvements for this kickstart:
# https://fedoraproject.org/wiki/QA

%include ../fedora-livecd-desktop.ks


## System configuration
# Warn about SELinux issues, but don't block
selinux --permissive


## Repositories
# If you want, you can enable updates-testing
#repo --name=updates-testing --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-testing-f$releasever&arch=$basearch
# You can also define your own repository here with custom/bleeding-edge packages
#repo --name=test-day --baseurl=http://server/path


## Packages
%packages
# Remove Anaconda, this image is not intended for installation (we modify the
# image a lot, removing lots of software and changing some system defaults).
# TCs/RCs are intended for installation instead. Of course you can put the
# installer back for a specific Test Day, if needed, but make sure to communicate
# well to people that it is intended for testing purposes, not for real usage.
-@anaconda-tools
-anaconda

# Strip as many packages as possible, so that our testers don't need to download
# large ISOs. Only leave those packages that are generally useful for Test Days.
# Test Day organizers can adjust the kickstart and add specific packages they
# need for a particular Test Day.
-@libreoffice
-@printing
-aisleriot
-authconfig
-brasero*
-cheese
-colord
-colord-gtk
-deja-dup
-evolution
-evolution-ews
-fedora-release-notes
-firewall-config
-firstboot
-gnome-backgrounds
-gnome-boxes
-gnome-color-manager
-gnome-clocks
-gnome-contacts
-gnome-dictionary
-gnome-documents
-gnome-font-viewer
-gnome-getting-started-docs
-gnome-icon-theme-extras
-gnome-initial-setup
-gnome-photos
-gucharmap
-initial-setup
-libsane-hpaio
-nautilus-sendto
-orca
-realmd
-rhythmbox
-sane-backends*
-sendmail
-shotwell
-simple-scan
-system-config-*
-tmpwatch
-transmission-gtk
-vinagre
-yum-langpacks

# Add some smaller alternatives for the stripped packages
abiword

# Add packages useful for testing and debugging problems
gdb
strace
ltrace
gtk-recordmydesktop
gconf-editor
dconf-editor
nautilus-open-terminal
iotop
htop

# Add favorite power-user tools
mc
vim
nano
wget

# Add dependencies for the welcome screen
# (this makes it run also on non-GNOME systems)
gjs
firefox

%end


## LiveCD environment adjustments
%post

# The following changes are executed only during LiveCD boot and wouldn't affect
# the installed system. This image is not intended for installation, but you
# never know what your users might do.

# "EOF" is quoted so that variables are not expanded. Search for "here-document"
# in man bash.
cat >> /etc/rc.d/init.d/livesys << "EOF"

# Create Test Day welcome screen
# Note that shebang must be written this way, else it is considered as comment
echo "#!/usr/bin/env gjs-console" > /tmp/test-day-welcome
cat >> /tmp/test-day-welcome << FOE
%include qa-test-day-welcome.js
FOE
chmod +x /tmp/test-day-welcome

cat > /usr/share/applications/test-day-welcome.desktop << FOE
[Desktop Entry]
Name=Welcome to Fedora Test Day
Exec=/tmp/test-day-welcome
Icon=/usr/share/icons/Fedora/256x256/places/start-here.png
Type=Application
StartupNotify=true
NoDisplay=true
X-GNOME-Autostart-enabled=true
FOE
ln -s /usr/share/applications/test-day-welcome.desktop /etc/xdg/autostart/
# Remove anaconda welcome screen (if it exists), it would display instead of ours
rm -f /home/liveuser/.config/autostart/fedora-welcome.desktop

# Change Firefox start page to open Test Day wiki and IRC chat
# (and a few more properties)
mkdir /tmp/firefox
unzip /usr/lib*/firefox/browser/omni.ja -d /tmp/firefox

cat << FOE > /tmp/firefox/chrome/en-US/locale/branding/browserconfig.properties
browser.startup.homepage=https://fedoraproject.org/wiki/Test_Day:Current | http://webchat.freenode.net/?channels=fedora-test-day
FOE

cat << FOE >> /tmp/firefox/defaults/preferences/firefox-branding.js
pref("startup.homepage_welcome_url","");
pref("startup.homepage_override_url","");
pref("browser.rights.3.shown", true);
FOE

# We need to re-zip the whole archive (instead of just updating files), because
# the original archive is "Firefox optimized" and updating doesn't work
# https://bugzilla.mozilla.org/show_bug.cgi?id=605524
OMNIJA=`ls /usr/lib*/firefox/browser/omni.ja`
rm -f $OMNIJA
(cd /tmp/firefox; zip -r -0 $OMNIJA *)
rm -rf /tmp/firefox

# Adjust launchers in dash using a vendor override. (Adding a profile would
# be another way to do this.)
cat << FOE >> /usr/share/glib-2.0/schemas/org.gnome.shell.gschema.override
[org.gnome.shell]
favorite-apps=['test-day-welcome.desktop', 'firefox.desktop', 'nautilus.desktop', 'gnome-terminal.desktop']
FOE

# Disable screen blanking, there's no benefit on a Test Day image and it's irritating
cat << FOE >> /usr/share/glib-2.0/schemas/org.gnome.desktop.session.gschema.override
[org.gnome.desktop.session]
idle-delay=0
FOE

# Rebuild schema cache with any overrides we installed
glib-compile-schemas /usr/share/glib-2.0/schemas/

EOF

%end
