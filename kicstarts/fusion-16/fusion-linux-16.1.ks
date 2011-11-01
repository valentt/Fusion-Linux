# Fusion Linux 16
# valent.turkovic@gmail.com

%include fedora-live-desktop.ks

#%include fusion-live-minimization.ks
#%include fusion-live-extras.ks

timezone Europe/Zagreb
part / --size 5000 --fstype ext4

repo --name=fedora-chromium --baseurl=http://repos.fedorapeople.org/repos/spot/chromium/fedora-16/i386/
repo --name=fedora-gimp-unstable --baseurl=http://repos.fedorapeople.org/repos/nphilipp/gimp-unstable/fedora-16/i386/
# repo --name=rpmfusion-free --baseurl=http://download1.rpmfusion.org/free/fedora/releases/16/Everything/i386/os/
# repo --name=rpmfusion-free-updates --baseurl=http://download1.rpmfusion.org/free/fedora/updates/16/i386/


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

# remove lame games and replace them with better ones
-@games
-gnome-games # GNOME games, 15 M

@office # LiberOffice suite, 417 M
#abiword
#gnumeric

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
synapse # gnome-do alternative
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
irssi # command line IRC chat client used for Get Live Help, 2.3 M
xchat # gui IRC chat client
# pidgin # instant messaging and chat client # 1.5 M
#-empathy # instant messaging and voice client # 49 M


# internet apps
pan
chromium # 92 M temporary bug - requires libc.so.6(GLIBC_2.15)
#google-chrome-stable
#chromium-browser
thunderbird # 46 M
hotot # identica and twitter microbloging client, 1 M
#gwibber # best identica and twitter microbloging client, 9.3 M
#qwit # best identica and twitter microbloging client,  3 M
#midori
#epiphany
#evolution-mapi


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
-eog # Eye Of Gnome is replaced with Viewnior, 5 M
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


# p2p apps
## amule # temporary bug issue - requires libthreadutil.so.2
transmission # fabulos and lightweight bittorrent client
tucan # download manager for file services like megaupload.com, rapidshare.com, mediafire.com, hotfile.com etc, 6 M
uget # download manager
#deluge
#azureus


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


# education
stellarium # Photo-realistic planetarium 40 M

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
sshfs # mount remote ssh folders, pure awesomeness ;)
powertop
conky
ntfs-config # GUI for easy NTFS mounting and configuration, 500 kB
htop
atop
testdisk
smartmontools
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


wxPython # wxPython for autoten
wine # 83 M
xorg-x11-apps # xkill app for killing unresponsive apps
#playonlinux # Run your Windows applications on Linux easily via wine 6 M
#fedora-ksplice # ksplice utility enables you have kernel updates without reboot
# vim-enhanced # vi is enough for most people, 26M - 65 M with perl dependency

@croatian-support # this distro has english and croatian support by default

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
