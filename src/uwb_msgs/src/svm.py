#! /usr/bin/python3

import rospy
from uwb_msgs.msg import uwb
import pandas as pd
import numpy as np
from std_msgs.msg import Bool
my_inp=np.array([-81,-77,1])
# mu=np.array([-81.8838485882874,-78.8121328928743,2.10868485099182])
# sigma=np.array([1.13016195002675,0.399636425971474,0.770773670628301])
# bias=-0.7734
mu=np.array([-83.6023,-78.6480,2.0744])
sigma=np.array([2.7086,0.4584,0.5673])
bias=0.5203

data = pd.read_excel('/home/robot/ros_ws/biyesheji_ws/src/uwb_msgs/src/SupportVectors_t.xlsx')
SupportVectors = np.array(data)
data = pd.read_excel('/home/robot/ros_ws/biyesheji_ws/src/uwb_msgs/src/alpha_t.xlsx')
alpha = np.array(data)
alpha = np.squeeze(alpha, axis=1)  # 去掉指定维度
pub=rospy.Publisher("my_los",Bool,queue_size=10)
def douwb(u):
    my_inp=np.array([u.fp_avg,u.rx_avg,u.dis_avg])    
    my_inp=my_inp-mu
    my_inp=my_inp/sigma
    SupportVectors1=SupportVectors-my_inp
    SupportVectors_squared = -np.square(SupportVectors1).sum(axis=1)
    test_k=np.exp(SupportVectors_squared)
    score=np.sum(alpha*test_k)+bias
    los=Bool()
    los.data = (score>0)
    pub.publish(los)
    # if(score<0):
    #     print("nlos")
    # else:
    #     print("los")
if __name__ == "__main__":
    rospy.init_node("svm_nlos")
    sub=rospy.Subscriber("/my_uwb",uwb,douwb,queue_size=10)

    rospy.spin()
