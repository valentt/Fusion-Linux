#!/bin/bash

username=$USER$(echo $RANDOM|cut -c 1-3)
username2=$USER$(echo $RANDOM|cut -c 1-3)

cat >> ~.xchat2/xchat.conf << FOE
irc_nick1 = $username
irc_nick2 = $username2
irc_real_name = $username
irc_user_name = $username
FOE
