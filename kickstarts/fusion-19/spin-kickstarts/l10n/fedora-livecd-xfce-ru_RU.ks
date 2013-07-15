# fedora-livecd-xfce-ru_RU.ks
#
# Maintainer(s):
# - Sergey Mihailov <sergey.mihailov at gmail.com>

%include ../fedora-livecd-xfce.ks

lang ru_RU.UTF-8
keyboard ru
timezone Europe/Moscow

%packages
@russian-support
hunspell-ru

# exclude input methods
-m17n*
-scim*
%end
