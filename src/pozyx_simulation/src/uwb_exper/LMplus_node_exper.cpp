#include "LMplus_uwb_calculate_exper.h"
#include <ros/ros.h>


using namespace UWB_calculate;


int main(int argc,char** argv){
    ros::init(argc,argv,"uwb_calculate");
    ros::NodeHandle nh;
    uwb_calculate uwb_cal(nh);
    ros::spin();
}
