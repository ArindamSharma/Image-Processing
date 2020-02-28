#!/bin/bash
cd ../

var3=$(ls darknet| grep open*)
len2=${#var3}
if [ $len2 != '0' ] ; then
	echo "---File is already there---"
	# rm temp -R
else
	var=$(ls | grep temp)
	len=${#var}
	if [ $len == '4' ] ; then
		echo "---Updating few files---"
		rm temp -R
	else
		echo "---Make sure Internet is there---"
	fi
	# echo "---Make sure Internet is there---"
	git clone https://gist.github.com/8082bfe067b202b9162c419eb716582a.git temp
	cd temp
	var2=$(ls)
	mv $var2 ../darknet/$var2
	cd ../
	rm temp -R
fi

# sed -n '/--image/s/=.*.jpg/=custom_data\\image\\image1.jpg/p' opencv_yolo_detector.py 
