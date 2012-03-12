# maintained by Valent Turkovic <valent.turkovic@gmail.com>
# Fusion Linux 14.0 - http://fusionlinux.org
# This remix is not affliated or endorsed by Red Hat
# Create your own remix - http://fedoraproject.org/wiki/How_to_create_and_use_a_Live_CD

%include fusion-linux-15-base.ks

#lang en_US.UTF-8
#keyboard croat
timezone Europe/Zagreb
selinux --enforcing
#selinux --permissive
#part /boot --size 120 --fstype ext4
#part / --size 6000 --fstype btrfs
#part /boot --size=128 --onpart=sda1 --fstype=ext4
#part pv.01 --size=128 --onpart=sda2 --grow
#volgroup VolGroup pv.01
#logvol / --size=128 --vgname=VolGroup --fstype=btrfs --grow --name=root --fsoptions=compress
part / --size 6000 --fstype ext4
bootloader --location=mbr --append="btrfs"
#bootloader --location=mbr --append="btrfs selinux=0"
#bootloader --location=mbr

services --enabled=NetworkManager --disabled=rpcsvcgssd,rpcgssd,rpcidmapd,sshd,network,nfslock,nfs,rpcbind,sendmail

repo --name=fusion --baseurl=http://iso.linux.hr/fusion-linux/fusion-repo/fusion-14/i386/
#repo --name=mintmenu --baseurl=http://download.opensuse.org/repositories/home:/unamanic/Fedora_13/ --exclude=mintmenu-5*,banshee* 
#*#repo --name=mintmenu --baseurl=http://download.opensuse.org/repositories/home:/unamanic/Fedora_14/
repo --name=rpmfusion-free --baseurl=http://download1.rpmfusion.org/free/fedora/development/i386/os/
#*#repo --name=rpmfusion-free-updates --baseurl=http://download1.rpmfusion.org/free/fedora/updates/14/i386
repo --name=rpmfusion-non-free --baseurl=http://download1.rpmfusion.org/nonfree/fedora/development/i386/os/
#*#repo --name=rpmfusion-non-free-updates --baseurl=http://download1.rpmfusion.org/nonfree/fedora/updates/14/i386
repo --name=adobe --baseurl=http://linuxdownload.adobe.com/linux/i386/
#*#repo --name=google --baseurl=http://dl.google.com/linux/rpm/stable/i386
#repo --name=google-chrome --baseurl=http://dl.google.com/linux/chrome/rpm/stable/i386
#repo --name=fedora-chromium --baseurl=http://repos.fedorapeople.org/repos/spot/chromium/fedora-14/i386/
repo --name=skype --baseurl=http://download.skype.com/linux/repos/fedora/updates/i586
#*#repo --name=fedora-firefox4 --baseurl=http://repos.fedorapeople.org/repos/spot/firefox4/fedora-14/i386/
#*#repo --name=fedora-gimp --baseurl=http://repos.fedorapeople.org/repos/luya/gimp/fedora-14/i386/
#*#repo --name=livna --baseurl=http://ftp-stud.fht-esslingen.de/pub/Mirrors/rpm.livna.org/repo/14/i386/
#*#repo --name=playonlinux --baseurl=http://rpm.playonlinux.com/fedora/yum/base
repo --name=dropbox --baseurl=http://linux.dropbox.com/fedora/14/
#*#repo --name=scribus --baseurl=http://download.opensuse.org/repositories/home:/mrdocs/Fedora_14/ --includepkgs=scribus,libpodofo*
#*#repo --name=fuduntu --baseurl=http://www.fuduntu.org/fuduntu/14/STABLE/RPMS/ --includepkgs=openshot,mlt*,photofilmstrip,likewise*,jupiter*,chromium*
#repo --name=local --baseurl=http://127.0.0.1/repo



%packages

# Fusion Linux packages are below

@graphical-internet
@sound-and-video
@gnome-desktop
nss-mdns

# avoid weird case where we pull in more festival stuff than we need
festival
festvox-slt-arctic-hts

