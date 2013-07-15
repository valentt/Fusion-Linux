# fedora-livecd-electronic-lab-de_DE.ks
#
# Maintainer(s):
# - Fabian Affolter <fab a fedoraproject.org>

%include ../fedora-livedvd-electronic-lab.ks

lang de_DE.UTF-8
keyboard de-latin1-nodeadkeys
timezone Europe/Berlin

%packages
@german-support
# exclude input methods
-m17n*
-scim*
%end
