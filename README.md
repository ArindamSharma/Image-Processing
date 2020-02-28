# Image-Processing
Using Yolo and Darknet as the underlying codebase
#
*Refrence*:- [Link](https://blog.francium.tech/custom-object-training-and-detection-with-yolov3-darknet-and-opencv-41542f2ff44e)
## 
before running you should have your own training Directory having all images withe respictive txt file(of same name) and a classes.txt file

### Run [config-1.sh](##config1) only once
File will download few required Files.
### Run [config-2.sh](##config2)
when ever there is a new traning data set.
### Run [config-3.sh](##config3)
when ever traning new data set is Required.
### Run [config-4.sh](##config4) 
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
### What each config files are doing 
[ config-1 ](#config1.sh),[ config-2 ](##config2),[ config-3 ](##config3),[ config-4 ](##config4)

# Description of each Files
## config1
## config2
## config3
## config4
