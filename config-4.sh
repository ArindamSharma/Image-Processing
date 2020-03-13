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
		rm -R temp
	else
		echo "---Make sure Internet is there---"
	fi
	# echo "---Make sure Internet is there---"
	git clone https://gist.github.com/8082bfe067b202b9162c419eb716582a.git temp
	cd temp
	var2=$(ls)
	mv $var2 ../darknet/$var2
	cd ../
	rm -R temp
fi
f=darknet/opencv_yolo_detector.py
echo "Updating Files"
cd Image-Processing/sample
locvar=$(ls *)
cd ../../
sed -i "/--image/s/='.*'/='..\/Image-Processing\/sample\/$locvar'/g" $f
sed -i "/--config/s/='.*'/='custom_data\/cfg\/yolov3-custom.cfg'/g" $f

sed -i "/--names/s/='.*'/='custom_data\/custom.names'/g" $f
sed -i "/--weights/s/='.*'/='backup\/yolov3-custom_final.weights'/g" $f
echo "Done updating"
echo "---Starting Python Testor---"
cd darknet
var4=$(which pip)
var5=$(which pip3)
var5=${#var5}
var4=${#var4}
# var4=0
# echo $var4 $var5 $(( $var4 && $var5 ))
if [ $(( $var4 && $var5 )) == 1 ] ; then
	echo "Found pip"
	if [ $var5 != 0 ] ;then 
		echo "pip3 there"
		var6=$(pip3 list | grep opencv)
		if [ ${#var6} == 0 ] ; then
			echo "Open cv not present please install before procceding"
		else
			echo "Testing Image --"
			python3 opencv_yolo_detector.py
		fi
	else
		echo "pip3 not present "
		echo "try installing pip3 "
	fi
else 
	echo "You dont have pip installed in system"
	echo "Kindly install pip3 and run again "
fi
