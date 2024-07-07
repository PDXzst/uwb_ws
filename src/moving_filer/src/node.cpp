#include "moving_filer.h"
#include <ros/ros.h>


using namespace moving_filer;


int main(int argc,char** argv){
    ros::init(argc,argv,"moving_filer_node");
    ros::NodeHandle nh;
    Moving_Filer filer(nh);
    ros::spin();
}