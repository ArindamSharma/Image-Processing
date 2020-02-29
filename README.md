# Image-Processing
Using Yolo and Darknet as the underlying codebase

#
*Used :-*[Darknet](https://github.com/pjreddie/darknet),[Darknet Architecture](https://pjreddie.com/media/files/darknet53.conv.74),[OpenCV](https://gist.github.com/8082bfe067b202b9162c419eb716582a.git)

*Refrence*:- [Custom object training and detection with YOLOv3, Darknet and OpenCV](https://blog.francium.tech/custom-object-training-and-detection-with-yolov3-darknet-and-opencv-41542f2ff44e)

## 
NOTE !! : Before running you should have a DIRECORY called “training” (without he quotes) that contains all the images with the respictive txt file (having the same name ,i.e for an image image1.png the text file will be named image1.txt) and a classes.txt file (contains all the classifier names). The txt files can be generated through various softwares, but for our work we had used LabelImg.

### Run [config-1.sh](config-1.sh) only once
It will download the necessary files from the darknet git hub repository and also a pre-trained architecture from darknet’s official website darknet53.conv.74 .(Total Download 166 MB.)

### Run [config-2.sh](config-2.sh)
It should be run whenever an update is made to the training directory.It collects all the new information and updates the necessay files that will be created inside darknet to train or test.

### Run [config-3.sh](config-3.sh)
To start the training process. (Make sure to run this again if any updates to the data sets are made and new weights are required.

By this time you should have got a waight file in the backup folder. now to go further you need to have sample folder. inside that you must have only one image that will be used for testing as test data.
### Run [config-4.sh](config-4.sh) 
To try detect an image from the trained data.

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
[ config-1 ](##config1),[ config-2 ](##config2),[ config-3 ](##config3),[ config-4 ](##config4)

# Description of each Files
## config1
clone the darknet repository https://github.com/pjreddie/darknet

then get default weight files from https://pjreddie.com/media/files/darknet53.conv.74
## config2
## config3
## config4
