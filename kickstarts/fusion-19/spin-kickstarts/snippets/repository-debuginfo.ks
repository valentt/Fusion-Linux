# %post modifications to enable debuginfo repository

awk '
BEGIN {
  debuginfo = 0
}
  /^\[.*\]/ {
  if (/debuginfo/) {
    debuginfo = 1
  } else {
    debuginfo = 0
  }
  print
  next
}
  /enabled=0/ && debuginfo {
  print "enabled=1"
  next
}
{
  print
  next
}' < /etc/yum.repos.d/fedora.repo > /etc/yum.repos.d/fedora.repo.tmp
mv /etc/yum.repos.d/fedora.repo{.tmp,}

