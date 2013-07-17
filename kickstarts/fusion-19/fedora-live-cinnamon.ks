# Maintained by the Fedora Desktop SIG:
# http://fedoraproject.org/wiki/SIGs/Desktop
# mailto:desktop@lists.fedoraproject.org

%include fedora-live-mate-compiz.ks

%packages
@cinnamon
%end

%post

cat >> /etc/rc.d/init.d/livesys << EOF

# Set Cinnamon as default desktop 
cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.session.gschema.override << FOE
[org.gnome.desktop.session]
session-name='cinnamon'
FOE

# Disable fallback message 
cat >> /usr/share/glib-2.0/schemas/org.gnome.SessionManager.gschema.override << FOE
[org.gnome.desktop.SessionManager]
show-fallback-warning=false
FOE

# Always use location in nautilus 
cat >> /usr/share/glib-2.0/schemas/org.gnome.nautilus.preferences.gschema.override << FOE
[org.gnome.nautilus.preferences]
always-use-location-entry=true
FOE

# Show desktop icons 
cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.background.gschema.override << FOE
[org.gnome.desktop.background]
picture-uri='file:///usr/share/backgrounds/gnome/Waves.jpg'
show-desktop-icons=true
FOE

# Set the default icon theme 
cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.interface.gschema.override << FOE
[org.gnome.desktop.interface]
icon-theme='Faenza'
buttons-have-icons=true
enable-animations=true
menus-have-icons=true
FOE

# Set Window theme 
cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.wm.preferences.gschema.override << FOE
[org.gnome.desktop.wm.preferences]
theme='Greybird'
num-workspaces=2
FOE

# Tweak the main menu and enable desktop effects 
cat >> /usr/share/glib-2.0/schemas/org.cinnamon.gschema.override << FOE
[org.cinnamon]
menu-icon='/usr/share/icons/Faenza/apps/16/system-restart.png'
desktop-effects-on-dialogs=true
desktop-effects-close-effect='fade'
desktop-effects-maximize-effect='scale'
desktop-effects-unmaximize-effect='scale'
date-format='DD-MM-YYYY'
panel-launchers=['firefox.desktop', 'mozilla-thunderbird.desktop', 'gnome-terminal.desktop', 'nautilus.desktop']
favorite-apps=['cinnamon-settings.desktop', 'firefox.desktop', 'mozilla-thunderbird.desktop', 'vlc.desktop', 'nautilus.desktop', 'libreoffice4.0-startcenter.desktop']
FOE

# Disable auto-download-updates 
cat >> /usr/share/glib-2.0/schemas/org.gnome.settings-daemon.plugins.updates.gschema.override << FOE
[org.gnome.settings-daemon.plugins.updates]
active=true
auto-download-updates=false
FOE

%end
