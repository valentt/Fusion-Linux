# fedora-livecd-lxde-ru_RU.ks
#
# Description:
# - German Fedora Live Spin with the light-weight LXDE Desktop Environment
#
# Maintainer(s):
# - Sergey Mihailov <sergey.mihailov at gmail.com>

%include ../fedora-livecd-lxde.ks

lang ru_RU.UTF-8
keyboard ru
timezone Europe/Moscow

%packages
@russian-support
hunspell-ru

# exclude input methods
-ibus*
-m17n*
-scim*
%end