# eyecandy
desktop-backgrounds-basic
faenza-fusion-icon-theme # Fusion Linux icon theme
faenza-icon-theme
#echo-icon-theme
# icon-naming-utils # A script to handle icon names in desktop icon themes
# icon-slicer # Utility for icon theme generation

# desktop tools and addons
# avant-window-navigator # great looking navigation panel, 51 M with python dependencies
# awn-extras-applets
gtk-redshift # adjust colour temperature of you screen according to time of day, might help your eyes hurt less if you work at night, 350 kB
ailurus # GNOME tweak app, 5.2 M
hardinfo # GUI hardware and system information utility, 0.4 M
AcetoneISO2 # CD/DVD Image Manipulator, 1.7 M
cheese
alacarte
parcellite # gnome clipboard manager
gnome-do
#*#gnome-shell # GNOME 3.0 preview, 3 M
beesu # start gui apps as root, like gtksu, 30 kB
nautilus-beesu-manager # beesu nautilus manager, 40 kB
gtk-recordmydesktop
control-center-extra
gkrellm
seahorse
gconf-editor
nautilus-image-converter
nautilus-actions
nautilus-open-terminal
nautilus-sendto
nautilus-dropbox
irssi # command line IRC chat client used for Get Live Help, 2.3 M
xchat # gui IRC chat client
# pidgin # instant messaging and chat client # 1.5 M
#-empathy # instant messaging and voice client # 49 M

# xscreensaver and other fabulous screensavers (23 M)
xscreensaver
xscreensaver-gl*
xscreensaver-extras*
tempest-gnome-screensaver
tempest-xscreensaver
rss-glx
rss-glx-xscreensaver
rss-glx-gnome-screensaver


# gnome themes
gtk-murrine-engine

#fusion linux repo
#*#mintmenu
#*#dockbarx
#*#fedoraplus
xterm
#*#fusion-linux-14 # package with setting for look & feel of Fusion GNOME desktop
teamviewer6 # best remote desktop for Linux and other platforms, 84 M

@office

# LibreOffice 3.3
#*#libreoffice3-en-GB
#*#libreoffice3-writer
#*#libreoffice3-calc
#*#libreoffice3-draw
#*#libreoffice3-math
#*#libreoffice3-impress
#*#libreoffice3.3-redhat-menus
#*#libobasis3.3-extension-presenter-screen
#*#libobasis3.3-gnome-integration

# p2p apps
amule
transmission # fabulos and lightweight bittorrent client
#deluge
#azureus

# codecs
gstreamer-plugins-ugly
gstreamer-ffmpeg
gstreamer-plugins-bad
#gstreamer-plugins-bad-extras

# audio apps
audacious # best simple audio and mp3 player
audacious-plugins-freeworld* # audacious with plugins 6.3 M
audacity-freeworld
banshee
-rhythmbox # audio player, 11 M
#*#picard-freeworld # Audio tagging application using data from the MusicBrainz database, 3.3 M
# hydrogen # advanced drum machine for Linux, has java-1.5.0 as dependency (48 M), 9.5 M
# hydrogen-drumkits # additional drum kit sounds for hydrogen, 20 M

# video media players
vlc
Miro
#gnome-mplayer
-totem # Totem is replaced with vlc, 8.4 M
#*#gecko-mediaplayer
#gxine
#xine-lib-extras-nonfree

# video editing apps
#*#avidemux # video editing app, 25 M
#*#HandBrake-gui # great DVD transcoding app
#*#pitivi
#k9copy # k9 uses kdelibs as dependency :(, 14 M

# KDE apps
#*#kdelibs # base for other KDE apps 63 M
#*#k3b-extras-freeworld # best CD/DVD/Blu-ray burning app for Linux, 55 M ( + kdelibs + deps 117 M)
#*#krusader # best file manager, similar to windows commander but more powerful 22 M
#*#kdeutils # filelight is obsoleted by kdeutils, filelight visualizes diskspace usage
#*#kdeedu-marble # Marble is desktop atlas and globe 22 M

# education
#*#stellarium # Photo-realistic planetarium 40 M

