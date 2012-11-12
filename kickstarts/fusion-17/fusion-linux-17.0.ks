# Fusion Linux 17
# valent.turkovic@gmail.com
# http://fusionlinux.org/blog/

timezone Europe/Zagreb
part / --size 6000 --fstype ext4

#repo --name=rpmfusion-free --baseurl=http://download1.rpmfusion.org/free/fedora/releases/17/Everything/$basearch/os/
#repo --name=rpmfusion-free-updates --baseurl=http://download1.rpmfusion.org/free/fedora/updates/17/$basearch/
repo --name=rpmfusion-free --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-17&arch=$basearch
repo --name=rpmfusion-free-updates --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-17&arch=$basearch
repo --name=fedora-chromium --baseurl=http://repos.fedorapeople.org/repos/spot/chromium/fedora-17/$basearch/
repo --name=parsidora --baseurl=http://parsidora.sourceforge.net/releases/16/repos/parsidora/$basearch

#repo --name=rpmfusion-free --baseurl=http://download1.rpmfusion.org/free/fedora/development/17/$basearch/os/
#repo --name=rpmfusion-nonfree --baseurl=http://download1.rpmfusion.org/nonfree/fedora/development/$basearch/os/

#repo --name=rpmfusion-free --baseurl=http://download1.rpmfusion.org/free/fedora/development/$basearch/os/
#repo --name=rpmfusion-nonfree --baseurl=http://download1.rpmfusion.org/nonfree/fedora/development/$basearch/os/


%packages

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

# desktop tools and addons
# avant-window-navigator # great looking navigation panel, 51 M with python dependencies
# awn-extras-applets # add avant-window-navigator and all extras, 6.7 M
cinnamon
jockey-gtk # Jockey driver manager
gtk-redshift # adjust colour temperature of you screen according to time of day, might help your eyes hurt less if you work at night, 350 kB
ailurus # GNOME tweak app, 1.8 M
gnome-tweak-tool # GNOME 3 tweak tool, 123 K
gnome-documents # document manager application for GNOME, 400 k
gnome-user-share # easy GNOME file sharing over Avahi
hardinfo # GUI hardware and system information utility, 0.4 M
cheese
alacarte # gnome menu editor, 400 k
clipit # gnome clipboard manager, 200 k
synapse # gnome-do alternative, 1.3 M
beesu # start gui apps as root, like gtksu, 30 kB
nautilus-beesu-manager # beesu nautilus manager, 40 kB
gtk-recordmydesktop
control-center-extra
gkrellm
seahorse
gnote # note taking, tomboy clone done in C, 6 M
gconf-editor
dconf-editor # graphical front end for gsettings
nautilus-image-converter
nautilus-actions
nautilus-open-terminal
nautilus-sendto
irssi # command line IRC chat client used for Get Live Help, 2.3 M
xchat # gui IRC chat client
gnome-shell-extension-alternate-tab
gnome-shell-extension-alternative-status-menu
gnome-shell-extension-cpu-temperature
gnome-shell-extension-icon-manager
gnome-shell-extension-mediaplayers
gnome-shell-extension-remove-accessibility-icon
gnome-shell-extension-righthotcorner
gnome-shell-extension-user-theme

# internet apps
uget # download manager
aria2 # addon for uget, High speed download utility with resuming and segmented downloading
#pan
hotot # identica and twitter microbloging client, 1 M, but has big dependency - webkitgtk (36 M) used by gimp and midori
#gwibber # best identica and twitter microbloging client, 9.3 M
#qwit # best identica and twitter microbloging client,  3 M
#midori
#epiphany
#evolution-mapi

# graphics and photo apps
# gloobus-preview # preview and instant access to a variety of file types without the need to open their default applications
sushi # instant preview of documents, photos, music and video files with press of a SPACE, 500 k
viewnior # better image viewer than Eye Of Gnome with crop with same slick interface, 450 k
-eog # Eye Of Gnome is replaced with Viewnior, 5 M
# shutter # great screen capture app, a bit big, 31 M
#f-spot # 9 M
xournal # application for pdf annotation, notetaking, sketching, keeping a journal using a stylus, 0.6 M
bitstream-vera-sans-fonts
fotowall
photoprint
posterazor
jhead
qiv

# codecs
gstreamer-plugins-ugly
gstreamer-ffmpeg
gstreamer-plugins-bad
#gstreamer-plugins-bad-extras

# video media players
vlc # video player that plays all video codecs, 11 M
npapi-vlc # mozilla vlc plugin, 70 K
# Miro # InternetTV player, 16 M - missing package?
#-gnome-mplayer
#-mplayer
#-totem # Totem is replaced with vlc, 8.4 M
#-totem-nautilus
#gecko-mediaplayer

# video tools
ffmpeg
##ffmpeg2theora
mencoder
# Arista encoder dependencies, 350 k
gnome-python2-rsvg
nautilus-python
python-gudev

# audio apps
audacious # best simple audio and mp3 player
audacious-plugins-freeworld* # audacious with plugins 5.3 M
audacity-freeworld
picard-freeworld # Audio tagging application using data from the MusicBrainz database, 3.3 M
## padevchooser # pulseaudio tools
pavucontrol
pavumeter
paprefs
pulseaudio-module-zeroconf

# video editing apps
#HandBrake-gui # great DVD transcoding app # removed because it takes over all video extensions
#pitivi
#k9copy # k9 uses kdelibs as dependency :(, 14 M


# p2p apps
amule
transmission # fabulos and lightweight bittorrent client
tucan # download manager for file services like megaupload.com, rapidshare.com, mediafire.com, hotfile.com etc, 6 M
#deluge
#azureus

# games, cool small ones
abe

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
solarwolf # Interesting space arcade game, 4 M
# blobwars # a little platform shooter, 63 MB
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
# openarena # first person 3D shooter, 327 M
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

# misc gui and cli tools
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
sshfs # mount remote ssh folders, pure awesomeness ;)
powertop
conky
ntfs-config # GUI for easy NTFS mounting and configuration, 500 kB
htop
atop
testdisk
gsmartcontrol # Graphical user interface for smartctl
smartmontools # Tools for monitoring SMART capable hard disks
p7zip-plugins
mutt
screen
rdesktop # 150 kB
remmina # best vnc client, 3 M
fslint # shows size of installed packages and duplicate files, 0.2 M
fortune-mod # wise and funny quotes
fortune-firefly
yum-plugin-remove-with-leaves # yum plugin that removes unused dependencies also 
b43-fwcutter
lm_sensors # hardware monitoring tools, 400 k
# AcetoneISO2 # CD/DVD Image Manipulator, 1.7 M
# akmod-wl # driver for broadcom wireless cards # no more a separate package?
# cnetworkmanager # Command Line Interface for NetworkManager - removed?
#fedora-ksplice # ksplice utility enables you have kernel updates without reboot
vim-minimal # 400k
# vim-enhanced # vi is enough for most people, 26M - 65M with perl dependency
xorg-x11-apps # xkill app for killing unresponsive apps

# remove Java 1.5 (48 M)
-@java-1.5.0
-libgcj

## @croatian-support # this distro has english and croatian support by default

# rpmfusion release packages
rpmfusion-free-release

# xscreensaver and other fabulous screensavers (23 M)
##xscreensaver
##xscreensaver-gl*
##xscreensaver-extras*
##tempest-gnome-screensaver
##tempest-xscreensaver
##rss-glx
##rss-glx-xscreensaver
##rss-glx-gnome-screensaver

%end

%post

%end
