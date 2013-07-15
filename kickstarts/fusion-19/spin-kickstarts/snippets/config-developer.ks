# %post modifications to add link to demonstration videos to desktop

cat >> /etc/rc.d/init.d/fedora-live << EOF
pushd /home/fedora/Desktop
ln -s /usr/share/eclipse-demos-0.0.1 "Eclipse demonstration videos"
popd
EOF