# desktop apps
# geany # advanced IDE and text editor, 2.3 M
# pyroom # fullscreen uncluterred text editor for better productivity, 5.5 M
gnome-translate # translation tool, 1.2 M
#gwibber # best GNOME twitter and identica client, 9.3 M
qwit # best GNOME twitter and identica client, 3 M
giver # easy local file sharing, 0.3 M


# graphics and photo apps

gimp # most powerful open source image editor 50 M
# additional GIMP plugins 14 M
gimp-data-extras
gimp-fourier-plugin
gimpfx-foundry
gimp-resynthesizer
gimp-lqr-plugin
GREYCstoration-gimp
ufraw-gimp

viewnior # better image viewer than Eye Of Gnome with crop with same slick interface, 450 k
-eog # Eye Of Gnome is replaced with Viewnior, 5 M
shutter # great screen capture app, a bit big, 31 M
f-spot # 9 M
scribus # 43 M
inkscape # 36.6 M
# inkscape-docs # examples and demos, 37 M
mypaint # MyPaint is a fast and easy open-source graphics application for digital painters, 7.3 M
xournal # application for notetaking, sketching, keeping a journal using a stylus, 0.6 M
bitstream-vera-sans-fonts
blender # 3D modeling, visualization and animation, 24 M
fotowall
photoprint
posterazor
jhead
qiv
#hugin # Photo panorama application, 49 M
#kipi-plugins
-shotwell

# video tools
#*#ffmpeg
#*#ffmpeg2theora
#*#mencoder
# Arista encoder dependencies, 350 k
#*#gstreamer-plugins-bad-nonfree
#*#gnome-python2-rsvg
#*#nautilus-python
#*#python-gudev

# misc terminal apps and tools
lxrandr # monitor configuration tool, 130 k
gparted # partition management tool, 3.4 M
#*#accountsdialog
btrfs-progs
mc # best console file management app, 5 M - 45 M with perl depencency
nano # simple cli text editor
wget
netactview # Network connections viewer similar in functionality with netstat
livecd-tools
liveusb-creator
sshfs
powertop
conky
ntfs-config # GUI for easy NTFS mounting and configuration, 500 kB
htop
atop
testdisk
p7zip-plugins
mutt
screen
rdesktop # 150 kB
fslint
fortune-mod # wise and funny quotes
fortune-firefly
yum-plugin-remove-with-leaves # yum plugin that removes unused dependencies also 
b43-fwcutter
fedora-ksplice # ksplice utility enables you have kernel updates without reboot
cnetworkmanager # Command Line Interface for NetworkManager
wxPython # wxPython for autoten
xorg-x11-apps # xkill app for killing unresponsive apps
#*#wine # 83 M
#*#playonlinux # Run your Windows applications on Linux easily 6 M
# vim-enhanced # vi is enough for most people, 26M - 65 M with perl dependency
#*#akmod-wl # driver for broadcom wireless cards
#*#unrar

# minimal development package, 34 M
make
binutils
gcc
glibc-devel
glibc-headers
libgomp
patch
kernel-headers
kernel-devel

# remove Java 1.6 (85 M)
#-java-1.6.0-openjdk
#-jline
#-rhino
#-tzdata-java

# remove Java 1.5 (48 M)
-@java-1.5.0
-libgcj

# remove Brasero (12 M)
-brasero # remove duplicate burning app, 10 M
-icedax
-libbeagle
-libburn
-libisofs
-vorbis-tools
-brasero-nautilus

# remove selinux (22 M)
#-audit
#-setools-libs
#-setroubleshoot-server
#-selinux-policy
#-gtkhtml2
#-libsemanage-python

# remove apps and packages that are not needed
-planner # project planning, 6 M
-gnome-pilot
-jomolhari-fonts # tibetan fonts, 2.2 M

# remove printer profile files, argyllcms and foo2* printer files (67 M)
-foomatic*
-foomatic-db*
#*#-foo2*
-argyllcms
-lcms
#*#-jbigkit-libs

# remove lame games and replace them with better ones
-@games
-gnome-games

# remove japanese support, 26 M
-anthy
-ibus-anthy
-kasumi

