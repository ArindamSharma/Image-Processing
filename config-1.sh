#!/bin/bash
git clone https://github.com/pjreddie/darknet
cd darknet/src
sed -i "426s/str.*/strcpy(copy, s);/g" utils.c
cd ../
# rm .git
make
rm .git -R