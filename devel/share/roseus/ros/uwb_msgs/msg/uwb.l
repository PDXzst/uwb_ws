;; Auto-generated. Do not edit!


(when (boundp 'uwb_msgs::uwb)
  (if (not (find-package "UWB_MSGS"))
    (make-package "UWB_MSGS"))
  (shadow 'uwb (find-package "UWB_MSGS")))
(unless (find-package "UWB_MSGS::UWB")
  (make-package "UWB_MSGS::UWB"))

(in-package "ROS")
;;//! \htmlinclude uwb.msg.html
(if (not (find-package "NLINK_PARSER"))
  (ros::roseus-add-msgs "nlink_parser"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass uwb_msgs::uwb
  :super ros::object
  :slots (_header _uwb _role _id _dis _fp_rssi _rx_rssi _dis_avg _fp_avg _rx_avg ))

(defmethod uwb_msgs::uwb
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:uwb __uwb) (instance nlink_parser::LinktrackNodeframe2 :init))
    ((:role __role) 0)
    ((:id __id) 0)
    ((:dis __dis) 0.0)
    ((:fp_rssi __fp_rssi) 0.0)
    ((:rx_rssi __rx_rssi) 0.0)
    ((:dis_avg __dis_avg) 0.0)
    ((:fp_avg __fp_avg) 0.0)
    ((:rx_avg __rx_avg) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _uwb __uwb)
   (setq _role (round __role))
   (setq _id (round __id))
   (setq _dis (float __dis))
   (setq _fp_rssi (float __fp_rssi))
   (setq _rx_rssi (float __rx_rssi))
   (setq _dis_avg (float __dis_avg))
   (setq _fp_avg (float __fp_avg))
   (setq _rx_avg (float __rx_avg))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:uwb
   (&rest __uwb)
   (if (keywordp (car __uwb))
       (send* _uwb __uwb)
     (progn
       (if __uwb (setq _uwb (car __uwb)))
       _uwb)))
  (:role
   (&optional __role)
   (if __role (setq _role __role)) _role)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:dis
   (&optional __dis)
   (if __dis (setq _dis __dis)) _dis)
  (:fp_rssi
   (&optional __fp_rssi)
   (if __fp_rssi (setq _fp_rssi __fp_rssi)) _fp_rssi)
  (:rx_rssi
   (&optional __rx_rssi)
   (if __rx_rssi (setq _rx_rssi __rx_rssi)) _rx_rssi)
  (:dis_avg
   (&optional __dis_avg)
   (if __dis_avg (setq _dis_avg __dis_avg)) _dis_avg)
  (:fp_avg
   (&optional __fp_avg)
   (if __fp_avg (setq _fp_avg __fp_avg)) _fp_avg)
  (:rx_avg
   (&optional __rx_avg)
   (if __rx_avg (setq _rx_avg __rx_avg)) _rx_avg)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; nlink_parser/LinktrackNodeframe2 _uwb
    (send _uwb :serialization-length)
    ;; uint8 _role
    1
    ;; uint8 _id
    1
    ;; float32 _dis
    4
    ;; float32 _fp_rssi
    4
    ;; float32 _rx_rssi
    4
    ;; float32 _dis_avg
    4
    ;; float32 _fp_avg
    4
    ;; float32 _rx_avg
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; nlink_parser/LinktrackNodeframe2 _uwb
       (send _uwb :serialize s)
     ;; uint8 _role
       (write-byte _role s)
     ;; uint8 _id
       (write-byte _id s)
     ;; float32 _dis
       (sys::poke _dis (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _fp_rssi
       (sys::poke _fp_rssi (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rx_rssi
       (sys::poke _rx_rssi (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _dis_avg
       (sys::poke _dis_avg (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _fp_avg
       (sys::poke _fp_avg (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rx_avg
       (sys::poke _rx_avg (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; nlink_parser/LinktrackNodeframe2 _uwb
     (send _uwb :deserialize buf ptr-) (incf ptr- (send _uwb :serialization-length))
   ;; uint8 _role
     (setq _role (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _dis
     (setq _dis (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _fp_rssi
     (setq _fp_rssi (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rx_rssi
     (setq _rx_rssi (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dis_avg
     (setq _dis_avg (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _fp_avg
     (setq _fp_avg (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rx_avg
     (setq _rx_avg (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get uwb_msgs::uwb :md5sum-) "ddc35d181e42e0b27867e8ec3bbe2456")
(setf (get uwb_msgs::uwb :datatype-) "uwb_msgs/uwb")
(setf (get uwb_msgs::uwb :definition-)
      "Header header
nlink_parser/LinktrackNodeframe2 uwb
uint8 role
uint8 id
float32 dis
float32 fp_rssi
float32 rx_rssi
float32 dis_avg
float32 fp_avg
float32 rx_avg
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: nlink_parser/LinktrackNodeframe2
uint8 role
uint8 id
uint32 local_time
uint32 system_time
float32 voltage
float32[3] pos_3d
float32[3] eop_3d
float32[3] vel_3d
float32[3] angle_3d
float32[4] quaternion
float32[3] imu_gyro_3d
float32[3] imu_acc_3d
LinktrackNode2[] nodes

================================================================================
MSG: nlink_parser/LinktrackNode2
uint8 role
uint8 id
float32 dis
float32 fp_rssi
float32 rx_rssi

")



(provide :uwb_msgs/uwb "ddc35d181e42e0b27867e8ec3bbe2456")


