# Desktop with customizationst to fit in a CD sized image (package removals, etc.)
# Maintained by the Fedora Desktop SIG:
# http://fedoraproject.org/wiki/SIGs/Desktop
# mailto:desktop@lists.fedoraproject.org

# timezone Europe/Zagreb
part / --size 6000 --fstype ext4

repo --name=fusion --baseurl=http://iso.linux.hr/fusion-linux/fusion-repo/fusion-15/i386/
repo --name=rpmfusion-free --baseurl=http://download1.rpmfusion.org/free/fedora/releases/15/Everything/i386/os/
repo --name=rpmfusion-non-free --baseurl=http://download1.rpmfusion.org/nonfree/fedora/releases/15/Everything/i386/os/
repo --name=rpmfusion-free-updates --baseurl=http://download1.rpmfusion.org/free/fedora/updates/15/i386/
repo --name=rpmfusion-non-free-updates --baseurl=http://download1.rpmfusion.org/nonfree/fedora/updates/15/i386
repo --name=adobe --baseurl=http://linuxdownload.adobe.com/linux/i386/
repo --name=fedora-chromium --baseurl=http://repos.fedorapeople.org/repos/spot/chromium/fedora-15/i386/
repo --name=skype --baseurl=http://download.skype.com/linux/repos/fedora/updates/i586
repo --name=dropbox --baseurl=http://linux.dropbox.com/fedora/14/
repo --name=fedora-gimp --baseurl=http://repos.fedorapeople.org/repos/luya/gimp/fedora-15/i686/
#repo --name=livna --baseurl=http://ftp-stud.fht-esslingen.de/pub/Mirrors/rpm.livna.org/repo/15/i386/
#repo --name=playonlinux --baseurl=http://rpm.playonlinux.com/fedora/yum/base


%packages
@office # LiberOffice suite, 417 M
#abiword
#gnumeric


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
-thai-scalable-fonts-common
-cjkuni-uming-fonts
-un-core-dotum-fonts
-vlgothic-fonts
-wqy-zenhei-fonts

# remove lame games and replace them with better ones
-@games
-gnome-games # GNOME games, 15 M

-opencc # chinese support, 9 M
-gutenprint* # Printing support, 17 M
-libhangul # 6.4 M
-gucharmap # view font characters, 6.6 M
-planner # project planning, 6.5 M
-groff # removes man and less but saves, 9.2 M
-seahorse # key manager, 7.4 M
-un-core* # korean fonts, 7.4 M
-totem # remove Totem video player and shotwell, 23 M
-shotwell # remove Shotwell photo manager, 0 M
-orca* # accessibility support, 40 M
#-totem* # this removes lots of dependencies, but saves lots of space
-vinagre
-evolution*

# codecs
gstreamer-plugins-ugly
gstreamer-ffmpeg
gstreamer-plugins-bad
#gstreamer-plugins-bad-extras

# video media players
vlc
#*#mozilla-vlc # mozilla vlc plugin, 
#Miro # InternetTV player, 16 M
-gnome-mplayer
-mplayer
-totem # Totem is replaced with vlc, 8.4 M
-totem-nautilus
#gecko-mediaplayer
#gxine
#xine-lib-extras-nonfree

# eyecandy
#desktop-backgrounds-basic
faenza-fusion-icon-theme # Fusion Linux icon theme
faenza-icon-theme

# desktop tools and addons
# avant-window-navigator # great looking navigation panel, 51 M with python dependencies
# awn-extras-applets
gtk-redshift # adjust colour temperature of you screen according to time of day, might help your eyes hurt less if you work at night, 350 kB
ailurus # GNOME tweak app, 5.2 M
hardinfo # GUI hardware and system information utility, 0.4 M
AcetoneISO2 # CD/DVD Image Manipulator, 1.7 M
cheese
alacarte # gnome menu editor, 400 k
parcellite # gnome clipboard manager
#gnome-do
#gnome-shell # GNOME 3.0 preview, 3 M
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