# remove chinese support, 65 M
-ibus-pinyin*
tomboy
-gnote # note taking, tomboy clone done in C, 6 M

# rebranding
-fedora-release*
-fedora-release-notes*
#fusion-logos
#fusion-linux-logos
#fusion-linux-release
#fusion-linux-release-notes
#fedora-logos
generic-release
generic-logos
generic-release-notes

# rpmfusion release packages
rpmfusion-free-release
rpmfusion-nonfree-release

# adobe-release for flash although we don't install flash by default
adobe-release

# rpmfusion status of this package is unclear
# only livna has it now
#*#libdvdcss




# use the PackageKit helper for bash
PackageKit-command-not-found

# Compiz-Fusion for Gnome
ccsm
compiz
compiz-bcop
compiz-plugins-main
compiz-fusion-extras
#*#compiz-fusion-extras-gnome
compiz-plugins-main-gconf
compiz-gnome
compizconfig-backend-gconf
compizconfig-python
emerald
emerald-themes
fusion-icon-gtk
libcompizconfig

# internet apps
firefox
#firefox4
pan
#chromium
#google-chrome-stable
#*#chromium-browser
thunderbird
#midori
#epiphany
#evolution-mapi
-evolution*

# wireless tools
aircrack-ng
airsnort
kismet
macchanger

# geospatial and gps tools
gpsd
# merkaartor # OpenStreetMap editor, 65 M
#geoclue-gpsd
#gpsd-clients
#tangogps # has gpscorrelate as a dependency?!?
#gpsbabel
#gpx-viewer
#gpsdrive
#gpsman
#gypsy
#perl-GPS
#qlandkarte
#qgis
#viking

# games, cool small ones
abe
blobwars
frozen-bubble
alienblaster
foobillard
chromium-bsu
teeworlds # fast paced 2D multiplayer platform shoot'em up, 5/5, 7.2 M
glaxium # arcade game where you get to control a spaceship and destroy enemies, 2.2 M
CriticalMass # 2D space shoot'em up game, Galaga clone
Maelstrom
KoboDeluxe
numptyphysics # A crayon-drawing based physics puzzle game, 5/5, 0.7 M
freeciv # Civilization clone, 4/5, 24 M
# PySolFC # collection of more that 1000 solitaire card games, has java-1.5.0 as dependency (48 M), 13 M
# hedgewars # worms clone, 5/5, 83 M
# wormux # cartoon character worms clone, 4/5, 102 M
# openlierox # real time worms/teeworlds shoot'em up clone, 4/5, 73 M
# pingus # lemmings clone, 
# scorched3d # 3D scorched earth clone, 3/5, 138 M
# neverball # 3D arcade ball maze game, 181 M
# worminator # 2D platform arcade shoot'em up, 2/5, 211 M (21 M + 190 M - fluid-soundfont-*)
# Ri-li # drive wooden trains, great looking snake clone, 4/5, 134 M
# freecol # Colonization clone, 3/5, 23 M

# premium games (big ones)

# First Person Shooters
# urbanterror # military first person 3D shooter, 5/5, 1 M + 717 M
# sauerbraten # Cube 2, only in Russian Fedora repos, 4/5, 503 M
# nexuiz # first person 3D shooter, 853 M
# tremulous # first person multiplayer aliens VS humans 3D shooter, 4/5, 100 M
# alienarena # first person 3D shooter, 852 M
# openarena # first person 3D shooter, 
# worldofpadman # cartoon character first person 3D shooter - multiplayer only, 5/5, 3 M + 605 M

# RPG and real-time strategy games
# glest # 3D real time strategy in medieval Europe, 4/5, 107 M
# warzone2100 # 3D futuristic real time strategy, 5/5, 74 M
# boswars
# wesnoth
# widelands # RTS strategy game, 3/5, 91 M
# ufoai
# spring # 3D real-time engine and game installer, complicated setup - 2/5, 59 M

# Car driving
# vdrift # Driving, drifting racing simulation, 521 M
# maniadrive
# torcs # car racing simulator, 3/5, 314 M
# trophy #
# ultimatestunts, 3D racing game, remake od old dos game, 3/5, 22 M

