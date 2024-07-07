#ifndef MOVING_FILER_H
#define MOVING_FILER_H
#include <Eigen/Dense>

#include <yaml-cpp/yaml.h>
#include <mutex>
#include <glog/logging.h>
#include <iomanip>
#include <stdlib.h>
#include <math.h>
#include <GeographicLib/LocalCartesian.hpp>
#include <nlink_parser/LinktrackNodeframe2.h>
#include <string>
#include <deque>
#include <ros/ros.h>
#include <mutex>
#include <uwb_msgs/uwb.h>
namespace moving_filer{
class Moving_Filer{
public:
    struct UWB_data{
        double stamp;
        float range;
    };
    Moving_Filer(ros::NodeHandle &_nh);
private:
    std::deque<nlink_parser::LinktrackNodeframe2> uwb_data;
    void uwb_cb(const uwb_msgs::uwb::ConstPtr& uwb_in);
    void check_data_number();
    void calculate_filer(nlink_parser::LinktrackNodeframe2 uwb_data_cal);
    nlink_parser::LinktrackNodeframe2 uwb_msg_process(nlink_parser::LinktrackNodeframe2 uwb_data_process_);
    double GuassianKernel(double mu, double sigma);
private:    
    ros::NodeHandle nh;
    ros::Subscriber sub_uwb_dis;
    ros::Publisher pub_uwb_dis;
    std::mutex mtx;
    uwb_msgs::uwb uwb_data_pub;
    float uwb_dis_pub0 = 0;
    unsigned int seed = 0;
    float uwb_dis_pub1 = 0;
    float uwb_dis_pub2 = 0;
    float uwb_dis_pub3 = 0;
    const float NUM = 5;//设置均值滤波核的大小
    bool init = false;

}; 

}


#endif