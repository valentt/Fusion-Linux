# fedora-livecd-lxde-de_CH.ks
#
# Description:
# - Swiss German Fedora Live Spin with the light-weight LXDE Desktop Environment
#
# Maintainer(s):
# - Fabian Affolter <fab at fedoraproject.org>

%include ../fedora-livecd-lxde.ks

lang de_DE
keyboard sg-latin1-nodeadkeys
timezone Europe/Zurich

%packages
@german-support

# exclude input methods
-ibus*
-m17n*
-scim*
%end
