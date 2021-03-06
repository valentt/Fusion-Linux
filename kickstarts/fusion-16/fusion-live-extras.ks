# Desktop with customizationst to fit in a CD sized image (package removals, etc.)
# Maintained by the Fedora Desktop SIG:
# http://fedoraproject.org/wiki/SIGs/Desktop
# mailto:desktop@lists.fedoraproject.org

# timezone Europe/Zagreb
part / --size 6000 --fstype ext4

# releasever=16
# basearch=x86_64
# basearch=i386

#repo --name=fusion --baseurl=http://iso.linux.hr/fusion-linux/fusion-repo/fusion-15/i386/
#repo --name=rpmfusion-non-free --baseurl=http://download1.rpmfusion.org/nonfree/fedora/releases/16/Everything/i386/os/

# repos that automatically are defined by 16 and $basearch
repo --name=rpmfusion-non-free --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-16&arch=$basearch
repo --name=rpmfusion-non-free-updates --baseurl=http://download1.rpmfusion.org/nonfree/fedora/updates/16/$basearch
repo --name=virtualbox --baseurl=http://download.virtualbox.org/virtualbox/rpm/fedora/16/$basearch/

# 32 bit only
repo --name=dropbox --baseurl=http://linux.dropbox.com/fedora/16/
repo --name=adobe --baseurl=http://linuxdownload.adobe.com/linux/i386/
repo --name=skype --baseurl=http://download.skype.com/linux/repos/fedora/updates/i586

repo --name=playonlinux --baseurl=http://rpm.playonlinux.com/fedora/yum/base
#repo --name=livna --baseurl=http://ftp-stud.fht-esslingen.de/pub/Mirrors/rpm.livna.org/repo/16/i386/



%packages

# eyecandy
#desktop-backgrounds-basic
##faenza-fusion-icon-theme # Fusion Linux icon theme
##faenza-icon-theme

#fusion linux repo
#mintmenu
#dockbarx
#python-imaging # python module needed for dockbarx, 0.4 M
#autoplus
xterm
#fusion-linux-14 # package with setting for look & feel of Fusion GNOME desktop
#teamviewer6 # best remote desktop for Linux and other platforms, 84 M

# desktop apps
# geany # advanced IDE and text editor, 2.3 M
# pyroom # fullscreen uncluterred text editor for better productivity, 5.5 M
gnome-translate # translation tool, 1.2 M
#choqok # kde based twitter client, 4.1 M
#giver # easy local file sharing, 0.3 M + 43M, but has mono as dependency

#arista dependency
python-gudev

# proprietary bits
flash-plugin
nautilus-dropbox
# skype # removed for distrubution and legal reasons. 
# picasa # great photo management app, but crashes alot!, 82 M
# google-chrome-stable

# nonfree packages
rpmfusion-nonfree-release
gstreamer-plugins-bad-nonfree
unrar


#VirtualBox-4.1


%end


%post --log=/root/ks-post.log

# tweak swappiness
echo "" >>/etc/sysctl.conf
echo "vm.swappiness=10" >>/etc/sysctl.conf
echo "vm.vfs_cache_pressure = 50" >>/etc/sysctl.conf

# Fusion Linux Rebranding
echo ""
echo -e "Fusion Linux Rebranding"
echo ""
echo "Fusion release 16 (Creator)" > /etc/fedora-release
echo "cpe:/o:fusionlinux:fusion:16" > /etc/system-release-cpe
echo "Fusion release 16 (Creator)
Kernel \r on an \m (\l)" > /etc/issue
echo "Fusion release 16 (Creator)
Kernel \r on an \m (\l)" > /etc/issue.net

# remove this session file from gnome-session package to make cinnamon the default
# temporary hack till this file is split up from the package
# rm -rf /usr/share/xsessions/gnome.session

# testing new gsetting system scheme
cat >> /usr/share/glib-2.0/schemas/01-fusion-settings << EOF
[org/gnome/gedit/preferences/ui]
max-recents=13
EOF
echo ""
echo "obican glib-compile-schemas"
echo ""
glib-compile-schemas /usr/share/glib-2.0/schemas/


#echo ""
#echo "a sada dbus-launch glib-compile-schemas"
#echo ""
#dbus-launch glib-compile-schemas /usr/share/glib-2.0/schemas/

# Gedit with 10 recent files
# gsettings set org.gnome.gedit.preferences.ui max-recents '13'

# show icons on Desktop
# gsettings set org.gnome.desktop.background show-desktop-icons true

# set Faience-Azur as default icon theme
# gsettings set org.gnome.desktop.interface icon-theme 'Faience-Azur'

# tweak bash terminal and add fortune
cat >> /etc/skel/.bashrc << EOF

PS1='\[\033[01;34m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W]\[\033[00m\]\\$ '
fortune
EOF

