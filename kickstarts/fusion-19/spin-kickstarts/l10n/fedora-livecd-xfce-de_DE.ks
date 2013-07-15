# fedora-livecd-xfce-de_DE.ks
#
# Maintainer(s):
# - Fabian Affolter <fab at fedoraproject.org>

%include ../fedora-livecd-xfce.ks

lang de_DE.UTF-8
keyboard de-latin1-nodeadkeys
timezone Europe/Berlin

%packages
@german-support
# exclude input methods
-m17n*
-scim*
%end
