%include ../fedora-livecd-desktop.ks

%packages
gdb
strace
ltrace
libdrm
pidgin
mc
vim
nano
wget
xorg-x11-apps
gtk-recordmydesktop
gconf-editor
gimp
nautilus-open-terminal
abiword
# save some space
-empathy
-gnome-games
-brasero*
-sound-juicer
-gthumb
-gnome-backgrounds
-desktop-backgrounds*
-evolution
-shotwell
-planner
-openoffice*
-java*
# brand as fedora test spin
fedora-logos
-generic-logos
# glib2 is needed to set up favorites
glib2
# zip and unzip are needed to tweak firefox settings
zip
unzip
%end

%post

cat >> /etc/rc.d/init.d/livesys << EOF

# Note the following needs to be done twice, once for the live environment
# to override what live-desktop does (so it executes after it) and a second
# time to make a persistant config, so that tests after install still
# have the settings to faciliate testing.

# Change the favorites using a vendor override. (Adding a profile would
# be another way to do this.)
cat << FOE >> /usr/share/glib-2.0/schemas/org.gnome.shell.gschema.override
[org.gnome.shell]
favorite-apps=['testday-wiki.desktop', 'testday-irc.desktop', 'liveinst.desktop', 'nautilus.desktop', 'gnome-terminal.desktop']
FOE
glib-compile-schemas /usr/share/glib-2.0/schemas/

EOF

# Note the following config setups persist after install. I think this is
# good for qa-testday purposes, but is bad for most other purposes.

# Turn off alternate pages on first firefox use or after updates
unzip /usr/lib/firefox-*/omni.jar defaults/preferences/firefox-branding.js -d /tmp
cat << EOF >> /tmp/defaults/preferences/firefox-branding.js
pref("startup.homepage_welcome_url","");
pref("startup.homepage_override_url","");
EOF

# Set Test_Day:Current as default browser homepage
mkdir -p /tmp/chrome/en-US/locale/branding
cat << EOF > /tmp/chrome/en-US/locale/branding/browserconfig.properties
browser.startup.homepage=https://fedoraproject.org/wiki/Test_Day:Current
EOF

(cd /tmp; zip /usr/lib/firefox-*/omni.jar chrome/en-US/locale/branding/browserconfig.properties defaults/preferences/firefox-branding.js)
rm -rf /tmp/chrome /tmp/defaults

# Create a directory to store global custom favorites
mkdir -p /etc/skel/.local/share/applications

# Create a favorite for the current test day wiki page
cat << EOF > /etc/skel/.local/share/applications/testday-wiki.desktop
[Desktop Entry]
Name=Participate in a Test Day
Type=Application
Exec=firefox "https://fedoraproject.org/wiki/Test_Day:Current"
Icon=firefox
EOF

# Create a favorite for Test Day IRC chat
cat << EOF > /etc/skel/.local/share/applications/testday-irc.desktop
[Desktop Entry]
Name=Connect to a Test Day chat
Type=Application
Exec=firefox "http://webchat.freenode.net/?channels=fedora-test-day"
Icon=firefox
EOF

# Create a favorite for liveinst
cat << EOF > /etc/skel/.local/share/applications/liveinst.desktop
[Desktop Entry]
Name=Install to hard drive
Type=Application
Exec=liveinst
Icon=anaconda
EOF

# Change the favorites using a vendor override. (Adding a profile would
# be another way to do this.)
cat << EOF >> /usr/share/glib-2.0/schemas/org.gnome.shell.gschema.override
[org.gnome.shell]
favorite-apps=['testday-wiki.desktop', 'testday-irc.desktop', 'liveinst.desktop', 'nautilus.desktop', 'gnome-terminal.desktop']
EOF
glib-compile-schemas /usr/share/glib-2.0/schemas/
%end
