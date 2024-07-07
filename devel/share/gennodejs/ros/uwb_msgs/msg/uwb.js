// Auto-generated. Do not edit!

// (in-package uwb_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let nlink_parser = _finder('nlink_parser');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class uwb {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.uwb = null;
      this.role = null;
      this.id = null;
      this.dis = null;
      this.fp_rssi = null;
      this.rx_rssi = null;
      this.dis_avg = null;
      this.fp_avg = null;
      this.rx_avg = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('uwb')) {
        this.uwb = initObj.uwb
      }
      else {
        this.uwb = new nlink_parser.msg.LinktrackNodeframe2();
      }
      if (initObj.hasOwnProperty('role')) {
        this.role = initObj.role
      }
      else {
        this.role = 0;
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('dis')) {
        this.dis = initObj.dis
      }
      else {
        this.dis = 0.0;
      }
      if (initObj.hasOwnProperty('fp_rssi')) {
        this.fp_rssi = initObj.fp_rssi
      }
      else {
        this.fp_rssi = 0.0;
      }
      if (initObj.hasOwnProperty('rx_rssi')) {
        this.rx_rssi = initObj.rx_rssi
      }
      else {
        this.rx_rssi = 0.0;
      }
      if (initObj.hasOwnProperty('dis_avg')) {
        this.dis_avg = initObj.dis_avg
      }
      else {
        this.dis_avg = 0.0;
      }
      if (initObj.hasOwnProperty('fp_avg')) {
        this.fp_avg = initObj.fp_avg
      }
      else {
        this.fp_avg = 0.0;
      }
      if (initObj.hasOwnProperty('rx_avg')) {
        this.rx_avg = initObj.rx_avg
      }
      else {
        this.rx_avg = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type uwb
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [uwb]
    bufferOffset = nlink_parser.msg.LinktrackNodeframe2.serialize(obj.uwb, buffer, bufferOffset);
    // Serialize message field [role]
    bufferOffset = _serializer.uint8(obj.role, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [dis]
    bufferOffset = _serializer.float32(obj.dis, buffer, bufferOffset);
    // Serialize message field [fp_rssi]
    bufferOffset = _serializer.float32(obj.fp_rssi, buffer, bufferOffset);
    // Serialize message field [rx_rssi]
    bufferOffset = _serializer.float32(obj.rx_rssi, buffer, bufferOffset);
    // Serialize message field [dis_avg]
    bufferOffset = _serializer.float32(obj.dis_avg, buffer, bufferOffset);
    // Serialize message field [fp_avg]
    bufferOffset = _serializer.float32(obj.fp_avg, buffer, bufferOffset);
    // Serialize message field [rx_avg]
    bufferOffset = _serializer.float32(obj.rx_avg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type uwb
    let len;
    let data = new uwb(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [uwb]
    data.uwb = nlink_parser.msg.LinktrackNodeframe2.deserialize(buffer, bufferOffset);
    // Deserialize message field [role]
    data.role = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [dis]
    data.dis = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [fp_rssi]
    data.fp_rssi = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rx_rssi]
    data.rx_rssi = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [dis_avg]
    data.dis_avg = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [fp_avg]
    data.fp_avg = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rx_avg]
    data.rx_avg = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += nlink_parser.msg.LinktrackNodeframe2.getMessageSize(object.uwb);
    return length + 26;
  }

  static datatype() {
    // Returns string type for a message object
    return 'uwb_msgs/uwb';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ddc35d181e42e0b27867e8ec3bbe2456';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new uwb(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.uwb !== undefined) {
      resolved.uwb = nlink_parser.msg.LinktrackNodeframe2.Resolve(msg.uwb)
    }
    else {
      resolved.uwb = new nlink_parser.msg.LinktrackNodeframe2()
    }

    if (msg.role !== undefined) {
      resolved.role = msg.role;
    }
    else {
      resolved.role = 0
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.dis !== undefined) {
      resolved.dis = msg.dis;
    }
    else {
      resolved.dis = 0.0
    }

    if (msg.fp_rssi !== undefined) {
      resolved.fp_rssi = msg.fp_rssi;
    }
    else {
      resolved.fp_rssi = 0.0
    }

    if (msg.rx_rssi !== undefined) {
      resolved.rx_rssi = msg.rx_rssi;
    }
    else {
      resolved.rx_rssi = 0.0
    }

    if (msg.dis_avg !== undefined) {
      resolved.dis_avg = msg.dis_avg;
    }
    else {
      resolved.dis_avg = 0.0
    }

    if (msg.fp_avg !== undefined) {
      resolved.fp_avg = msg.fp_avg;
    }
    else {
      resolved.fp_avg = 0.0
    }

    if (msg.rx_avg !== undefined) {
      resolved.rx_avg = msg.rx_avg;
    }
    else {
      resolved.rx_avg = 0.0
    }

    return resolved;
    }
};

module.exports = uwb;
