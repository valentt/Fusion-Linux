# %post modifications to configure tracker search

mkdir -p /home/fedora/.config/tracker

cat > /home/fedora/.config/tracker/tracker.cfg <<EOF
[Indexing]
EnableIndexing=false
Language=en
EOF

mkdir -p /root/.config/tracker
cat > /root/.config/tracker/tracker.cfg <<EOF
[Indexing]
EnableIndexing=false
Language=en
EOF
