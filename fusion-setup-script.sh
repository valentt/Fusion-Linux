#!/bin/bash

cd ~
mkdir .fusionlinux
cd .fusionlinux
curl https://github.com/valentt/Fusion-Linux/tarball/master -L -o fusion-linux.tar.gz
tar xvzf fusion-linux.tar.gz
cd valentt-*/fusion-creator/
sh fusion-creator
