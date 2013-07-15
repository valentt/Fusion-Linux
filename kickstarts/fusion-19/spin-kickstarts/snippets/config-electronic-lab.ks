# %post modifications specifically for Fedora Electronic Lab

# Fedora Electronic Lab: Kwin buttons
cat > /usr/share/kde-settings/kde-profile/default/share/config/kwinrc <<EOF
[Style]
ButtonsOnLeft=MB
ButtonsOnRight=FIAX
CustomButtonPositions=true
EOF

# kill klipper
cat > /usr/share/kde-settings/kde-profile/default/share/config/klipperrc <<EOF
[General]
AutoStart=false
EOF

# use the LCD_Style clock as alliance's windows demand a lot of space on kicker
cat > /usr/share/kde-settings/kde-profile/default/share/config/clock_panelappletrc <<EOF
[Digital]
LCD_Style=false
Show_Date=false
Show_Seconds=true

[General]
Type=Digital
EOF

cat > /usr/share/kde-settings/kde-profile/default/share/config/kxkbrc <<EOF
[Layout]
DisplayNames=
EnableXkbOptions=false
IncludeGroups=
LayoutList=us,de,fr,jp
Model=pc104
Options=
ResetOldOptions=false
ShowFlag=true
ShowSingle=true
StickySwitching=false
StickySwitchingDepth=2
SwitchMode=Global
Use=true
EOF

# Chitlesh doesn't like the KDE icon on the kicker, but fedora's
# This is a feature for Fedora and not for KDE
cp -fp /usr/share/icons/Bluecurve/16x16/apps/gnome-main-menu.png /usr/share/icons/crystalsvg/16x16/apps/kmenu.png
cp -fp /usr/share/icons/Bluecurve/24x24/apps/gnome-main-menu.png /usr/share/icons/crystalsvg/22x22/apps/kmenu.png
cp -fp /usr/share/icons/Bluecurve/32x32/apps/gnome-main-menu.png /usr/share/icons/crystalsvg/32x32/apps/kmenu.png
cp -fp /usr/share/icons/Bluecurve/48x48/apps/gnome-main-menu.png /usr/share/icons/crystalsvg/48x48/apps/kmenu.png

/sbin/chkconfig anacron off
/sbin/chkconfig sendmail off
/sbin/chkconfig nfs off
/sbin/chkconfig nfslock off
/sbin/chkconfig rpcidmapd off
/sbin/chkconfig rpcbind off
