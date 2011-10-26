# fedora-livecd-desktop-de_CH.ks
#
# Maintainer(s):
# - Fabian Affolter <fab at fedoraproject.org>

%include ../fedora-livecd-desktop.ks

lang de_DE.UTF-8
keyboard sg-latin1-nodeadkeys
timezone Europe/Zurich

%packages
-gnome-blog
@german-support
# exclude input methods
-m17n*
-scim*
%end

%post
# system-config-keyboard doesn't really work (missing xorg.conf etc)
cat >>/etc/X11/xorg.conf << EOF
Section "InputDevice"
    Identifier "Keyboard0"
    Driver "kbd"
    Option "XkbLayout" "sg-latin1-nodeadkeys"
EndSection
EOF
%end

