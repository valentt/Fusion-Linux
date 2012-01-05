# fedora-livecd-lxde-de_DE.ks
#
# Description:
# - German Fedora Live Spin with the light-weight LXDE Desktop Environment
#
# Maintainer(s):
# - Christoph Wickert <cwickert@fedoraproject.org>

%include ../fedora-livecd-lxde.ks

lang de_DE.UTF-8
keyboard de-latin1-nodeadkeys
timezone Europe/Berlin

%packages
@german-support

# exclude input methods
-ibus*
-m17n*
-scim*
%end
