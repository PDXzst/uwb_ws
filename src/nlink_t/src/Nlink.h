#ifndef NLINK_H
#define NLINK_H
#include <Eigen/Dense>

#include <yaml-cpp/yaml.h>
#include <mutex>
#include <glog/logging.h>
#include <iomanip>
#include <stdlib.h>
#include <math.h>
#include <GeographicLib/LocalCartesian.hpp>
#include <nlink_parser/LinktrackNodeframe2.h>
#include <uwb_msgs/uwb.h>
#include <string>
#include <deque>
#include <ros/ros.h>
#include <mutex>

namespace Nlink{
class nlink{
public:
    nlink(ros::NodeHandle &_nh);
private:
    void uwb_cb(const nlink_parser::LinktrackNodeframe2ConstPtr& uwb_in);
private:    
    ros::NodeHandle nh;
    ros::Subscriber sub_uwb_dis;
    ros::Publisher pub_uwb_dis;
}; 

}


#endif