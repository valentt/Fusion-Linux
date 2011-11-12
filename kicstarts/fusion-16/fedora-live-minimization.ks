# remove packages for optimisation

%packages

# remove japanese support, 26 M
-anthy # japanese support, 26 M
-anthy-9100h # japanese support, 26 M
-ibus-anthy
-kasumi

# remove chinese support, 65 M
-ibus-pinyin*
-wqy-zenhei-fonts # chinese fonts, 16 M
-libchewing # input for chinese, 7 M

# non-english fonts that are not needed
-un-core* # korean fonts, 7.4 M
-thai-scalable-fonts-common
-cjkuni-uming-fonts
-un-core-dotum-fonts
-vlgothic-fonts
-wqy-zenhei-fonts

# remove apps and packages that are not needed
-planner # project planning, 6 M
-gnome-pilot
-jomolhari-fonts # tibetan fonts, 2.2 M

# remove lame games and replace them with better ones
-@games
-gnome-games # GNOME games, 15 M

# remove Brasero (12 M)
-brasero # remove duplicate burning app, 10 M
-icedax
-libbeagle
-libburn
-libisofs
-vorbis-tools
-brasero-nautilus

# remove printer profile files, argyllcms and foo2* printer files (67 M)
#-foomatic*
#-foomatic-db*
#-foo2*
#-argyllcms
#-lcms
#-jbigkit-libs

-opencc # chinese support, 9 M
#-gutenprint* # Printing support, 17 M
-libhangul # 6.4 M
-gucharmap # view font characters, 6.6 M
-planner # project planning, 6.5 M
-groff # removes man and less but saves, 9.2 M
-seahorse # key manager, 7.4 M
-totem # remove Totem video player and shotwell, 23 M
#-shotwell # remove Shotwell photo manager, 0 M
-orca* # accessibility support, 40 M
#-totem* # this removes lots of dependencies, but saves lots of space
-vinagre
-evolution*

# save some space
-samba-client
-mpage
-sox
-hplip
-hpijs
-numactl
-isdn4k-utils
-autofs
# smartcards won't really work on the livecd.
-coolkey
-wget

# qlogic firmwares
-ql2100-firmware
-ql2200-firmware
-ql23xx-firmware
-ql2400-firmware

# scanning takes quite a bit of space :/
-xsane
-xsane-gimp
-sane-backends

%end