#fusion linux repo
#mintmenu
#dockbarx
#python-imaging # python module needed for dockbarx, 0.4 M
autoplus
xterm
#fusion-linux-14 # package with setting for look & feel of Fusion GNOME desktop
teamviewer6 # best remote desktop for Linux and other platforms, 84 M


# audio apps
audacious # best simple audio and mp3 player
audacious-plugins-freeworld* # audacious with plugins 6.3 M
audacity-freeworld
#banshee
#rhythmbox # audio player, 11 M
picard-freeworld # Audio tagging application using data from the MusicBrainz database, 3.3 M
# hydrogen # advanced drum machine for Linux, has java-1.5.0 as dependency (48 M), 9.5 M
# hydrogen-drumkits # additional drum kit sounds for hydrogen, 20 M

# internet apps
pan
chromium # 92 M
#google-chrome-stable
#chromium-browser
thunderbird # 46 M
hotot # identica and twitter microbloging client, 1 M
#gwibber # best identica and twitter microbloging client, 9.3 M
#qwit # best identica and twitter microbloging client,  3 M
#midori
#epiphany
#evolution-mapi

# p2p apps
amule
transmission # fabulos and lightweight bittorrent client
tucan # download manager for file services like megaupload.com, rapidshare.com, mediafire.com, hotfile.com etc, 6 M
#deluge
#azureus

# video editing apps
avidemux # video editing app, 25 M
#HandBrake-gui # great DVD transcoding app # removed because it takes over all video extensions
pitivi
#k9copy # k9 uses kdelibs as dependency :(, 14 M

# KDE apps
kdelibs # base for other KDE apps 63 M
k3b-extras-freeworld # best CD/DVD/Blu-ray burning app for Linux, 55 M ( + kdelibs + deps 117 M)
krusader # best file manager, similar to windows commander but more powerful 22 M
kdeutils # filelight is obsoleted by kdeutils, filelight visualizes diskspace usage
kdeedu-marble # Marble is desktop atlas and globe 22 M

# education
stellarium # Photo-realistic planetarium 40 M

# desktop apps
# geany # advanced IDE and text editor, 2.3 M
# pyroom # fullscreen uncluterred text editor for better productivity, 5.5 M
gnome-translate # translation tool, 1.2 M
#choqok # kde based twitter client, 4.1 M
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
gloobus-preview # preview and instant access to a variety of file types without the need to open their default applications
viewnior # better image viewer than Eye Of Gnome with crop with same slick interface, 450 k
eog # Eye Of Gnome is replaced with Viewnior, 5 M
shutter # great screen capture app, a bit big, 31 M
#f-spot # 9 M
scribus # 43 M
inkscape # 36.6 M
# inkscape-docs # examples and demos, 37 M
mypaint # MyPaint is a fast and easy open-source graphics application for digital painters, 7.3 M
xournal # application for pdf annotation, notetaking, sketching, keeping a journal using a stylus, 0.6 M
bitstream-vera-sans-fonts
blender # 3D modeling, visualization and animation, 24 M
fotowall
photoprint
posterazor
jhead
qiv
#hugin # Photo panorama application, 49 M
#kipi-plugins
#-shotwell

# video tools
ffmpeg
ffmpeg2theora
mencoder
# Arista encoder dependencies, 350 k
gstreamer-plugins-bad-nonfree
gnome-python2-rsvg
nautilus-python
python-gudev

# misc terminal apps and tools
lxrandr # monitor configuration tool, 130 k
gparted # partition management tool, 3.4 M
accountsdialog
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
unrar
mutt
screen
rdesktop # 150 kB
remmina # best vnc client, 3 M
fslint # shows size of installed packages and duplicate files, 0.2 M
fortune-mod # wise and funny quotes
fortune-firefly
yum-plugin-remove-with-leaves # yum plugin that removes unused dependencies also 
b43-fwcutter
fedora-ksplice # ksplice utility enables you have kernel updates without reboot
cnetworkmanager # Command Line Interface for NetworkManager
akmod-wl # driver for broadcom wireless cards
wxPython # wxPython for autoten
wine # 83 M
#playonlinux # Run your Windows applications on Linux easily via wine 6 M
xorg-x11-apps # xkill app for killing unresponsive apps
# vim-enhanced # vi is enough for most people, 26M - 65 M with perl dependency

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
java-1.6.0-openjdk
jline
rhino
tzdata-java

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
-foo2*
-argyllcms
-lcms
-jbigkit-libs

