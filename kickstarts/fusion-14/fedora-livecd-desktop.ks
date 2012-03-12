# Maintained by the Fedora Desktop SIG:
# http://fedoraproject.org/wiki/SIGs/Desktop
# mailto:fedora-desktop-list@redhat.com

%include fedora-live-base.ks

%packages
@games
@graphical-internet
@graphics
@sound-and-video
@gnome-desktop
nss-mdns
NetworkManager-vpnc
NetworkManager-openvpn
# we don't include @office so that we don't get OOo.  but some nice bits
abiword
#gnumeric
#planner
#inkscape

# avoid weird case where we pull in more festival stuff than we need
festival
festvox-slt-arctic-hts

# dictionaries are big
-aspell-*
-hunspell-*
-man-pages-*
-words

# save some space
-gnome-user-docs
-gimp-help
-gimp-help-browser
-evolution-help
-gnome-games
-gnome-games-help
totem-gstreamer
-totem-xine
-nss_db
-vino
-isdn4k-utils
-dasher
-evince-dvi
-evince-djvu
# not needed for gnome
-acpid

# these pull in excessive dependencies
-ekiga
-tomboy
-f-spot
%end

%post
cat >> /etc/rc.d/init.d/livesys << EOF
# disable screensaver locking
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /apps/gnome-screensaver/lock_enabled false >/dev/null
# set up timed auto-login for after 60 seconds
cat >> /etc/gdm/custom.conf << FOE
[daemon]
TimedLoginEnable=true
TimedLogin=liveuser
TimedLoginDelay=60
FOE

EOF

%end
