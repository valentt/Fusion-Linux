# fedora-livecd-kde-de_DE.ks
#
# Maintainer(s):
# - Sebastian Vahl <fedora@deadbabylon.de>

%include ../fedora-livecd-kde.ks

lang de_DE.UTF-8
keyboard de-latin1-nodeadkeys
timezone Europe/Berlin

%packages
@german-support

# don't install unnecessary input methods
-scim*
-m17n*
-iok

# don't install unnecessary fonts
-abyssinica-fonts
-cjkuni*fonts*
-jomolhari*fonts*
-kacst*fonts*
-khmeros*fonts*
-lklug*fonts*
-lohit*fonts*
-padauk*fonts*
-paktype*fonts*
-smc*fonts*
-stix*fonts*
-thai*fonts*
-un-core-fonts-dotum
-vlgothic*fonts*

# remove some packages to free needed space
-kdeartwork*
-kftpgrabber
-kdeplasma-addons

%end