# create autostart directory
mkdir -p /etc/skel/.config/autostart

# enable clipit clipboard manager autostart
cp /usr/share/applications/clipit.desktop /etc/skel/.config/autostart/

# add synapse to autostart directory
cp /usr/share/applications/synapse.desktop /etc/skel/.config/autostart/

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
rm /usr/share/applications/kde4/kwalletmanager.desktop
rm /usr/share/applications/kde4/kwikdisk.desktop



# add .repo files for additional repositories

# Fusion Linux repository
cat >> /etc/yum.repos.d/fusion.repo << EOF
# Place this file in your /etc/yum.repos.d/ directory

[fusion]
name=Few packages that are missing for Fusion Linux (Fedora Remix)
baseurl=http://iso.linux.hr/fusion-linux/fusion-repo/fusion-16/$basearch/
enabled=1
skip_if_unavailable=1
gpgcheck=0

[fusion-source]
name=Few packages that are missing for Fusion Linux (Fedora Remix) - Source
baseurl=http://iso.linux.hr/fusion-linux/fusion-repo/fusion-16/SRPMS
enabled=0
gpgcheck=0
skip_if_unavailable=1
EOF

# Gimp 2.7 repository
cat >> /etc/yum.repos.d/fedora-gimp-unstable.repo << EOF
[fedora-gimp-unstable]
name=Unstable development versions of GIMP for Fedora 16 - $basearch
baseurl=http://repos.fedorapeople.org/repos/nphilipp/gimp-unstable/fedora-16/$basearch/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-nphilipp
skip_if_unavailable=1

[fedora-gimp-unstable-debuginfo]
name=Unstable development versions of GIMP for Fedora 16 - $basearch - Debug
baseurl=http://repos.fedorapeople.org/repos/nphilipp/gimp-unstable/fedora-16/$basearch/debug/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-nphilipp
skip_if_unavailable=1

[fedora-gimp-unstable-source]
name=Unstable development versions of GIMP for Fedora 16 - $basearch - Source
baseurl=http://repos.fedorapeople.org/repos/nphilipp/gimp-unstable/fedora-16/src/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-nphilipp
skip_if_unavailable=1
EOF
rpm -import http://repos.fedorapeople.org/repos/nphilipp/gimp-unstable/RPM-GPG-KEY-nphilipp

# Dropbox repository
rm /etc/yum.repos.d/dropbox.repo
cat >> /etc/yum.repos.d/dropbox.repo << EOF
[Dropbox]
name=Dropbox Repository
baseurl=http://linux.dropbox.com/fedora/16/
baseurl=http://linux.dropbox.com/fedora/15/
gpgkey=http://linux.dropbox.com/fedora/rpm-public-key.asc
skip_if_unavailable=1
EOF

# Playonlinux repository
cat >> /etc/yum.repos.d/playonlinux.repo << EOF
[playonlinux]
name=PlayOnLinux Official repo
baseurl=http://rpm.playonlinux.com/fedora/yum/base
enable=1
gpgcheck=0
gpgkey=http://mulx.playonlinux.com/rpm/rpm.gpg
skip_if_unavailable=1
EOF

# install Google repository (Picasa, Google Chrome Browser ...)
wget https://dl-ssl.google.com/linux/linux_signing_key.pub
rpm --import linux_signing_key.pub
cat >> /etc/yum.repos.d/google.repo << EOF
[google]
name=Google - i386
baseurl=http://dl.google.com/linux/rpm/stable/$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
skip_if_unavailable=1
EOF

# Google Chrome repo
cat >> /etc/yum.repos.d/google-chrome.repo << EOF
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/$basearch
enabled=1
gpgcheck=1
skip_if_unavailable=1
EOF

# Google Earth repo
cat >> /etc/yum.repos.d/google-earth.repo << EOF
[google-earth]
name=google-earth
baseurl=http://dl.google.com/linux/earth/rpm/stable/$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
skip_if_unavailable=1
EOF

# Add Skype repository
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
skip_if_unavailable=1
EOF

# Add Cinnamon repository
cat >> /etc/yum.repos.d/fedora-cinnamon.repo << EOF
[fedora-cinnamon]
name=Cinnamon provides core user interface functions for the GNOME 3 desktop
baseurl=http://repos.fedorapeople.org/repos/leigh123linux/cinnamon/fedora-16/$basearch/
enabled=1
skip_if_unavailable=1
gpgcheck=0

[fedora-cinnamon-source]
name=Cinnamon provides core user interface functions for the GNOME 3 desktop - Source
baseurl=http://repos.fedorapeople.org/repos/leigh123linux/cinnamon/fedora-16/SRPMS
enabled=0
skip_if_unavailable=1
gpgcheck=0
EOF

