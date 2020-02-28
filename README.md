# Image-Processing
Using Yolo and Darknet as the underlying codebase
#
*Refrence*:- [Link](https://blog.francium.tech/custom-object-training-and-detection-with-yolov3-darknet-and-opencv-41542f2ff44e)
## 
before running you should have your own training Directory having all images withe respictive txt file(of same name) and a classes.txt file

### Run config-1.sh only once
File will download few required Files 
### Run config-2.sh 
when ever there is a new traning data set
### Run config-3.sh 
when ever traning data set is Required
### Run config-4.sh 
when detection a image with our custom training data set.

inside config-4 we initailly need to insert 
- the image path which is going to be tested
- the yolo custom cfg file path
- the weights path which we created
- the custom names file consist of all classes 
## How to Run .sh files
```bash
./config-1.sh
./config-2.sh
./config-3.sh
./config-4.sh
```
# What each config files are doing 
[ config-1 ](README1.md) 

[ config-2 ](README2.md)

[ config-3 ](README3.md)

[ config-4 ](README4.md)