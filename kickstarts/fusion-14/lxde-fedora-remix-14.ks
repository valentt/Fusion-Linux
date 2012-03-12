# fedora-livecd-lxde.ks
#
# Description:
# - Fedora Lite Spin with the light-weight LXDE Desktop Environment
#
# Maintainer(s):
# - Christoph Wickert <cwickert AT fedoraproject.org>
# modified for the Fedora 11 remix by 
# - Rahul Sundaram    <sundaram AT fedoraproject.org>

%include fedora-live-base-14.ks

%packages

# LXDE desktop

@lxde-desktop

lxde-common
#lxde-settings-daemon
lxmenu-data
lxpanel
lxsession-lite
openbox
pcmanfm
gpicview
leafpad
lxappearance
#lxinput
lxsession-edit
#lxshortcut
lxtask
lxterminal
obconf
xarchiver
xscreensaver-base
lxlauncher
lxmusic
obmenu
parcellite


## lite applications ##
# internet
firefox
#midori
#kazehakase
sylpheed
#lostirc
pidgin
transmission
gftp
NetworkManager-vpnc
#NetworkManager-openvpn
NetworkManager-gnome
#NetworkManager-pptp

# graphics
epdfview
mtpaint
#cups-pdf

# multimedia
alsa-plugins-pulseaudio
pavucontrol
gxine
quodlibet
lxmusic
asunder


# office #
abiword
gnumeric
# gfa crashes
#gfa
dayplanner

# utils #
galculator
obconf
parcellite
# I'm looking for something smaller than
gnomebaker

# development
#geany

# login manager
#slim
gdm

# More Desktop stuff
@java
setroubleshoot
#nss-mdns
system-config-printer
#gtklp
xscreensaver-base
xdg-user-dirs

gnome-packagekit
PolicyKit-gnome
anaconda
firstboot
smolt-firstboot
-bluez
-system-config-lvm
policycoreutils-gui

# Command line
powertop
wget
yum-presto

# dictionaries are big
-aspell-*
-man-pages-*

# more fun with space saving
-gimp-help


# save some space
-autofs
-nss_db
sendmail
-ssmtp
-acpid

# rebranding

-fedora-release
-fedora-logos
-fedora-release-notes

generic-logos
generic-release
generic-release-notes

%end

%post

sed -i -e 's/Generic/LXDE Fedora Remix/g' /etc/fedora-release /etc/issue

# LXDE and SLiM configuration

# create /etc/sysconfig/desktop (needed for installation)

cat >> /etc/sysconfig/desktop <<EOF
PREFERRED=/usr/bin/startlxde
#DISPLAYMANAGER=/usr/bin/slim-dynwm
EOF

cat >> /etc/rc.d/init.d/livesys << EOF
chown -R liveuser:liveuser /home/liveuser

# set up default login for liveuser
#sed -i 's!#default_user        simone!default_user        liveuser!' /etc/slim.conf

EOF

%end

