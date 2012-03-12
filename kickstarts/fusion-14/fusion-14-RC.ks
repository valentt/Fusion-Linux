# maintained by Valent Turkovic <valent.turkovic@gmail.com>
# Fusion Linux 14.0 - http://fusionlinux.org
# This remix is not affliated or endorsed by Red Hat
# Create your own remix - http://fedoraproject.org/wiki/How_to_create_and_use_a_Live_CD

%include fusion-14-base.ks

#lang en_US.UTF-8
#keyboard croat
#timezone Europe/Zagreb
#part /boot --size 120 --fstype ext4
#part / --size 6000 --fstype btrfs
#part /boot --size=128 --onpart=sda1 --fstype=ext4
#part pv.01 --size=128 --onpart=sda2 --grow
#volgroup VolGroup pv.01
#logvol / --size=128 --vgname=VolGroup --fstype=btrfs --grow --name=root --fsoptions=compress
#bootloader --location=mbr --append="btrfs"
part / --size 6000 --fstype ext4
bootloader --location=mbr

services --enabled=NetworkManager --disabled=rpcsvcgssd,rpcgssd,rpcidmapd,sshd,network,nfslock,nfs,rpcbind,sendmail

repo --name=fusion --baseurl=http://iso.linux.hr/fusion-linux/fusion-repo/fusion-14/i386/
repo --name=mintmenu --baseurl=http://download.opensuse.org/repositories/home:/unamanic/Fedora_13/ --exclude=mintmenu-5*,banshee* 
repo --name=rpmfusion-free --baseurl=http://download1.rpmfusion.org/free/fedora/releases/14/Everything/i386/os
repo --name=rpmfusion-free-updates --baseurl=http://download1.rpmfusion.org/free/fedora/updates/14/i386
repo --name=rpmfusion-non-free --baseurl=http://download1.rpmfusion.org/nonfree/fedora/releases/14/Everything/i386/os
repo --name=rpmfusion-non-free-updates --baseurl=http://download1.rpmfusion.org/nonfree/fedora/updates/14/i386
repo --name=adobe --baseurl=http://linuxdownload.adobe.com/linux/i386/
repo --name=google --baseurl=http://dl.google.com/linux/rpm/stable/i386
repo --name=skype --baseurl=http://download.skype.com/linux/repos/fedora/updates/i586
repo --name=fedora-chromium --baseurl=http://repos.fedorapeople.org/repos/spot/chromium/fedora-14/i386/
repo --name=fedora-firefox4 --baseurl=http://repos.fedorapeople.org/repos/spot/firefox4/fedora-14/i386/
repo --name=fedora-gimp --baseurl=http://repos.fedorapeople.org/repos/luya/gimp/fedora-14/i386/
repo --name=livna --baseurl=http://ftp-stud.fht-esslingen.de/pub/Mirrors/rpm.livna.org/repo/14/i386/
repo --name=playonlinux --baseurl=http://rpm.playonlinux.com/fedora/yum/base
repo --name=dropbox --baseurl=http://linux.dropbox.com/fedora/13/
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
faenza-fusion-icon-theme
faenza-icon-theme
#echo-icon-theme
# icon-naming-utils # A script to handle icon names in desktop icon themes
# icon-slicer # Utility for icon theme generation

# desktop tools and addons
avant-window-navigator # great looking navigation panel, 51 M with python dependencies
awn-extras-applets
hardinfo # GUI hardware information utility, 0.3 M
cheese
alacarte
parcellite
gnome-do
gnome-shell # GNOME 3.0 preview, 3 M
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
# pidgin # instant messaging and chat client # 1.5 M
#-empathy # instant messaging and voice client # 49 M

# gnome themes
gtk-murrine-engine

#mintmenu dependencies
#deskbar-applet
#gnome-python2-gnomedesktop
#pyxdg
#pygtk2
#pygtk2-libglade
#alacarte
#GConf2
#odt2txt
#tracker
#tracker-search-tool
#PackageKit

#fusion linux repo
mintmenu-4.9.9
dockbarx
autoten
xterm
fusion-linux # package with setting for look & feel of Fusion GNOME desktop
teamviewer5

