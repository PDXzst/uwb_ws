#ifndef LMPLUS_UWB_CALCULATE_EXP_H
#define LMPLUS_UWB_CALCULATE_EXP_H
#include <Eigen/Core>
#include <Eigen/Dense>
#include "ros/ros.h"
#include "pozyx_simulation/uwb_data.h"
#include <nav_msgs/Odometry.h>
#include <vector>
#include <std_msgs/Bool.h>
#include <sensor_msgs/Imu.h>
#include <nlink_parser/LinktrackNodeframe2.h>
#include <uwb_msgs/uwb.h>
namespace UWB_calculate{
// 定义非线性优化问题
struct UWBProblem {
    // 测量值
    std::vector<double> ranges;
    // anchor坐标
    std::vector<std::vector<double>> anchors;
    // 优化变量
    std::vector<double> x;
    // 重载()运算符，计算误差
    int operator()(const double* x, double* fvec) const {
        for (int i = 0; i < ranges.size(); ++i) {
            double r = ranges[i];
            std::vector<double> a = anchors[i];
            double dist = sqrt(pow(x[0] - a[0], 2) + pow(x[1] - a[1], 2) + pow(x[2] - a[2], 2));
            fvec[i] = dist - r;
        }
        return 0;
    }
};
class uwb_calculate{
public:
    uwb_calculate(ros::NodeHandle &_nh);
    std::vector<std::vector<double>> uwb_stations_;
    std::vector<double> x0;
    UWBProblem problem;

private:
    void uwb_data_callback(const uwb_msgs::uwb::ConstPtr& uwb_data_p);
    void pose_callback(const nav_msgs::Odometry::ConstPtr& imu_data_p);
    void levenbergMarquardt(UWBProblem& problem, double lambda, double tol, int max_iter);
    ros::NodeHandle nh;
    ros::Subscriber sub,pose_sub,imu_sub;
    ros::Publisher uav_positon,imu_pub;
    
}; 

}


#endif