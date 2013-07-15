# fedora-livecd-kde-fr_FR.ks
#
# Description:
# - French Fedora Live Spin with the KDE Desktop Environment
#
# Maintainer(s):
# - Matthieu Saulnier <fantom@fedoraproject.org>

%include ../fedora-livecd-kde.ks

lang fr_FR.UTF-8
keyboard fr-latin9
timezone Europe/Paris

%packages
@french-support
# exclude input methods:
-m17n*
-scim*
-ibus*
-iok
%end

%post
# set up localized keyboard since it is not used in /etc/X11/xorg.conf anymore and
# KDE don't use /etc/sysconfig/keyboard.
# Replace "fr-latin9" with the keyboard layout you have used above
mkdir -p /home/liveuser/.kde/env
echo "system-config-keyboard --noui fr-latin9" > /home/liveuser/.kde/env/keyboard.sh
chmod +x /home/liveuser/.kde/env/keyboard.sh
chown -R liveuser:liveuser /home/liveuser/.kde/env/
%end

