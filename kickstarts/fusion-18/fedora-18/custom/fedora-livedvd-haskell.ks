%include ../fedora-livecd-desktop.ks

part / --size 6000

%packages
@haskell
cpphs
ghc-*-devel
hugs98*
xmobar
xmonad
@development-tools
@fedora-packager
devhelp
emacs-haskell-mode
xchat-gnome
%end
