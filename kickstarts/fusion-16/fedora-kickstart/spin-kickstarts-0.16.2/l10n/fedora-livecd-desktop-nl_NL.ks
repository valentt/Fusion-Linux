# fedora-livecd-desktop-nl_NL.ks
#
# Maintainer(s):
# - Jeroen van Meeuwen <kanarip a fedoraunity.org>

%include ../fedora-livecd-desktop.ks

lang nl_NL.UTF-8
keyboard us
timezone Europe/Amsterdam

%packages
@dutch-support
# exclude input methods
-m17n*
-scim*
%end
