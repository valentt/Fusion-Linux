# Desktop with customizationst to fit in a CD sized image (package removals, etc.)
# Maintained by the Fedora Desktop SIG:
# http://fedoraproject.org/wiki/SIGs/Desktop
# mailto:desktop@lists.fedoraproject.org

# timezone Europe/Zagreb
part / --size 6000 --fstype ext4

#repo --name=fusion --baseurl=http://iso.linux.hr/fusion-linux/fusion-repo/fusion-15/i386/
repo --name=rpmfusion-non-free --baseurl=http://download1.rpmfusion.org/nonfree/fedora/releases/16/Everything/i386/os/
repo --name=rpmfusion-non-free-updates --baseurl=http://download1.rpmfusion.org/nonfree/fedora/updates/16/i386
repo --name=adobe --baseurl=http://linuxdownload.adobe.com/linux/i386/
repo --name=skype --baseurl=http://download.skype.com/linux/repos/fedora/updates/i586
repo --name=dropbox --baseurl=http://linux.dropbox.com/fedora/15/
repo --name=virtualbox --baseurl=http://download.virtualbox.org/virtualbox/rpm/fedora/15/$basearch/
#repo --name=livna --baseurl=http://ftp-stud.fht-esslingen.de/pub/Mirrors/rpm.livna.org/repo/16/i386/
#repo --name=playonlinux --baseurl=http://rpm.playonlinux.com/fedora/yum/base


%packages

# eyecandy
#desktop-backgrounds-basic
faenza-fusion-icon-theme # Fusion Linux icon theme
faenza-icon-theme

#fusion linux repo
#mintmenu
#dockbarx
#python-imaging # python module needed for dockbarx, 0.4 M
autoplus
xterm
#fusion-linux-14 # package with setting for look & feel of Fusion GNOME desktop
teamviewer6 # best remote desktop for Linux and other platforms, 84 M

# desktop apps
# geany # advanced IDE and text editor, 2.3 M
# pyroom # fullscreen uncluterred text editor for better productivity, 5.5 M
gnome-translate # translation tool, 1.2 M
#choqok # kde based twitter client, 4.1 M
giver # easy local file sharing, 0.3 M


# proprietary bits
flash-plugin
nautilus-dropbox
# skype # removed for distrubution and legal reasons. 
# picasa # great photo management app, but crashes alot!, 82 M
# google-chrome-unstable

# nonfree packages
unrar

VirtualBox-4.1





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
