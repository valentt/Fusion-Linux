# fedora-design-suite.ks
#
# Description:
# - A Spin targeted towards professional designers
#
# Maintainer:
# - Sebastian Dziallas <sdz AT fedoraproject DOT org>

%include fedora-live-mini.ks

%packages

# gnome desktop
gdm
gnome-python2-gconf
gnome-desktop
gnome-panel
gnome-session
gnome-terminal
metacity
nautilus

# graphics
agave
blender
cinepaint
entangle
fontforge
fontmatrix
# fyre
gimp
gimp-*-plugin
GREYCstoration-gimp 
# hugin
inkscape
mypaint
nautilus-image-converter
optipng
# pinta
# postr
rawtherapee
scribus
shotwell
synfigstudio
ufraw
xournal

# office
abiword
dia
evince
gnote
gnumeric
hamster-applet
# pdfmod

# internet
empathy
evolution
firefox

# audio & video
jokosher
pitivi
rhythmbox
totem

# system
gedit
gnome-utils
gtk-recordmydesktop
NetworkManager-gnome

%end

%post
cat >> /etc/rc.d/init.d/livesys << EOF
# disable screensaver locking
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /apps/gnome-screensaver/lock_enabled false >/dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /desktop/gnome/lockdown/disable_lock_screen true >/dev/null

# set up timed auto-login for after 60 seconds
cat >> /etc/gdm/custom.conf << FOE
[daemon]
TimedLoginEnable=true
TimedLogin=liveuser
TimedLoginDelay=60
FOE

# Show harddisk install on the desktop
sed -i -e 's/NoDisplay=true/NoDisplay=false/' /usr/share/applications/liveinst.desktop
mkdir /home/liveuser/Desktop
cp /usr/share/applications/liveinst.desktop /home/liveuser/Desktop
chown -R liveuser.liveuser /home/liveuser/Desktop
chmod a+x /home/liveuser/Desktop/liveinst.desktop

# But not trash and home
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /apps/nautilus/desktop/trash_icon_visible false >/dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /apps/nautilus/desktop/home_icon_visible false >/dev/null

# Turn off PackageKit-command-not-found while uninstalled
sed -i -e 's/^SoftwareSourceSearch=true/SoftwareSourceSearch=false/' /etc/PackageKit/CommandNotFound.conf

# Add link to the Inkscape Course
cat >> /home/liveuser/Desktop/inkscape-course.desktop << FOE
#!/usr/bin/env xdg-open
[Desktop Entry]
Name=Introduction To Inkscape
GenericName=Inkscape Course
Comment=Materials from Máirín Duffy's Inkscape Class
Exec=/usr/bin/firefox http://linuxgrrl.com/learn/Introduction_To_Inkscape
Type=Application
Icon=fedora-logo-icon
FOE
chmod a+x /home/liveuser/Desktop/inkscape-course.desktop

EOF

%end
