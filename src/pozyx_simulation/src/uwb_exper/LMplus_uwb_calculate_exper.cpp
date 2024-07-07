#include "LMplus_uwb_calculate_exper.h"
//使用LM优化
namespace UWB_calculate{

uwb_calculate::uwb_calculate(ros::NodeHandle &_nh){
    nh = _nh;
    //按照编号从小到大填入UWB基站的坐标
    uwb_stations_.push_back(std::vector<double>({-0.53,-0.88,0}));//UWB0
    uwb_stations_.push_back(std::vector<double>({ 4.33,-0.88,0}));//UWB1
    uwb_stations_.push_back(std::vector<double>({ 4.33, 2.72,0}));//UWB2
    uwb_stations_.push_back(std::vector<double>({-0.53, 2.72,0}));//UWB3
//设置初始点,填入车上的tag大致的初始坐标
    x0 = {0, 0, 0};

    std::string topic;
    ros::param::get("~uwb_topic", topic);
    sub = nh.subscribe<uwb_msgs::uwb>(topic,10,&uwb_calculate::uwb_data_callback,this);
    uav_positon = nh.advertise<nav_msgs::Odometry>("uav_position",10);//输出定位坐标
    pose_sub = nh.subscribe<nav_msgs::Odometry>("uav_position",10,&uwb_calculate::pose_callback,this);
    
}



void uwb_calculate::levenbergMarquardt(UWBProblem& problem, double lambda, double tol, int max_iter) {
    Eigen::VectorXd x = Eigen::Map<Eigen::VectorXd>(problem.x.data(), problem.x.size());
    int n = x.size();
    int m = problem.ranges.size();
    Eigen::VectorXd fvec(m);
    Eigen::MatrixXd J(m, n);
    for (int iter = 0; iter < max_iter; ++iter) {
        // 计算误差向量和雅可比矩阵
        problem(x.data(), fvec.data());
        for (int i = 0; i < m; ++i) {
            for (int j = 0; j < n; ++j) {
                double h = 1e-6;
                Eigen::VectorXd x1 = x;
                x1(j) += h;
                Eigen::VectorXd fvec1(m);
                problem(x1.data(), fvec1.data());
                J(i, j) = (fvec1(i) - fvec(i)) / h;
            }
        }
        // 计算增量
        Eigen::MatrixXd JtJ = J.transpose() * J;
        Eigen::VectorXd Jtf = J.transpose() * fvec;
        JtJ.diagonal().array() += lambda;
        Eigen::VectorXd dx = -JtJ.ldlt().solve(Jtf);
        // 更新变量
        Eigen::VectorXd x_new = x + dx;
        // 判断是否收敛
        double err = fvec.squaredNorm();
        if (err < tol) {
            break;
        }
        // 更新lambda
        Eigen::VectorXd fvec_new(m);
        problem(x_new.data(), fvec_new.data());
        double err_new = fvec_new.squaredNorm();
        if (err_new < err) {
            lambda /= 10;
            x = x_new;
            fvec = fvec_new;
        } else {
            lambda *= 10;
        }
    }
    // 更新优化变量
    problem.x = std::vector<double>(x.data(), x.data() + x.size());
}


void uwb_calculate::uwb_data_callback(const uwb_msgs::uwb::ConstPtr& uwb_data_p){
    std::vector<double> uwb_range_;
    nlink_parser::LinktrackNodeframe2  uwb_data_(uwb_data_p -> uwb);
    if(uwb_data_.nodes.size() < 4){
        return;
    }
    for(int i=0;i<uwb_stations_.size();i++){
        
        uwb_range_.push_back(uwb_data_.nodes[i].dis);
        
    }
    problem.ranges = uwb_range_;
    problem.anchors = uwb_stations_;
    problem.x = x0;
    //进行优化
    double lambda = 0.1;
    double tol = 1e-6;
    int max_iter = 100;
    levenbergMarquardt(problem, lambda, tol, max_iter);
    // 输出优化结果

    nav_msgs::Odometry odom;
    odom.pose.pose.position.x = problem.x[0];
    odom.pose.pose.position.y = problem.x[1];
    odom.pose.pose.position.z = problem.x[2];
    odom.header.seq = 0;
    odom.header.stamp = uwb_data_p -> header.stamp;
    odom.header.frame_id = "odom";
    uav_positon.publish(odom);
}
void uwb_calculate::pose_callback(const nav_msgs::Odometry::ConstPtr& imu_data_p){
    x0[0] = imu_data_p->pose.pose.position.x;
    x0[1] = imu_data_p->pose.pose.position.y;
    x0[2] = imu_data_p->pose.pose.position.z;
};
}