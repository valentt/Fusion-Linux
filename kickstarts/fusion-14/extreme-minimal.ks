# maintained by Valent Turkovic <valent.turkovic AT gmail.com>
# Community Fedora Remix 12.3
# This remix is not affliated or endorsed by Red Hat
# Create your own remix - http://fedoraproject.org/wiki/How_to_create_and_use_a_Live_CD

lang en_US.UTF-8
keyboard croat
timezone Europe/Zagreb
part / --size 6000 --fstype ext4
auth --useshadow --enablemd5
selinux --enforcing
firewall --enabled --service=mdns
xconfig --startxonboot
services --enabled=NetworkManager --disabled=rpcsvcgssd,rpcgssd,rpcidmapd,sshd,network,nfslock,nfs,rpcbind,sendmail

repo --name=rpmfusion-free --baseurl=http://download1.rpmfusion.org/free/fedora/releases/12/Everything/i386/os
repo --name=rpmfusion-free-updates --baseurl=http://download1.rpmfusion.org/free/fedora/updates/12/i386
repo --name=rpmfusion-non-free --baseurl=http://download1.rpmfusion.org/nonfree/fedora/releases/12/Everything/i386/os
repo --name=rpmfusion-non-free-updates --baseurl=http://download1.rpmfusion.org/nonfree/fedora/updates/12/i386
repo --name=livna --baseurl=ftp://mirrors.tummy.com/pub/rpm.livna.org/repo/12/i386
repo --name=adobe --baseurl=http://linuxdownload.adobe.com/linux/i386/
repo --name=google --baseurl=http://dl.google.com/linux/rpm/stable/i386
# repo --name=chromium --baseurl=http://spot.fedorapeople.org/chromium/F12
repo --name=skype --baseurl="http://download.skype.com/linux/repos/fedora/updates/i586"


%packages --excludedocs

@base
@core
@hardware-support
@base-x
@moblin-desktop

# dictionaries are big
-aspell-*
-hunspell-*
-man-pages*
-words


# fonts that are not needed
-thai-scalable-fonts-common
-cjkuni-uming-fonts

gnome-do
gkrellm

# misc advanced tools
mc
wget
powertop
htop
atop
vim-enhanced
mutt
screen
yum-plugin-remove-with-leaves
b43-fwcutter
akmod-wl
mesa-dri-drivers-experimental

# rpmfusion release packages
rpmfusion-free-release
rpmfusion-nonfree-release

# livna because we need libdvdcss for playing encrypted DVD's
livna-release

# adobe-release for flash although we don't install flash by default
adobe-release

# proprietary bits
skype


# drop some system-config things
-system-config-boot
-system-config-language
-system-config-lvm
-system-config-network
-system-config-rootpassword
system-config-services
policycoreutils-gui

@croatian-support

%end

%post


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

# Some sane desktop defaults
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /desktop/gnome/peripherals/touchpad/tap_to_click true > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /desktop/gnome/peripherals/touchpad/disable_while_typing true > /dev/null
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /apps/nautilus/preferences/always_use_browser true > /dev/null

EOF

# Download mintMenu and install it
rpm -ivh http://www.witt-family.net/mintmenu-4.9.1-6.fc12.noarch.rpm
wget http://www.witt-family.net/mintmenu-4.9.1-6.fc12.noarch.rpm
yum install mintmenu-* --nogpgcheck -y

# Additional post commands

# add .repo files
#cat >> /etc/yum.repos.d/chromium.repo << EOF
#[chromium]
#name=Chromium Test Packages
#baseurl=http://spot.fedorapeople.org/chromium/F12/
#enabled=1
#EOF

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

# RPM Fusion GPG keys
echo "== RPM Fusion Nonfree: Base section =="
echo "Importing RPM Fusion keys"
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-*-primary
echo "List of packages from RPM Fusion Nonree:"
rpm -qa --qf '%{NAME} %{SIGGPG:pgpsig} %{SIGPGP:pgpsig} \n' | grep -e 206f8182b1981b68 -e 4d2a1bdc8dc43844 | awk ' { print $1 } ' | sort
echo "List of incuded RPM Fusion packages with their size:"
rpm -q --qf '%{SIZE} %{NAME}\n' $(rpm -qa --qf '%{NAME} %{SIGGPG:pgpsig} %{SIGPGP:pgpsig} \n' | grep -e 206f8182b1981b68 -e 4d2a1bdc8dc43844 | awk 
' { print $1 } ') | sort -n

%end

%post --nochroot

#
# http://www.redhat.com/docs/manuals/linux/RHL-9-Manual/custom-guide/s1-kickstart2-postinstallconfig.html
# --nochroot Allows you to specify commands that you would like to run outside of the chroot environment.
#

LIVE_ROOT="/home"
cd /home/temp/imgcreate-*
cd install_root
INSTALL_ROOT=$(pwd)


# Next segment download video and audio files, saves them so that they are available on LiveCD as demo material

#cd "$LIVE_ROOT"
#mkdir -p Content
#cd Content
#mkdir Podcast
#cd Podcast
#wget http://fedoraproject.org/w/uploads/e/e4/Fedora_11_Overview_-_Jesse_Keating.ogg
#wget http://fedoraproject.org/w/uploads/8/83/Fedora_11_Overview_-_Spot_Callaway.ogg
#wget http://wonderer.fedorapeople.org/Interview_cwickert_24_Apr_2009.ogg
#wget http://mspevack.fedorapeople.org/glezos-diegobz-20090403.ogg
#wget http://fedoraproject.org/w/uploads/a/a9/Presto_-_Jon_Dieter.ogg
#cd ..
#mkdir Remix
#cd Remixg
#wget http://www.montanalinux.org/files/newvideos/fedora-10-remix.ogv
#cd ..
#mkdir Videos
#cd Videos
#wget http://www.redhat.com/v/magazine/ogg/FUDCon11Recap.ogg
#wget http://www.redhat.com/v/ogg/TruthHappensRmx.ogg

#mkdir -p "$INSTALL_ROOT/etc/skel/Desktop"
#cp "$LIVE_ROOT/Content" "$INSTALL_ROOT/etc/skel/Desktop/" -R

#cp "$LIVE_ROOT/Content" "$INSTALL_ROOT/"
#ln -s "$INSTALL_ROOT/etc/skel/Desktop/Content" "$INSTALL_ROOT/"

# Make Multimedia Content folder show on desktop
# mkdir "$INSTALL_ROOT/usr/local/lib/codecs" -p
# ln -s /etc/skel/Desktop/Content /

# Download and install latest Broadom b43 driver
#wget http://downloads.openwrt.org/sources/broadcom-wl-4.80.53.0.tar.bz2
wget http://mirror2.openwrt.org/sources/broadcom-wl-4.150.10.5.tar.bz2
tar xjf broadcom-wl-4.150.10.5.tar.bz2
cd broadcom-wl-4.150.10.5/driver
b43-fwcutter -w /lib/firmware/ wl_apsta_mimo.o

#cp "$LIVE_ROOT/b43" "$INSTALL_ROOT/lib/firmware/" -R
# mkdir "$INSTALL_ROOT/usr/local/lib/codecs" -p
#cp "$LIVE_ROOT/codecs" "$INSTALL_ROOT/usr/local/lib/" -R

%end