@office

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
hydrogen # advanced drum machine for Linux, 9.5 M
banshee
-rhythmbox # audio player, 11 M
# hydrogen-drumkits # additional drum kit sounds for hydrogen, 20 M

# video media players
vlc
Miro
gnome-mplayer
gecko-mediaplayer
#gxine
#xine-lib-extras-nonfree

# video editing apps
# avidemux # bug pri 14.0 buildu, vratiti prvom prilikom
pitivi
#k9copy # k9 uses kdelibs as dependency :(

# KDE apps
kdelibs # base for other KDE apps 63 M
k3b-extras-freeworld # best CD/DVD/Blu-ray burning app for Linux, 55 M ( + kdelibs + deps 117 M)
krusader # best file manager, similar to windows commander but more powerful 22 M
filelight # visualize diskspace usage
kdeedu-marble # Marble is desktop atlas and globe 22 M

# education
stellarium # Photo-realistic planetarium 40 M

# desktop apps
# geany # advanced IDE and text editor, 2.3 M
pyroom # fullscreen uncluterred text editor for better productivity, 5.5 M
gnome-translate # translation tool, 1.2 M
gwibber # best GNOME twitter and identica client, 9.3 M
giver # easy local file sharing, 0.3 M


# graphics and photo apps

gimp # most powerful open source image editor 50 M
# additional GIMP plugins 6 M
gimpfx-foundry
gimp-resynthesizer
gimp-lqr-plugin
GREYCstoration-gimp
ufraw-gimp

f-spot # 9 M
scribus # 43 M
inkscape # 36.6 M
inkscape-docs
bitstream-vera-sans-fonts
blender # 3D modeling, visualization and animation, 24 M
fotowall
photoprint
posterazor
jhead
#hugin # Photo panorama application, 49 M
#kipi-plugins
-shotwell

# video tools
ffmpeg
ffmpeg2theora
mencoder

# misc advanced tools
gparted # partition management tool, 3.4 M
accountsdialog
btrfs-progs
mc # best console file management app, 5 M - 45 M with perl depencency
nano # simple cli text editor
# vim-enhanced # vi is enough for most people, 26M - 65 M with perl dependency
wget
netactview # Network connections viewer similar in functionality with netstat
livecd-tools
liveusb-creator
sshfs
powertop
conky
htop
atop
testdisk
p7zip-plugins
unrar
mutt
screen
fslint
yum-plugin-remove-with-leaves
b43-fwcutter
fedora-ksplice
cnetworkmanager # Command Line Interface for NetworkManager
akmod-wl # driver for broadcom wireless cards
mesa-dri-drivers-experimental
wxPython # wxPython for autoten
wine # 83 M
playonlinux # Run your Windows applications on Linux easily 6 M

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


# remove lame games and replace them with better ones
-@games
-gnome-games

# remove japanese support, 26 M
-anthy
-ibus-anthy
-kasumi

# dictionaries are big
-aspell-*
-hunspell-*
-man-pages*
-words

# save some space
-gnome-user-docs
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

tomboy
-gnote

# rebranding
fedora-logos
fedora-release
fedora-release-notes
#generic-release
#generic-logos
#generic-release-notes

# rpmfusion release packages
rpmfusion-free-release
rpmfusion-nonfree-release

# adobe-release for flash although we don't install flash by default
adobe-release

# rpmfusion status of this package is unclear
# only livna has it now
libdvdcss


# things we don't need here

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

# use the PackageKit helper for bash
PackageKit-command-not-found

# Compiz-Fusion for Gnome
ccsm
compiz
compiz-bcop
compiz-fusion
compiz-fusion-extras
compiz-fusion-extras-gnome
compiz-fusion-gnome
compiz-gnome
compizconfig-backend-gconf
compizconfig-python
emerald
emerald-themes
fusion-icon-gtk
libcompizconfig

