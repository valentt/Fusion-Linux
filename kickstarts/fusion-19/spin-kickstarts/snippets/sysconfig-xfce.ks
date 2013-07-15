# %post modifications to create /etc/sysconfig/desktop for XFCE

cat > /etc/sysconfig/desktop <<EOF
PREFERRED=/usr/bin/startxfce4
EOF
