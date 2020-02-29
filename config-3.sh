echo "Traning Starting "
cd ../darknet
# ./darknet detector train custom_data/detector.data custom_data/cfg/yolov3-custom.cfg darknet53.conv.74
./darknet detector train custom_data/detector.data custom_data/cfg/yolov3-custom.cfg
# ./darknet detector test custom_data/detector.data custom_data/cfg/yolov3-custom.cfg darknet53.conv.74