# internet apps
-firefox
firefox4
pan
chromium
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
# tangogps has gpscorrelate as a dependency?!?
#tangogps
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
PySolFC
teeworlds # fast paced 2D multiplayer platform shoot'em up, 5/5, 7.2 M
glaxium # arcade game where you get to control a spaceship and destroy enemies, 2.2 M
CriticalMass # 2D space shoot'em up game, Galaga clone
Maelstrom
KoboDeluxe
numptyphysics # A crayon-drawing based physics puzzle game, 5/5, 0.7 M
freeciv # Civilization clone, 4/5, 24 M
hedgewars # worms clone, 5/5, 83 M
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
skype
# picasa # great photo management app, but crashes alot!, 82 M
# google-chrome-unstable

%end



%post

echo "begin post"

# rebranding
sed -i -e 's/Generic/Fusion Linux/g' /etc/fedora-release /etc/issue

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

# Put Autoten icon on desktop
mkdir /etc/skel/Desktop
cp /usr/share/applications/autoten.desktop /etc/skel/Desktop/

# Setup default mintMenu application list
mkdir -p /etc/skel/.linuxmint/mintMenu/
cp /usr/share/fusion-linux/mintMenu/applications.list /etc/skel/.linuxmint/mintMenu/

# Additional post commands




# add .repo files for additional repositories
releasever=14
basearch=i386

# Fusion Linux repository
cat >> /etc/yum.repos.d/fusion.repo << EOF
# Place this file in your /etc/yum.repos.d/ directory

[fusion]
name=Few packages that are missing for Fusion Linux (Fedora Remix)
baseurl=http://iso.linux.hr/fusion-linux/fusion-repo/fusion-$releasever/$basearch/
enabled=1
skip_if_unavailable=1
gpgcheck=0

[fusion-source]
name=Few packages that are missing for Fusion Linux (Fedora Remix) - Source
baseurl=http://iso.linux.hr/fusion-linux/fusion-repo/fusion-$releasever/SRPMS
enabled=0
skip_if_unavailable=1
gpgcheck=0

EOF

# mintMenu repo
cat >> /etc/yum.repos.d/mintmenu.repo << EOF
[mintMenu]
name=mintMenu
type=rpm-md
baseurl=http://download.opensuse.org/repositories/home:/unamanic/Fedora_13/
gpgcheck=1
gpgkey=http://download.opensuse.org/repositories/home:/unamanic/Fedora_13/repodata/repomd.xml.key
enabled=1
exclude=mintmenu-5*,banshee*
EOF

# Chromium repository
cat >> /etc/yum.repos.d/fedora-chromium.repo << EOF
[fedora-chromium]
name=Chromium web browser and deps
baseurl=http://repos.fedorapeople.org/repos/spot/chromium/fedora-$releasever/$basearch/
enabled=1
gpgcheck=0

[fedora-chromium-source]
name=Chromium web browser and deps - Source
baseurl=http://repos.fedorapeople.org/repos/spot/chromium/fedora-$releasever/SRPMS/
enabled=0
gpgcheck=0
EOF

# Firefox 4 repository
cat >> /etc/yum.repos.d/fedora-firefox4.repo << EOF
[fedora-firefox4]
name=Firefox 4 web browser and deps
baseurl=http://repos.fedorapeople.org/repos/spot/firefox4/fedora-$releasever/$basearch/
enabled=1
gpgcheck=0
EOF

# Gimp 2.7 repository
cat >> /etc/yum.repos.d/fedora-gimp.repo << EOF
[fedora-gimp]
name=Development version of Gimp that will replace stable release
baseurl=http://repos.fedorapeople.org/repos/luya/gimp/fedora-$releasever/$basearch/
enabled=1
gpgcheck=0
EOF

# Livna repository
cat >> /etc/yum.repos.d/livna.repo << EOF
[livna]
name=rpm.livna.org for $releasever - $basearch
baseurl=http://ftp-stud.fht-esslingen.de/pub/Mirrors/rpm.livna.org/repo/$releasever/$basearch/
# mirrorlist=http://rpm.livna.org/mirrorlist
failovermethod=roundrobin
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-livna
EOF

# Virtualbox repository
cat >> /etc/yum.repos.d/virtualbox.repo << EOF
[virtualbox]
name=Fedora $releasever - $basearch - VirtualBox
baseurl=http://download.virtualbox.org/virtualbox/rpm/fedora/13/$basearch
enabled=1
gpgcheck=1
gpgkey=http://downloadd.virtualbox.org/virtualbox/debian/oracle_vbox.asc
EOF