# Add Parsidora repository
cat >> /etc/yum.repos.d/parsidora.repo << EOF
[parsidora]
name=Parsidora 16 – $basearch
baseurl=http://parsidora.sourceforge.net/releases/16/repos/parsidora/$basearch
skip_if_unavailable=1
gpgcheck=0
EOF

# install VirtualBox Guest Additions
#mkdir /tmp/mnt
#mount -o loop /usr/share/virtualbox/VBoxGuestAdditions.iso /tmp/mnt/
#/tmp/mnt/VBoxLinuxAdditions.run


# Enable GIMP single window mode

mkdir -p /etc/skel/.gimp-2.7/
cat >> /etc/skel/.gimp-2.7/sessionrc << EOF
# GIMP sessionrc
# 
# This file takes session-specific info (that is info, you want to keep
# between two GIMP sessions).  You are not supposed to edit it manually, but
# of course you can do.  The sessionrc will be entirely rewritten every time
# you quit GIMP.  If this file isn't found, defaults are used.

(session-info "toplevel"
    (factory-entry "gimp-empty-image-window")
    (position 410 370)
    (size 620 200))
(session-info "toplevel"
    (factory-entry "gimp-single-image-window")
    (position 159 104)
    (size 986 727)
    (open-on-exit)
    (aux-info
        (left-docks-width "118")
        (right-docks-position "656"))
    (gimp-toolbox
        (side left)
        (book
            (current-page 0)
            (dockable "gimp-tool-options"
                (tab-style automatic))))
    (gimp-dock
        (side right)
        (book
            (current-page 0)
            (dockable "gimp-layer-list"
                (tab-style automatic)
                (preview-size 32))
            (dockable "gimp-channel-list"
                (tab-style automatic)
                (preview-size 32))
            (dockable "gimp-vectors-list"
                (tab-style automatic)
                (preview-size 32))
            (dockable "gimp-undo-history"
                (tab-style automatic)))
        (book
            (position 356)
            (current-page 0)
            (dockable "gimp-brush-grid"
                (tab-style automatic))
            (dockable "gimp-pattern-grid"
                (tab-style automatic))
            (dockable "gimp-gradient-list"
                (tab-style automatic)))))

(hide-docks no)
(single-window-mode yes)
(last-tip-shown 0)

# end of sessionrc
EOF


%end



%post --nochroot --log=/mnt/sysimage/root/ks-post.log

#
# http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Installation_Guide/s1-kickstart2-postinstallconfig.html
# --nochroot Allows you to specify commands that you would like to run outside of the chroot environment.
#


# Define variables where config files are located ($LIVE_ROOT) 
# and which directory is used for building iso ($INSTALL_ROOT)
LIVE_ROOT="/home/fusion-linux/"
cd /home/fusion-linux/temp/imgcreate-*
cd install_root
INSTALL_ROOT=$(pwd)
echo $INSTALL_ROOT

# Download Faience GNOME 3 icon theme
cd "$LIVE_ROOT"
mkdir -p faience_icon_theme
cd faience_icon_theme
wget http://www.deviantart.com/download/255099649/faience_icon_theme_by_tiheum-d47vo5d.zip
unzip -o faience_icon_theme_by_tiheum-d47vo5d.zip
tar xf Faience.tar.gz
tar xf Faience-Azur.tar.gz
tar xf Faience-Ocre.tar.gz
tar xf Faience-Claire.tar.gz
mkdir -p "$INSTALL_ROOT/etc/skel/.icons/"
cp -fR Faience/ "$INSTALL_ROOT/etc/skel/.icons/"
cp -fR Faience-Azur/ "$INSTALL_ROOT/etc/skel/.icons/"
cp -fR Faience-Ocre/ "$INSTALL_ROOT/etc/skel/.icons/"
cp -fR Faience-Claire/ "$INSTALL_ROOT/etc/skel/.icons/"

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
wget http://programmer-art.org/media/releases/arista-transcoder/arista-0.9.7.tar.gz
fi
tar xvzf arista-0.9.6.tar.gz
cd arista-0.9.6
python setup.py install --root $INSTALL_ROOT
cd "$LIVE_ROOT"

# Fixes for arista 0.9.6 bugs
#sed -i -e 's/\/home\/fusion-linux\/arista-0.9.6/\/usr\/bin\/python/g' "$INSTALL_ROOT/usr/bin/arista-gtk" "$INSTALL_ROOT/usr/bin/arista-transcode"
#sed -i -e 's/#!./#!\/usr\/bin\/python/g' "$INSTALL_ROOT/usr/bin/arista-gtk" "$INSTALL_ROOT/usr/bin/arista-transcode"
#mv "$INSTALL_ROOT/usr/lib/python2.6/site-packages/arista" "$INSTALL_ROOT/usr/lib/python2.7/site-packages/"




%end
