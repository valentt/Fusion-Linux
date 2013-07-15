# fedora-livecd-desktop-pt_BR.ks
#
# Maintainer(s):
# - Igor Pires Soares <igor at projetofedora.org>

%include ../fedora-livecd-desktop.ks

lang pt_BR.UTF-8
keyboard br-abnt2
timezone America/Sao_Paulo

%packages
@brazilian-support
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
    Option "XkbLayout" "br-abnt2"
EndSection
EOF
%end
