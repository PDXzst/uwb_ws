; Auto-generated. Do not edit!


(cl:in-package uwb_msgs-msg)


;//! \htmlinclude uwb.msg.html

(cl:defclass <uwb> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (uwb
    :reader uwb
    :initarg :uwb
    :type nlink_parser-msg:LinktrackNodeframe2
    :initform (cl:make-instance 'nlink_parser-msg:LinktrackNodeframe2))
   (role
    :reader role
    :initarg :role
    :type cl:fixnum
    :initform 0)
   (id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (dis
    :reader dis
    :initarg :dis
    :type cl:float
    :initform 0.0)
   (fp_rssi
    :reader fp_rssi
    :initarg :fp_rssi
    :type cl:float
    :initform 0.0)
   (rx_rssi
    :reader rx_rssi
    :initarg :rx_rssi
    :type cl:float
    :initform 0.0)
   (dis_avg
    :reader dis_avg
    :initarg :dis_avg
    :type cl:float
    :initform 0.0)
   (fp_avg
    :reader fp_avg
    :initarg :fp_avg
    :type cl:float
    :initform 0.0)
   (rx_avg
    :reader rx_avg
    :initarg :rx_avg
    :type cl:float
    :initform 0.0))
)

(cl:defclass uwb (<uwb>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <uwb>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'uwb)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name uwb_msgs-msg:<uwb> is deprecated: use uwb_msgs-msg:uwb instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <uwb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msgs-msg:header-val is deprecated.  Use uwb_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'uwb-val :lambda-list '(m))
(cl:defmethod uwb-val ((m <uwb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msgs-msg:uwb-val is deprecated.  Use uwb_msgs-msg:uwb instead.")
  (uwb m))

(cl:ensure-generic-function 'role-val :lambda-list '(m))
(cl:defmethod role-val ((m <uwb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msgs-msg:role-val is deprecated.  Use uwb_msgs-msg:role instead.")
  (role m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <uwb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msgs-msg:id-val is deprecated.  Use uwb_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'dis-val :lambda-list '(m))
(cl:defmethod dis-val ((m <uwb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msgs-msg:dis-val is deprecated.  Use uwb_msgs-msg:dis instead.")
  (dis m))

(cl:ensure-generic-function 'fp_rssi-val :lambda-list '(m))
(cl:defmethod fp_rssi-val ((m <uwb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msgs-msg:fp_rssi-val is deprecated.  Use uwb_msgs-msg:fp_rssi instead.")
  (fp_rssi m))

(cl:ensure-generic-function 'rx_rssi-val :lambda-list '(m))
(cl:defmethod rx_rssi-val ((m <uwb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msgs-msg:rx_rssi-val is deprecated.  Use uwb_msgs-msg:rx_rssi instead.")
  (rx_rssi m))

(cl:ensure-generic-function 'dis_avg-val :lambda-list '(m))
(cl:defmethod dis_avg-val ((m <uwb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msgs-msg:dis_avg-val is deprecated.  Use uwb_msgs-msg:dis_avg instead.")
  (dis_avg m))

(cl:ensure-generic-function 'fp_avg-val :lambda-list '(m))
(cl:defmethod fp_avg-val ((m <uwb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msgs-msg:fp_avg-val is deprecated.  Use uwb_msgs-msg:fp_avg instead.")
  (fp_avg m))

(cl:ensure-generic-function 'rx_avg-val :lambda-list '(m))
(cl:defmethod rx_avg-val ((m <uwb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader uwb_msgs-msg:rx_avg-val is deprecated.  Use uwb_msgs-msg:rx_avg instead.")
  (rx_avg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <uwb>) ostream)
  "Serializes a message object of type '<uwb>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'uwb) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'role)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dis))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fp_rssi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rx_rssi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dis_avg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fp_avg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rx_avg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <uwb>) istream)
  "Deserializes a message object of type '<uwb>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'uwb) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'role)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dis) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fp_rssi) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rx_rssi) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dis_avg) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fp_avg) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rx_avg) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<uwb>)))
  "Returns string type for a message object of type '<uwb>"
  "uwb_msgs/uwb")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'uwb)))
  "Returns string type for a message object of type 'uwb"
  "uwb_msgs/uwb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<uwb>)))
  "Returns md5sum for a message object of type '<uwb>"
  "ddc35d181e42e0b27867e8ec3bbe2456")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'uwb)))
  "Returns md5sum for a message object of type 'uwb"
  "ddc35d181e42e0b27867e8ec3bbe2456")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<uwb>)))
  "Returns full string definition for message of type '<uwb>"
  (cl:format cl:nil "Header header~%nlink_parser/LinktrackNodeframe2 uwb~%uint8 role~%uint8 id~%float32 dis~%float32 fp_rssi~%float32 rx_rssi~%float32 dis_avg~%float32 fp_avg~%float32 rx_avg~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: nlink_parser/LinktrackNodeframe2~%uint8 role~%uint8 id~%uint32 local_time~%uint32 system_time~%float32 voltage~%float32[3] pos_3d~%float32[3] eop_3d~%float32[3] vel_3d~%float32[3] angle_3d~%float32[4] quaternion~%float32[3] imu_gyro_3d~%float32[3] imu_acc_3d~%LinktrackNode2[] nodes~%~%================================================================================~%MSG: nlink_parser/LinktrackNode2~%uint8 role~%uint8 id~%float32 dis~%float32 fp_rssi~%float32 rx_rssi~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'uwb)))
  "Returns full string definition for message of type 'uwb"
  (cl:format cl:nil "Header header~%nlink_parser/LinktrackNodeframe2 uwb~%uint8 role~%uint8 id~%float32 dis~%float32 fp_rssi~%float32 rx_rssi~%float32 dis_avg~%float32 fp_avg~%float32 rx_avg~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: nlink_parser/LinktrackNodeframe2~%uint8 role~%uint8 id~%uint32 local_time~%uint32 system_time~%float32 voltage~%float32[3] pos_3d~%float32[3] eop_3d~%float32[3] vel_3d~%float32[3] angle_3d~%float32[4] quaternion~%float32[3] imu_gyro_3d~%float32[3] imu_acc_3d~%LinktrackNode2[] nodes~%~%================================================================================~%MSG: nlink_parser/LinktrackNode2~%uint8 role~%uint8 id~%float32 dis~%float32 fp_rssi~%float32 rx_rssi~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <uwb>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'uwb))
     1
     1
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <uwb>))
  "Converts a ROS message object to a list"
  (cl:list 'uwb
    (cl:cons ':header (header msg))
    (cl:cons ':uwb (uwb msg))
    (cl:cons ':role (role msg))
    (cl:cons ':id (id msg))
    (cl:cons ':dis (dis msg))
    (cl:cons ':fp_rssi (fp_rssi msg))
    (cl:cons ':rx_rssi (rx_rssi msg))
    (cl:cons ':dis_avg (dis_avg msg))
    (cl:cons ':fp_avg (fp_avg msg))
    (cl:cons ':rx_avg (rx_avg msg))
))
