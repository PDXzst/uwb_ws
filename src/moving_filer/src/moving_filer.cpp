#include "moving_filer.h"

namespace moving_filer{
Moving_Filer::Moving_Filer(ros::NodeHandle &_nh){
    nh = _nh;

    std::string topic_in,topic_out;
    ros::param::get("~uwb_in_topic", topic_in);
    ros::param::get("~uwb_out_topic", topic_out);
    sub_uwb_dis = nh.subscribe<uwb_msgs::uwb>(topic_in,100,&Moving_Filer::uwb_cb,this);
    pub_uwb_dis = nh.advertise<uwb_msgs::uwb>(topic_out,50);
}
void Moving_Filer::uwb_cb(const uwb_msgs::uwb::ConstPtr& uwb_in){
    nlink_parser::LinktrackNodeframe2 uwb_in_ros(uwb_in -> uwb);
    // if(!uwb_in_ros.nodes.empty()){
    //     mtx.lock();
    //     uwb_data.push_back(uwb_in_ros);
    //     mtx.unlock();
    //     check_data_number();
    // }
    if(uwb_in_ros.nodes.size() < 4){
        return;
    }
    if(uwb_in_ros.nodes.size() == 4){
        uwb_data.push_back(uwb_in_ros);
        uwb_data_pub.header.stamp = uwb_in -> header.stamp;
        check_data_number();
    }
}

//高斯噪声
double Moving_Filer::GuassianKernel(double mu, double sigma)
{
  // generation of two normalized uniform random variables
  double U1 = static_cast<double>(rand_r(&seed)) / static_cast<double>(RAND_MAX);
  double U2 = static_cast<double>(rand_r(&seed)) / static_cast<double>(RAND_MAX);

  // using Box-Muller transform to obtain a varaible with a standard normal distribution
  double Z0 = sqrt(-2.0 * ::log(U1)) * cos(2.0*M_PI * U2);

  // scaling
  Z0 = sigma * Z0 + mu;
  return Z0;
}

nlink_parser::LinktrackNodeframe2 Moving_Filer::uwb_msg_process(nlink_parser::LinktrackNodeframe2 uwb_data_process_){
    nlink_parser::LinktrackNodeframe2 uwb_data_after_process = uwb_data_process_;
    // uwb_data_after_process.nodes[0].dis -= 0.08;
    // uwb_data_after_process.nodes[1].dis -= 0.02;
    // uwb_data_after_process.nodes[2].dis -= 0.20;
    // uwb_data_after_process.nodes[3].dis -= 0.09;
    uwb_data_after_process.nodes[0].dis -= 0;
    uwb_data_after_process.nodes[1].dis -= 0;
    //uwb_data_after_process.nodes[2].dis += GuassianKernel(0.2,0.2);
    uwb_data_after_process.nodes[3].dis -= 0;
    return uwb_data_after_process;

}
void Moving_Filer::check_data_number(){
    if(uwb_data.size() < NUM){
        uwb_data_pub.uwb = uwb_data.back();
        uwb_data_pub.uwb = uwb_msg_process(uwb_data_pub.uwb);
        pub_uwb_dis.publish(uwb_data_pub);
        return;
    }
    else if(uwb_data.size() == NUM){
        if(!init){
            for(int i=0;i<NUM;i++){
                uwb_dis_pub0 += uwb_data[i].nodes[0].dis;
                uwb_dis_pub1 += uwb_data[i].nodes[1].dis;
                uwb_dis_pub2 += uwb_data[i].nodes[2].dis;
                uwb_dis_pub3 += uwb_data[i].nodes[3].dis;
            }
            init = true;

            uwb_data_pub.uwb = uwb_data.back();//取最后的测量信号作为时间戳

            uwb_dis_pub0 /= NUM;
            uwb_dis_pub1 /= NUM;
            uwb_dis_pub2 /= NUM;
            uwb_dis_pub3 /= NUM;

            uwb_data_pub.uwb.nodes[0].dis = uwb_dis_pub0;
            uwb_data_pub.uwb.nodes[1].dis = uwb_dis_pub1;
            uwb_data_pub.uwb.nodes[2].dis = uwb_dis_pub2;
            uwb_data_pub.uwb.nodes[3].dis = uwb_dis_pub3;
            uwb_data_pub.uwb = uwb_msg_process(uwb_data_pub.uwb);
            pub_uwb_dis.publish(uwb_data_pub);

            uwb_dis_pub0 -= uwb_data[0].nodes[0].dis/NUM;
            uwb_dis_pub1 -= uwb_data[0].nodes[1].dis/NUM;
            uwb_dis_pub2 -= uwb_data[0].nodes[2].dis/NUM;
            uwb_dis_pub3 -= uwb_data[0].nodes[3].dis/NUM;

            uwb_data.pop_front();
        }
        else{
            uwb_dis_pub0 += uwb_data.back().nodes[0].dis/NUM;
            uwb_dis_pub1 += uwb_data.back().nodes[1].dis/NUM;
            uwb_dis_pub2 += uwb_data.back().nodes[2].dis/NUM;
            uwb_dis_pub3 += uwb_data.back().nodes[3].dis/NUM;

            uwb_data_pub.uwb =  uwb_data.back();

            uwb_data_pub.uwb.nodes[0].dis = uwb_dis_pub0;
            uwb_data_pub.uwb.nodes[1].dis = uwb_dis_pub1;
            uwb_data_pub.uwb.nodes[2].dis = uwb_dis_pub2;
            uwb_data_pub.uwb.nodes[3].dis = uwb_dis_pub3;
            uwb_data_pub.uwb = uwb_msg_process(uwb_data_pub.uwb);
            pub_uwb_dis.publish(uwb_data_pub);

            uwb_dis_pub0 -= uwb_data[0].nodes[0].dis/NUM;
            uwb_dis_pub1 -= uwb_data[0].nodes[1].dis/NUM;
            uwb_dis_pub2 -= uwb_data[0].nodes[2].dis/NUM;
            uwb_dis_pub3 -= uwb_data[0].nodes[3].dis/NUM;

            uwb_data.pop_front();
        }
    }
}
}; 