# vegastrike # 3D space action RPG space sim, trading and bounty hunting. Elite and Privateer clone, 739 M


@croatian-support # this distro has english and croatian support by default

# proprietary bits
flash-plugin	
# skype # removed for distrubution and legal reasons. 
# picasa # great photo management app, but crashes alot!, 82 M
# google-chrome-unstable


# things we don't need here

-libchewing

# dictionaries are big
-aspell-*
-hunspell-*
-man-pages*
-words

# save some space
-gnome-user-docs # 35 M
-evolution-help
-gnome-games-help
-nss_db
-isdn4k-utils

# non-english fonts that are not needed
-thai-scalable-fonts-common
-cjkuni-uming-fonts
-un-core-dotum-fonts
-vlgothic-fonts
-wqy-zenhei-fonts


#-gthumb
-dasher
-krb5-auth-dialog
-krb5-workstation
-pam_krb5
-quota
-acpid
-minicom
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

# drop some system-config things
-system-config-boot
-system-config-language
-system-config-lvm
-system-config-network
-system-config-rootpassword
system-config-services
policycoreutils-gui


%end



%post

echo "begin post"

# rebranding, already done via fusion-release rpm package so this is deprecated
#sed -i -e 's/Generic/Fusion Linux/g' /etc/fedora-release /etc/issue /etc/issue.net
#sed -i -e 's/Fedora/Fusion Linux/g' /etc/fedora-release /etc/issue /etc/issue.net
#sed -i -e 's/Laughlin/Thorium/g' /etc/fedora-release /etc/issue /etc/issue.net

cat >> /etc/rc.d/init.d/livesys << EOF
# disable screensaver locking
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /apps/gnome-screensaver/lock_enabled false >/dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /desktop/gnome/lockdown/disable_lock_screen true >/dev/null

# set up timed auto-login for after 15 seconds
cat >> /etc/gdm/custom.conf << FOE
[daemon]
TimedLoginEnable=true
TimedLogin=liveuser
TimedLoginDelay=15
FOE

# Show harddisk install on the desktop
sed -i -e 's/NoDisplay=true/NoDisplay=false/' /usr/share/applications/liveinst.desktop
mkdir /home/liveuser/Desktop
cp /usr/share/applications/liveinst.desktop /home/liveuser/Desktop
chown -R liveuser.liveuser /home/liveuser/Desktop
chmod a+x /home/liveuser/Desktop/liveinst.desktop

# But not trash and home
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /apps/nautilus/desktop/trash_icon_visible false >/dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /apps/nautilus/desktop/home_icon_visible false >/dev/null

# Turn off PackageKit-command-not-found while uninstalled
sed -i -e 's/^SoftwareSourceSearch=true/SoftwareSourceSearch=false/' /etc/PackageKit/CommandNotFound.conf

# Setup mintMenu and single GNOME panel with DockbarX
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --load /usr/share/fusion-linux/gconf2/mintMenu.xml
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --load /usr/share/fusion-linux/gconf2/dockbarx.xml
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --load /usr/share/fusion-linux/gconf2/one-panel-settings-dockbarx.xml
#gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --load /usr/share/fusion-linux/gconf2/one-panel-settings.xml

# Some sane desktop defaults
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /desktop/gnome/peripherals/touchpad/tap_to_click true > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /desktop/gnome/peripherals/touchpad/disable_while_typing true > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /apps/nautilus/preferences/always_use_browser true > /dev/null

rm /home/liveuser/.config/autostart/fusion-welcome-firstrun.desktop

EOF

# Setup mintMenu and single GNOME panel with DockbarX
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --load /usr/share/fusion-linux/gconf2/mintMenu.xml
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --load /usr/share/fusion-linux/gconf2/dockbarx.xml
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --load /usr/share/fusion-linux/gconf2/one-panel-settings-dockbarx.xml
#gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --load /usr/share/fusion-linux/gconf2/one-panel-settings.xml

# Some sane desktop defaults
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /desktop/gnome/peripherals/touchpad/tap_to_click true > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /desktop/gnome/peripherals/touchpad/disable_while_typing true > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /apps/nautilus/preferences/always_use_browser true > /dev/null

