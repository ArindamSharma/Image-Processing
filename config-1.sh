#!/bin/bash
cd ../
var=$(ls | grep darknet)
len=${#var}
if [ $len == '7' ] ; then
	echo "---Make sure Internet is there---"
	rm -R darknet
else
	echo "---Make sure Internet is there---"
fi
git clone https://github.com/pjreddie/darknet
cd darknet/src
sed -i "426s/str.*/strcpy(copy, s);/g" utils.c
cd ../
# rm .git
make
rm -R .git
rm README.md
echo "Downloading Darknet Architecture"
wget https://pjreddie.com/media/files/darknet53.conv.74