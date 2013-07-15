# %post modifications to create /etc/sysconfig/desktop for KDE

cat > /etc/sysconfig/desktop <<EOF
DESKTOP="KDE"
DISPLAYMANAGER="KDE"
EOF