# Gedit with 10 recent files
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t int /apps/gedit-2/preferences/ui/recents/max_recents 10 > /dev/null

# Gnome-Do quiet start
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /apps/gnome-do/preferences/Do/CorePreferences/QuietStart true > /dev/null

# Enable Compiz
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /apps/gdm/simple-greeter/wm_use_compiz true > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t string /desktop/gnome/session/required_components/windowmanager compiz-gtk > /dev/null

# Make Faenza icons default one
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t string /desktop/gnome/interface/icon_theme Faenza-Fusion > /dev/null

# Make Alliance default GNOME theme
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t string /desktop/gnome/interface/gtk_theme Alliance-fusion-fancy > /dev/null

# Metacity windows border theme
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t string /apps/metacity/general/theme Alliance-fusion-fancy > /dev/null

# make Chromium default browser
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t string /desktop/gnome/applications/browser/exec /usr/bin/chromium-browser > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t string /desktop/gnome/url-handlers/unknown/command "/usr/bin/chromium-browser %s" > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t string /desktop/gnome/url-handlers/http/command "/usr/bin/chromium-browser %s" > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t string /desktop/gnome/url-handlers/https/command "/usr/bin/chromium-browser %s" > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t string /desktop/gnome/url-handlers/about/command "/usr/bin/chromium-browser %s" > /dev/null

# setup GNOME applets
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --set /apps/panel/default_setup/general/applet_id_list -t list --list-type=string "[mintmenu,show_desktop,dockbarx,clock,systray,workspace_switcher]"
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --set /apps/panel/general/applet_id_list -t list --list-type=string "[mintmenu,show_desktop,dockbarx,clock,systray,workspace_switcher]"

# Shutter as default screenshot app
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --set -t string /apps/metacity/keybinding_commands/command_screenshot "shutter --full" > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --set -t string /apps/metacity/keybinding_commands/command_window_screenshot "shutter --window" > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --set -t string /apps/compiz/plugins/gnomecompat/allscreens/options/command_screenshot "shutter --full" > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --set -t string /apps/compiz/plugins/gnomecompat/allscreens/options/command_window_screenshot "shutter --window" > /dev/null

# GNOME weather m/s for wind speed and C for temperature
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --set -t string /apps/panel/applets/clock/prefs/speed_unit m/s > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --set -t string /apps/panel/applets/clock/prefs/temperature_unit C > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --set /apps/panel/applets/clock/prefs/cities -t list --list-type=string "[<location name="" city="Osijek" timezone="Europe/Zagreb" latitude="45.450001" longitude="18.799999" code="LDOS" current="true"/>]" > /dev/null

# Fusion Wallpaper
# gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t string /desktop/gnome/background/picture_filename /usr/share/backgrounds/fusion-linux/fusion-linux.xml > /dev/null

# Compiz Fusion + Cube, Wobbly and Expo plugins
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults --set /apps/compiz/general/allscreens/options/active_plugins -t list --list-type=string "[core,video,glib,dbus,clone,resize,decoration,wobbly,screenshot,mousepoll,place,gnomecompat,svg,png,minimize,cube,rotate,zoom,obs,fade,move,expo,scale,ezoom,switcher]"

#fix mintMenu small icons bug
#gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t int /apps/mintMenu/plugins/applications/favicon_size 32 > /dev/null
#gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t int /apps/mintMenu/plugins/applications/icon_size 16 > /dev/null
#gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t int /apps/mintMenu/plugins/system-management/icon_size 22 > /dev/null
#gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t int /apps/mintMenu/plugins/applications/icon_size 22 > /dev/null

# tweak bash terminal and add fortune
cat >> /etc/skel/.bashrc << EOF

PS1='\[\033[01;34m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W]\[\033[00m\]\\$ '
fortune
EOF

