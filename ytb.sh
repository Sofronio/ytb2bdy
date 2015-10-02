#!/bin/sh
#youtube-dl download and Baiduyun bypy auto upload
#Written by Sofronio

echo -n "youtube-dl start. Please input the youtube id\n"
read youtubeid

#set path as youtube-dl downlaod path
cd /root/y/

youtube-dl -F $youtubeid
echo -n "please select the combination of the video+audio\n"

#use VideoIdNum+AudioIdNum as the downlaod combination
read videoaudio
youtube-dl -f $videoaudio $youtubeid

#baiduyun upload start
echo -n "download complete, would you like to sync it up with bypy?\n"
echo -n "Yes/No\n"
read ans
case $ans in
y|Y|yes|Yes|YES)
	cd /root/y/
	bypy.py upload -v
	echo -n "Visit the following link for your video"
	echo -n "http://pan.baidu.com/disk/home#category/&path=%252Fapps\n"
	;;
n|N|no|No|NO)
	echo -n "Visit the following link for your video"
	echo -n "http://pan.baidu.com/disk/home#category/&path=%252Fapps\n"
	exit 0
	;;
esac
