# fedora-livecd-kde-de_CH.ks
#
# Maintainer(s):
# - Fabian Affolter <fab at fedoraproject.org>

%include ../fedora-livecd-kde.ks

lang de_DE.UTF-8
keyboard sg-latin1-nodeadkeys
timezone Europe/Zurich

%packages
@german-support
# exclude input methods
-m17n*
-scim*
%end

%post
# set up localized keyboard since it is not used in /etc/X11/xorg.conf anymore and
# KDE don't use /etc/sysconfig/keyboard.
# Replace "sg-latin1-nodeadkeys" with the keyboard layout you have used above
mkdir -p /home/liveuser/.kde/env
echo "system-config-keyboard --noui sg-latin1-nodeadkeys" > /home/liveuser/.kde/env/keyboard.sh
chmod +x /home/liveuser/.kde/env/keyboard.sh
chown -R liveuser:liveuser /home/liveuser/.kde/env/

%end
