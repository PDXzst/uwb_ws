#include "Nlink.h"
#include <ros/ros.h>


using namespace Nlink;


int main(int argc,char** argv){
    ros::init(argc,argv,"nlink_node");
    ros::NodeHandle nh;
    nlink filer(nh);
    ros::spin();
}