# Fusion big packages
# If you wish to make a more stream-lined Fusion Linux just don't include this file

%packages

# office apps
@office # LiberOffice suite, 417 M
#abiword
#gnumeric

# internet apps
#chromium # 92 M
#google-chrome-stable
#chromium-browser
thunderbird # 46 M

# graphics and photo apps
blender # 3D modeling, visualization and animation, 24 M
gimp # most powerful open source image editor 50 M
# additional GIMP plugins 14 M
gimp-data-extras
gimp-fourier-plugin
gimpfx-foundry
gimp-resynthesizer
gimp-lqr-plugin
GREYCstoration-gimp
ufraw-gimp
scribus # 43 M
inkscape # 36.6 M
# inkscape-docs # examples and demos, 37 M
#hugin # Photo panorama application, 49 M
#kipi-plugins

# audio apps
banshee # has mono as dependency, 25 M
#rhythmbox # audio player, 11 M
# hydrogen # advanced drum machine for Linux, has java-1.5.0 as dependency (48 M), 9.5 M
# hydrogen-drumkits # additional drum kit sounds for hydrogen, 20 M

# video editing apps
avidemux # video editing app, 25 M
openshot # premier video editing app for linux desktop, 32 M

# KDE apps
kdelibs # base for other KDE apps 63 M
k3b-extras-freeworld # best CD/DVD/Blu-ray burning app for Linux, 55 M ( + kdelibs + deps 117 M)
krusader # best file manager, similar to windows commander but more powerful, 22 M
kdiff3 # Compare + merge 2 or 3 files or directories, 4.3 M
kdeutils # filelight is obsoleted by kdeutils, filelight visualizes diskspace usage
kdeedu-marble # Marble is desktop atlas and globe, 22 M
# kdeutils-filelight # vizualizes used file space

# education
stellarium # Photo-realistic planetarium 40 M
# celestia # Celestia is a real-time space simulation which lets you experience the universe in three dimensions, 34 M
# SolarModel # Solar Model provides realtime modeling of the solar system, 7.2 M
# stars # KStars is a Desktop Planetarium, 25 M

# Java 1.6 (85 M)
java-1.6.0-openjdk
jline
rhino
tzdata-java

# minimal development package, 34 M
make
binutils
gcc
glibc-devel
glibc-headers
libgomp
patch
kernel-headers
kernel-devel

wine # 83 M
#playonlinux # Run your Windows applications on Linux easily via wine 6 M

