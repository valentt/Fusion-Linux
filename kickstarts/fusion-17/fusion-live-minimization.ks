# Common packages removed from comps
# For F14, these removals should be moved to comps itself

%packages

# First, no LibreOffice
-@office
-libreoffice-*
-planner

# small office
abiword
gnumeric

# remove some big packages
-hotot # identica and twitter microbloging client, 1 M, but has big dependency - webkitgtk (36 M) used by gimp and midori
-webkitgtk

# remove unnecessary packages
-ibus-pinyin* # remove Chinese Pinying input support
-ibus-hangul* # remove Chinese Hangul input support
-ibus-chewing* # 5M
-libpinyin* # remove Chinese Pinyin input support, 32M
-libhangul* #
-anthy* # Japanese input, 26 M
-evolution # thunderbird is much better email client, 45 M
-cjkuni* # Chinese fonts, 20M
-wqy* # Chinese fonts, 16 M
-nhn* # Korean fonts, 12 M
-gnome-games # Lame Gnome games, 15M

# Orca, accessibility support, for spins that don't target blind people
-orca # voice reader for bling people, 33 M

# Drop the Java plugin
-icedtea-web
-java-1.7.0-openjdk

# Drop things that pull in perl
-linux-atm

# No printing
-foomatic-db-ppds
-foomatic

# Dictionaries are big
-aspell-*
-hunspell-*
-man-pages*
-words

# Help and art can be big, too
-gnome-user-docs
-evolution-help
-gnome-games-help
-desktop-backgrounds-basic
-*backgrounds-extras

# Legacy cmdline things we don't want
-krb5-auth-dialog
-krb5-workstation
-pam_krb5
-quota
-nano
-minicom
-dos2unix
-finger
-ftp
-jwhois
-mtr
-pinfo
-rsh
-telnet
-nfs-utils
-ypbind
-yp-tools
-rpcbind
-acpid
-ntsysv

# Drop some system-config things
-system-config-boot
-system-config-language
-system-config-network
-system-config-rootpassword
-system-config-services
-policycoreutils-gui

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
