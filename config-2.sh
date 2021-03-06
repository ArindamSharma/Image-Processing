#!/bin/bash

echo "NOTE!, it is assumed that you have a folder called training that contains both the images and the necesary text files obtained from training."
# read -p "enter the folder name :- " dir
dir="traning"
cd ../darknet
v=$(ls | grep custom_data)
len=${#v}
if [ $len == '11' ] ; then
	echo "---Updating Custom Data Directory---"
	rm -R custom_data
else
	echo "---Making Custom Data Directory---"
fi
mkdir custom_data
cd custom_data
mkdir images
mkdir labels
cd ../../Image-Processing

read -p "Enter the Percentage of Test Data Set( vs Traning Data Set ):- " p
# the rest will be traning data set

cd $dir
total=$(ls ima*.txt | sed 's/i/custom_data\\images\\i/' | wc -l)
r=$(($total*$p/100))

echo "Test Data "$p'% = '$r 
echo 'Train Data '$((100-$p))'% = '$(($total-$r))
r=$(($r+1))
a=${r}',$d'
b=${r}',$p'
# ls ima*.txt | sed 's/i/custom_data\\image\\i/'
ls ima*.txt | sed 's/i/custom_data\/images\/i/' | sed $a | sed 's/.txt/.jpg/g' >>../../darknet/custom_data/test.txt
echo "Test data created"
# ls ima*.txt | sed 's/i/custom_data\\image\\i/' | sed '7,$d'

# ls ima*.txt | sed 's/i/custom_data\\image\\i/' | sed -n '7,$p'
ls ima*.txt | sed 's/i/custom_data\/images\/i/' | sed -n $b | sed 's/.txt/.jpg/g' >>../../darknet/custom_data/train.txt
echo "Train data created"

var1=$(ls im*.txt |  sed 's/.txt/.jpg/')
cp $var1 ../../darknet/custom_data/images
echo "images copyed"

var2=$(ls im*.txt)
cp $var2 ../../darknet/custom_data/labels
echo "images txt(data) file copyed"

cat classes.txt >> ../../darknet/custom_data/custom.names
echo "labels created"

var3=$(cat classes.txt | wc -l)
echo "classes="$var3 >>../../darknet/custom_data/detector.data
echo "train=custom_data/train.txt
valid=custom_data/test.txt
names=custom_data/custom.names
backup=backup/" >> ../../darknet/custom_data/detector.data

echo "detector created"
mkdir ../../darknet/custom_data/cfg
# echo "Select Yolo Version
# 1.Yolo V1
# 2.Yolo V2
# 3.Yolo V3"
# read -p "Choice :- " var4
# iter=1
iter=2
# iter=502000
var4=4
if [ $var4 == '1' ]
then
    cp ../../darknet/cfg/yolov1.cfg ../../darknet/custom_data/cfg/yolov1-custom.cfg
    echo "Yolo V1"
    file='yolov1-custom.cfg'
elif [ $var4 == '2' ]
then
    cp ../../darknet/cfg/yolov2.cfg ../../darknet/custom_data/cfg/yolov2-custom.cfg
    echo "Yolo V2"
    file='yolov2-custom.cfg'

else
    cp ../../darknet/cfg/yolov3.cfg ../../darknet/custom_data/cfg/yolov3-custom.cfg
    echo "Yolo V3 confiugration started "
    file='yolov3-custom.cfg'
fi
cd ../../darknet/custom_data/cfg
echo "Total Iterations :- "$iter
sed -i "20s/m.*/max_batches= $iter/g" $file

var13="$((80*$iter/100)),$((90*$iter/100))"
echo "steps :- "$var13
sed -i "22s/s.*/steps= $var13/g" $file

var14=$(sed -n '/yolo/=' $file) 
var15=$(( ($var3+5)*3 ))
for i in $var14
do
    # echo $i
    tmp=$(($i+3))
    tmp1=$(($i-4))
    sed -i "${tmp1}s/f/filters=$var15 # f/g" $file
    sed -i "${tmp}s/c/classes=$var3 # c/g" $file
done

echo "config finished"
printf "============================\n"
cd ../../../