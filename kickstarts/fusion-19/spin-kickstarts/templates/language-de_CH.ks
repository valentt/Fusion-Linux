# %post language-modifications for de_DE-spins

# system-config-keyboard doesn't really work (missing xorg.conf etc)
cat >>/etc/X11/xorg.conf << EOF
Section "InputDevice"
    Identifier "Keyboard0"
    Driver "kbd"
    Option	    "XkbLayout" "ch"
    Option	    "XkbVariant" "de_nodeadkeys"
EndSection
EOF