# Dropbox repository
cat >> /etc/yum.repos.d/dropbox.repo << EOF
[Dropbox]
name=Dropbox Repository
baseurl=http://linux.dropbox.com/fedora/13/
gpgkey=http://linux.dropbox.com/fedora/rpm-public-key.asc
EOF

# Playonlinux repository
cat >> /etc/yum.repos.d/playonlinux.repo << EOF
[playonlinux]
name=PlayOnLinux Official repo
baseurl=http://rpm.playonlinux.com/fedora/yum/base
enable=1
gpgcheck=0
gpgkey=http://mulx.playonlinux.com/rpm/rpm.gpg
EOF

# install Google repository (Picasa, Google Chrome Browser ...)
wget https://dl-ssl.google.com/linux/linux_signing_key.pub
rpm --import linux_signing_key.pub
cat >> /etc/yum.repos.d/google.repo << EOF
[google]
name=Google - i386
baseurl=http://dl.google.com/linux/rpm/stable/i386
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

# install Skype repository
gpg --keyserver pgp.mit.edu --recv-keys 0xD66B746E
gpg -a -o /etc/pki/rpm-gpg/RPM-GPG-KEY-skype --export 0xD66B746E
cat >> /etc/yum.repos.d/skype.repo << EOF
[skype]
name=Skype Repository
baseurl=http://download.skype.com/linux/repos/fedora/updates/i586/
#gpgkey=http://www.skype.com/products/skype/linux/rpm-public-key.asc
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-skype
enabled=1
gpgcheck=1
EOF

# RPM Fusion GPG keys
echo "== RPM Fusion Nonfree: Base section =="
caecho "Importing RPM Fusion keys"
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-*-primary
echo "List of packages from RPM Fusion Nonree:"
rpm -qa --qf '%{NAME} %{SIGGPG:pgpsig} %{SIGPGP:pgpsig} \n' | grep -e 206f8182b1981b68 -e 4d2a1bdc8dc43844 | awk ' { print $1 } ' | sort
echo "List of incuded RPM Fusion packages with their size:"
rpm -q --qf '%{SIZE} %{NAME}\n' $(rpm -qa --qf '%{NAME} %{SIGGPG:pgpsig} %{SIGPGP:pgpsig} \n' | grep -e 206f8182b1981b68 -e 4d2a1bdc8dc43844 | awk ' { print $1 } ') | sort -n

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


# Demo video and audio files
echo "Examples creation folder"
cd "$LIVE_ROOT"
mkdir -p Examples/Podcast
cd Examples/Podcast
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
cd "$LIVE_ROOT"
echo "Example creation folder end"

# Make Multimedia Examples folder show on desktop
echo "Make Multimedia Examples folder show on desktop"
cd "$LIVE_ROOT"
cp -fR Examples/ "$INSTALL_ROOT/etc/skel/Desktop/" # copy sub directories and all files
#cp "$LIVE_ROOT/Examples/" "$INSTALL_ROOT/etc/skel/Desktop/" -R
echo "Make Multimedia Examples folder show on desktop end"

# Download and install latest Broadom b43 driver
echo "Download and install latest Broadom b43 driver"
cd "$LIVE_ROOT"
#wget http://downloads.openwrt.org/sources/broadcom-wl-4.80.53.0.tar.bz2
#mkdir "$INSTALL_ROOT/extra/broadcom-firmware" -p
#cd "$INSTALL_ROOT/extra/broadcom-firmware"
wget http://mirror2.openwrt.org/sources/broadcom-wl-4.150.10.5.tar.bz2
tar xjf broadcom-wl-4.150.10.5.tar.bz2
cd broadcom-wl-4.150.10.5/driver
#b43-fwcutter -w /lib/firmware/ wl_apsta_mimo.o
b43-fwcutter -w "$INSTALL_ROOT/lib/firmware/" wl_apsta_mimo.o
cd "$LIVE_ROOT"
echo "Download and install latest Broadom b43 driver end"

%end
