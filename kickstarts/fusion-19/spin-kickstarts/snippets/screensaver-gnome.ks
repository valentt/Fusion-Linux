# %post modifications to disable GNOME screensaver locking

cat >> /etc/rc.d/init.d/fedora-live << EOF
gconftool-2 --direct --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults -s -t bool /apps/gnome-screensaver/lock_enabled false >/dev/null
EOF
