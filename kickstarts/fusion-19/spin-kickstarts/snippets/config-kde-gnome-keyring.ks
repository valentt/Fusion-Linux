# %post modifications to set up gnome-keyring in KDE

mkdir -p /etc/skel/.kde/env /etc/skel/.kde/shutdown
cat > /etc/skel/.kde/env/start-custom.sh << EOF
#!/bin/sh
eval \`gnome-keyring-daemon\`
export GNOME_KEYRING_PID
export GNOME_KEYRING_SOCKET
EOF
chmod 755 /etc/skel/.kde/env/start-custom.sh

cat > /etc/skel/.kde/shutdown/stop-custom.sh << EOF
#/bin/sh
if [-n "$GNOME_KEYRING_PID"]; then
	kill $GNOME_KEYRING_PID
fi
EOF

chmod 755 /etc/skel/.kde/shutdown/stop-custom.sh
