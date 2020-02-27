#!/bin/bash
cd ../
var=$(ls | grep temp)
len=${#var}
if [ $len == '4' ] ; then
	echo "---Make sure Internet is there---"
	rm temp -R
else
	echo "---Make sure Internet is there---"
fi
git clone https://gist.github.com/8082bfe067b202b9162c419eb716582a.git temp
cd temp
var2=$(ls)
mv $var2 ../darknet/$var2
cd ../
rm temp -R
