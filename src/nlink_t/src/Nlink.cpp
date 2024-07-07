#include "Nlink.h"

namespace Nlink{
nlink::nlink(ros::NodeHandle &_nh){
    nh = _nh;
    std::string topic_in,topic_out;
    ros::param::get("~uwb_in_topic", topic_in);
    ros::param::get("~uwb_out_topic", topic_out);
    sub_uwb_dis = nh.subscribe<nlink_parser::LinktrackNodeframe2>(topic_in,100,&nlink::uwb_cb,this);
    pub_uwb_dis = nh.advertise<uwb_msgs::uwb>(topic_out,100);
}
void nlink::uwb_cb(const nlink_parser::LinktrackNodeframe2ConstPtr& uwb_in){
    uwb_msgs::uwb uwb_t;
    uwb_t.uwb = *uwb_in;
    uwb_t.header.stamp = ros::Time::now();
    pub_uwb_dis.publish(uwb_t);
}


}; 
