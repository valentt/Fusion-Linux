# Maintained by the Fedora Desktop SIG:
# http://fedoraproject.org/wiki/SIGs/Desktop
# mailto:desktop@lists.fedoraproject.org

%include fusion-live-base.ks

part / --size 4096

%packages
@graphical-internet
@sound-and-video
#@gnome-desktop-classic
@gnome-desktop
@office

# Remove GNOME 3
#-gnome-panel
#-nautilus
#-gnome-terminal
#-gedit
#-control-center
#-control-center-filesystem
#-evolution-data-server
#-file-roller
#-gnome-bluetooth
#-gnome-power-manager
#-libgdata
#-libgweather
#-libgnomekbd

#-nautilus-sendto
#-gnome-bluetooth-libs
#-nautilus-extensions

# install GNOME 2.32
#@gnome-desktop-classic

# FIXME; apparently the glibc maintainers dislike this, but it got put into the
# desktop image at some point.  We won't touch this one for now.
nss-mdns

# This one needs to be kicked out of @base
-smartmontools

%end

%post
cat >> /etc/rc.d/init.d/livesys << EOF
# disable screensaver locking
cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.screensaver.gschema.override << FOE
[org.gnome.desktop.screensaver]
lock-enabled=false
FOE

# disable updates plugin
cat >> /usr/share/glib-2.0/schemas/org.gnome.settings-daemon.plugins.updates.gschema.override << FOE
[org.gnome.settings-daemon.plugins.updates]
active=false
FOE

# make the installer show up
if [ -f /usr/share/applications/liveinst.desktop ]; then
  # Show harddisk install in shell dash
  sed -i -e 's/NoDisplay=true/NoDisplay=false/' /usr/share/applications/liveinst.desktop ""
  # need to move it to anaconda.desktop to make shell happy
  mv /usr/share/applications/liveinst.desktop /usr/share/applications/anaconda.desktop

  cat >> /usr/share/glib-2.0/schemas/org.gnome.shell.gschema.override << FOE
[org.gnome.shell]
favorite-apps=['mozilla-firefox.desktop', 'evolution.desktop', 'empathy.desktop', 'rhythmbox.desktop', 'shotwell.desktop', 'openoffice.org-writer.desktop', 'nautilus.desktop', 'anaconda.desktop']
FOE

  # add installer to user menu
  mkdir -p ~liveuser/.local/share/gnome-shell/extensions/Installer@shell-extensions.fedoraproject.org
  cat >> ~liveuser/.local/share/gnome-shell/extensions/Installer@shell-extensions.fedoraproject.org/metadata.json << FOE
{"shell-version": ["2.91.91"], "uuid": "Installer@shell-extensions.fedoraproject.org", "name": "Installer", "description": "Install OS from user menu"}
FOE

  cat >> ~liveuser/.local/share/gnome-shell/extensions/Installer@shell-extensions.fedoraproject.org/extension.js << FOE
const PopupMenu = imports.ui.popupMenu;
const Shell = imports.gi.Shell;
const Main = imports.ui.main;
const Util = imports.misc.util;

function main() {
    let app = Shell.AppSystem.get_default().get_app('anaconda.desktop');
    let item = new PopupMenu.PopupMenuItem(app.get_name());
    item.connect('activate', function() { app.activate(-1); });

    Main.panel._statusmenu.menu.addMenuItem(item, Main.panel._statusmenu.menu._getMenuItems().length - 1);
}
FOE

fi

# rebuild schema cache with any overrides we installed
glib-compile-schemas /usr/share/glib-2.0/schemas

# set up timed auto-login for after 60 seconds
cat >> /etc/gdm/custom.conf << FOE
[daemon]
AutomaticLoginEnable=True
AutomaticLogin=liveuser
FOE

# Turn off PackageKit-command-not-found while uninstalled
if [ -f /etc/PackageKit/CommandNotFound.conf ]; then
  sed -i -e 's/^SoftwareSourceSearch=true/SoftwareSourceSearch=false/' /etc/PackageKit/CommandNotFound.conf
fi

EOF

%end