# Viewnor default preferences
mkdir -p /etc/skel/.config/viewnior
cat >> /etc/skel/.config/viewnior/viewnior.conf << EOF
[prefs]
zoom-mode=0
fit-on-fullscreen=true
show-hidden=false
smooth-images=true
confirm-delete=true
reload-on-save=false
show-toolbar=true
slideshow-timeout=5
behavior-wheel=0
behavior-click=1
behavior-modify=0
jpeg-quality=90
png-compression=9
EOF

# Put Autoten icon on desktop
#mkdir -p /etc/skel/Desktop
#cp /usr/share/applications/autoten.desktop /etc/skel/Desktop/

# Put Dropbox icon on Desktop
#cp /usr/share/applications/dropbox.desktop /etc/skel/Desktop/

# Setup default mintMenu application list
mkdir -p /etc/skel/.linuxmint/mintMenu/
cp /usr/share/fusion-linux/mintMenu/applications.list /etc/skel/.linuxmint/mintMenu/

# Add Scribus to GNOME application menu list (bug)
cp /usr/share/mimelnk/application/vnd.scribus.desktop /usr/share/applications/scribus.desktop

# Autostart Redshift
#cp /usr/share/applications/gtk-redshift.desktop /etc/skel/.config/autostart/

# tweak swappiness
echo "" >>/etc/sysctl.conf
echo "vm.swappiness=10" >>/etc/sysctl.conf
echo "vm.vfs_cache_pressure = 50" >>/etc/sysctl.conf


%end

%post --nochroot

echo "begin nochroot"

#
# http://www.redhat.com/docs/manuals/linux/RHL-9-Manual/custom-guide/s1-kickstart2-postinstallconfig.html
# --nochroot Allows you to specify commands that you would like to run outside of the chroot environment.
#

# Define variables where config files are located ($LIVE_ROOT) 
# and which directory is used for building iso ($INSTALL_ROOT)
LIVE_ROOT="/home/fusion-linux/"
cd /home/fusion-linux/temp/imgcreate-*
cd install_root
INSTALL_ROOT=$(pwd)
echo $INSTALL_ROOT


# Demo video and audio files
#echo "Examples creation folder"
#cd "$LIVE_ROOT"
#mkdir -p Examples/Videos
#cd Examples/Videos
#pwd
#echo "Examples files download"
#wget http://fedoraproject.org/w/uploads/e/e4/Fedora_11_Overview_-_Jesse_Keating.ogg
##wget http://fedoraproject.org/w/uploads/8/83/Fedora_11_Overview_-_Spot_Callaway.ogg
##wget http://wonderer.fedorapeople.org/Interview_cwickert_24_Apr_2009.ogg
##wget http://mspevack.fedorapeople.org/glezos-diegobz-20090403.ogg
##wget http://fedoraproject.org/w/uploads/a/a9/Presto_-_Jon_Dieter.ogg
#cd ..
#mkdir Remix
#cd Remix
#wget http://www.montanalinux.org/files/newvideos/fedora-10-remix.ogv
#cd ..
#mkdir Videos
#cd Videos
##wget http://www.redhat.com/v/magazine/ogg/FUDCon11Recap.ogg
#wget http://www.redhat.com/v/ogg/TruthHappensRmx.ogg
#youtube-dl http://www.youtube.com/watch?v=SJaTA25tpMg && mv SJaTA25tpMg.mp4 Compiz\ Fusion\ Tutorial.mp4
#youtube-dl http://www.youtube.com/watch?v=Pa1RCg-Ccp0 && mv Pa1RCg-Ccp0.flv Linux_MAC_PC.flv
#youtube-dl http://www.youtube.com/watch?v=zij7MuY29Ww && mv zij7MuY29Ww.flv GNOME-Do.flv
#cd "$LIVE_ROOT"
#echo "Example creation folder end"


# Make Multimedia Examples folder show on desktop
echo "Make Multimedia Examples folder show on desktop"
cd "$LIVE_ROOT"
mkdir -p "$INSTALL_ROOT/etc/skel/Desktop/"
ls -al "$INSTALL_ROOT/etc/skel" # remove after testing
cp -fR Examples/ "$INSTALL_ROOT/etc/skel/Desktop/" # copy sub directories and all files
#cp "$LIVE_ROOT/Examples/" "$INSTALL_ROOT/etc/skel/Desktop/" -R
echo "Make Multimedia Examples folder show on desktop end"


