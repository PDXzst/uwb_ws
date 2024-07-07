#include<ros/ros.h>
#include<nlink_parser/LinktrackNodeframe2.h>
#include<uwb_msgs/uwb.h>
float uwb[11][3];
int count=1;

ros::Publisher uwb_pub ;

uwb_msgs::uwb my_uwb;

void uwbgetCallback(const nlink_parser::LinktrackNodeframe2 &msg)
{
    if(msg.nodes.empty())
    {
        return ;
    }
    
    uwb[count][0]=msg.nodes[0].fp_rssi;
    uwb[count][1]=msg.nodes[0].rx_rssi;
    uwb[count][2]=msg.nodes[0].dis;
    if(count==10)
    {
        for(int i=1;i<=10;i++)
        {
            uwb[0][0]+=uwb[i][0];
            uwb[0][1]+=uwb[i][1];
            uwb[0][2]+=uwb[i][2];
        }
        my_uwb.fp_avg = uwb[0][0]/10;
        my_uwb.rx_avg = uwb[0][1]/10;
        my_uwb.dis_avg = uwb[0][2]/10;
        uwb[0][0]=0;
        uwb[0][1]=0;
        uwb[0][2]=0;
        uwb_pub.publish(my_uwb);
        count = 1;
    }
    else 
        count++;
    
}
int main(int argc, char** argv )
{
    ros::init(argc, argv, "uwb_get");
    ros::NodeHandle nh;
    uwb_pub = nh.advertise<uwb_msgs::uwb>("/my_uwb",10);
    ros::Subscriber uwb_get=nh.subscribe("/nlink_linktrack_nodeframe2",10,uwbgetCallback);
    ros::spin();
    return 0;
}