#tomboy
gnote # note taking, tomboy clone done in C, 6 M

# rpmfusion release packages
rpmfusion-free-release
rpmfusion-nonfree-release

%end


%post

# Gedit with 10 recent files
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t int /apps/gedit-2/preferences/ui/recents/max_recents 10 > /dev/null


# make Chromium default browser
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t string /desktop/gnome/applications/browser/exec /usr/bin/chromium-browser > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t string /desktop/gnome/url-handlers/unknown/command "/usr/bin/chromium-browser %s" > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t string /desktop/gnome/url-handlers/http/command "/usr/bin/chromium-browser %s" > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t string /desktop/gnome/url-handlers/https/command "/usr/bin/chromium-browser %s" > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t string /desktop/gnome/url-handlers/about/command "/usr/bin/chromium-browser %s" > /dev/null


# tweak bash terminal and add fortune
cat >> /etc/skel/.bashrc << EOF

PS1='\[\033[01;34m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W]\[\033[00m\]\\$ '
fortune
EOF


# tweak swappiness
echo "" >>/etc/sysctl.conf
echo "vm.swappiness=10" >>/etc/sysctl.conf
echo "vm.vfs_cache_pressure = 50" >>/etc/sysctl.conf


# delete gnome menu items
rm /usr/share/applications/kde4/ark.desktop
rm /usr/share/applications/kde4/kcalc.desktop
rm /usr/share/applications/kde4/KCharSelect.desktop
rm /usr/share/applications/kde4/KFloppy.desktop
rm /usr/share/applications/kde4/kgpg.desktop
rm /usr/share/applications/kde4/ktimer.desktop
rm /usr/share/applications/kde4/kwrite.desktop
rm /usr/share/applications/kde4/nepomukcontroller.desktop
rm /usr/share/applications/kde4/sweeper.desktop
rm /usr/share/applications/livna-alc.desktop
rm /usr/share/applications/fedora-ggz-gtk.desktop
rm /usr/share/applications/livna-wxcas.desktop
rm /usr/share/applications/kde4/dolphin.desktop
rm /usr/share/applications/kde4/kdf.desktop
rm /usr/share/applications/kde4/ksysguard.desktop
rm /usr/share/applications/kde4/kwalletmanager.desktop
rm /usr/share/applications/kde4/kwikdisk.desktop



# add .repo files for additional repositories
releasever=15
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

# Gimp 2.7 repository
cat >> /etc/yum.repos.d/fedora-gimp.repo << EOF
[fedora-gimp]
name=Development version of Gimp that will replace stable release
baseurl=http://repos.fedorapeople.org/repos/luya/gimp/fedora-$releasever/i686/
enabled=1
gpgcheck=0
EOF

# Dropbox repository
rm /etc/yum.repos.d/dropbox.repo
cat >> /etc/yum.repos.d/dropbox.repo << EOF
[Dropbox]
name=Dropbox Repository
baseurl=http://linux.dropbox.com/fedora/14/
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


%end



%post --nochroot

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
#sed -i -e 's/\/home\/fusion-linux\/arista-0.9.6/\/usr\/bin\/python/g' "$INSTALL_ROOT/usr/bin/arista-gtk" "$INSTALL_ROOT/usr/bin/arista-transcode"
sed -i -e 's/#!./#!\/usr\/bin\/python/g' "$INSTALL_ROOT/usr/bin/arista-gtk" "$INSTALL_ROOT/usr/bin/arista-transcode"
mv "$INSTALL_ROOT/usr/lib/python2.6/site-packages/arista" "$INSTALL_ROOT/usr/lib/python2.7/site-packages/"




%end