# Download and install latest Broadom b43 driver into /lib/firmware/b43
echo "Download and install latest Broadom b43 driver"
cd "$LIVE_ROOT"
#wgect http://downloads.openwrt.org/sources/broadcom-wl-4.80.53.0.tar.bz2
#mkdir "$INSTALL_ROOT/extra/broadcom-firmware" -p
#cd "$INSTALL_ROOT/extra/broadcom-firmware"
if [ ! -f broadcom-wl-4.150.10.5.tar.bz2 ] # if file already exists no need to download it again
then
echo "no file present, downloading broadcom firmware"
wget http://mirror2.openwrt.org/sources/broadcom-wl-4.150.10.5.tar.bz2
fi
tar xjf broadcom-wl-4.150.10.5.tar.bz2
cd broadcom-wl-4.150.10.5/driver
#b43-fwcutter -w /lib/firmware/ wl_apsta_mimo.o
b43-fwcutter -w "$INSTALL_ROOT/lib/firmware/" wl_apsta_mimo.o
cd "$LIVE_ROOT"
echo "Download and install latest Broadom b43 driver end"


# Download and install Alliance theme
cd "$LIVE_ROOT"
if [ ! -f Alliance-fusion-fancy.tar.gz ] # if file already exists no need to download it again
then
echo "no file present, downloading Alliance fancy theme"
wget http://iso.linux.hr/fusion-linux/fusion-repo/fusion-14/extra/Alliance-fusion-fancy.tar.gz
fi
tar xvzf Alliance-fusion-fancy.tar.gz
mv Alliance-fusion-fancy/ "$INSTALL_ROOT/usr/share/themes/"

if [ ! -f Alliance-fusion-regular.tar.gz ] # if file already exists no need to download it again
then
echo "no file present, downloading Alliance regular theme"
wget http://iso.linux.hr/fusion-linux/fusion-repo/fusion-14/extra/Alliance-fusion-regular.tar.gz
fi
tar xvzf Alliance-fusion-regular.tar.gz
mv Alliance-fusion-regular/ "$INSTALL_ROOT/usr/share/themes/"


# Download and Install Arista Transcoder, 7 M
cd "$LIVE_ROOT"
if [ ! -f arista-0.9.6.tar.gz ] # if file already exists no need to download it again
then
echo "no file present, downloading Arista Transcoder"
wget http://programmer-art.org/media/releases/arista-transcoder/arista-0.9.6.tar.gz
fi
tar xvzf arista-0.9.6.tar.gz
cd arista-0.9.6
python setup.py install --root $INSTALL_ROOT
cd "$LIVE_ROOT"

# Fixes for arista bugs
# sed -i -e 's/\/home\/fusion-linux\/arista-0.9.6/\/usr\/bin\/python/g' "$INSTALL_ROOT/usr/bin/arista-gtk" "$INSTALL_ROOT/usr/bin/arista-transcode"
mv "$INSTALL_ROOT/usr/lib/python2.6/site-packages/arista"  "$INSTALL_ROOT/usr/lib/python2.7/site-packages/"


# compiz-check script
echo "compiz check script"
if [ ! -f compiz-check ] # if file already exists no need to download it again
then
echo "no file present, downloading compiz-check"
wget http://blogage.de/files/9124/download -O compiz-check
chmod +x compiz-check
fi
cp compiz-check "$INSTALL_ROOT/usr/local/bin"

# compiz fusion-icon script
#echo "compiz-start script"
#cat >> compiz-start.sh << EOF
#!/bin/bash
#sleep 6  #you can alter the amount of time here
#exec fusion-icon
#EOF
#chmod +x compiz-start.sh
#mkdir -p "$INSTALL_ROOT/etc/skel/.config/autostart/"
#mv compiz-start.sh "$INSTALL_ROOT/etc/skel/.config/autostart/"

# New release notes
cp -f Examples/Fusion-Linux-14-Release-Notes.txt "$INSTALL_ROOT/usr/share/fusion-linux/"


date
echo "end"
%end
