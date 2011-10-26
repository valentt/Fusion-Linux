# fedora-livecd-desktop-de_DE.ks
#
# Maintainer(s):
# - Jeroen van Meeuwen <kanarip a fedoraunity.org>

%include ../fedora-livecd-desktop.ks

lang de_DE.UTF-8
keyboard de-latin1-nodeadkeys
timezone Europe/Berlin

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
    Option "XkbLayout" "de-latin1-nodeadkeys"
EndSection
EOF
%end

