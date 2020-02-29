echo "Traning Starting "
cd ../darknet
echo "Chose among the Following"
echo "1.Traing a data set with darknet Architecture"
echo "2.Traing a data set without darknet Architecture"
echo "3.Test a data set"
read -p "Your Choice :- " var
if [ $var == '1' ] ; then
	./darknet detector train custom_data/detector.data custom_data/cfg/yolov3-custom.cfg darknet53.conv.74
elif [ $var == '2' ] ; then
	./darknet detector train custom_data/detector.data custom_data/cfg/yolov3-custom.cfg
elif [ $var == '3' ] ; then
	# ./darknet detector test custom_data/detector.data custom_data/cfg/yolov3-custom.cfg darknet53.conv.74
	./darknet detector test custom_data/detector.data custom_data/cfg/yolov3-custom.cfg backup/yolov3-custom_final.weights ../Image-Processing/sample/test.jpg
else
	echo "Wrong Choice"
fi
