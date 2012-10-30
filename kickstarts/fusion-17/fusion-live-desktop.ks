# Maintained by the Fedora Desktop SIG:
# http://fedoraproject.org/wiki/SIGs/Desktop
# mailto:desktop@lists.fedoraproject.org

%include fusion-live-base.ks

part / --size 4096

%packages
@graphical-internet
@sound-and-video
@gnome-desktop
@office

# FIXME; apparently the glibc maintainers dislike this, but it got put into the
# desktop image at some point.  We won't touch this one for now.
nss-mdns

# This one needs to be kicked out of @base
-smartmontools

# The gnome-shell team does not want extensions in the default spin;
# ibus support in gnome-shell will be integrated in GNOME 3.4
-ibus-gnome3

# remove unnecessary packages
-ibus-pinyin* # remove Chinese Pinying input support
-ibus-hangul* # remove Chinese Hangul input support
-ibus-chewing* # 5M
-libpinyin* # remove Chinese Pinyin input support, 32M
-libhangul* #
-anthy* # Japanese input, 26 M
-evolution # thunderbird is much better email client, 45 M
-cjkuni* # Chinese fonts, 20M
-wqy* # Chinese fonts, 16 M
-nhn* # Korean fonts, 12 M

%end

%post
cat >> /etc/rc.d/init.d/livesys << EOF
# disable screensaver locking
cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.screensaver.gschema.override << FOE
[org.gnome.desktop.screensaver]
lock-enabled=false
FOE

# and hide the lock screen option
cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.lockdown.gschema.override << FOE
[org.gnome.desktop.lockdown]
disable-lock-screen=true
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
  cp /usr/share/applications/anaconda.desktop /home/liveuser/Desktop/
  cat >> /usr/share/glib-2.0/schemas/org.gnome.shell.gschema.override << FOE
[org.gnome.shell]
favorite-apps=['firefox.desktop', 'evolution.desktop', 'empathy.desktop', 'rhythmbox.desktop', 'shotwell.desktop', 'openoffice.org-writer.desktop', 'nautilus.desktop', 'anaconda.desktop']
FOE

fi

# rebuild schema cache with any overrides we installed
glib-compile-schemas /usr/share/glib-2.0/schemas

# set up auto-login
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
