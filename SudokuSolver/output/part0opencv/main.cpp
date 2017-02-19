//
//  main.cpp
//  part0
//
//  Created by Geethanjali Jeevanatham on 2/7/16.
//  Copyright © 2016 Geethanjali Jeevanatham. All rights reserved.
//

#include <iostream>
#include <opencv2/opencv.hpp>

using namespace cv;
using namespace std;

int main(int argc, const char * argv[]) {
    
    Mat img = imread("/Users/geethanjalijeevanatham/Documents/Helloworld/myopenCV/part0/Warmup1.JPG");
    
    if(img.empty()){
        cout<<"Error: Image cannot be loaded"<<endl;
        return -1;
    }
    
    namedWindow("myWindow",CV_WINDOW_AUTOSIZE);
    imshow("myWindow",img);                       //Displays original image
    
    Mat dest(img.size(),img.type());
    threshold(img, dest, 255*0.5, 255, THRESH_BINARY);
    
    Mat erode_dest(dest.size(),dest.type());
    Mat element = getStructuringElement(MORPH_RECT, Size(3,3));
    erode(dest, erode_dest, element);
    
    
    Mat im_floodfill = erode_dest.clone();
    floodFill(im_floodfill, Point(0,0), CV_RGB(255,255,255));
    
    Mat im_floodfill_inv;
    dilate(im_floodfill,im_floodfill,element);
    bitwise_not(im_floodfill, im_floodfill_inv);
    Mat im_out = (dest|im_floodfill_inv);
    threshold(im_out, im_out, 255*0.5, 255, THRESH_BINARY);
    namedWindow("myWindow2",CV_WINDOW_AUTOSIZE);
    imshow("myWindow2",im_floodfill);                  //Displays the numbers
    
    namedWindow("myWindowErode",CV_WINDOW_AUTOSIZE);
    imshow("myWindowErode",im_out);                    //Displays the grids
    
    waitKey(0);
    
    destroyWindow("myWindow");
    
    return 0;
}
