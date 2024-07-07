#include <ros/ros.h>
#include <nav_msgs/Path.h>
#include <nav_msgs/Odometry.h>
#include <std_msgs/Float64.h>
#include <sensor_msgs/Range.h>
#include <uwb_msgs/uwb.h>
#include <nlink_parser/LinktrackNodeframe2.h>
ros::Publisher range_pub;    // 发布距离的节点
ros::Subscriber uwb_msg_sub;   // 接收uwb原始topic的节点


void uwb_cb(const nlink_parser::LinktrackNodeframe2::ConstPtr& uwb_in){
    nlink_parser::LinktrackNodeframe2 uwb_msg(*uwb_in);
    uwb_msgs::uwb range;
    range.header.stamp = ros::Time::now();
    range.dis = uwb_msg.nodes[0].dis;
    range_pub.publish(range);
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "odom_to_path");
    // 创建节点句柄，并设置命名空间
    ros::NodeHandle nh;

    // 定义参数变量
    std::string uwb_msg_topic;
    std::string range_topic;
    ros::param::get("~uwb_msg_topic", uwb_msg_topic);
    ros::param::get("~range_topic", range_topic);
    // 订阅odometry消息
    uwb_msg_sub = nh.subscribe<nlink_parser::LinktrackNodeframe2>(uwb_msg_topic, 100, uwb_cb);
    // 发布path消息
    range_pub = nh.advertise<uwb_msgs::uwb>(range_topic, 100, true);
    
    ros::spin();
    return 0;
}
