;; Auto-generated. Do not edit!


(when (boundp 'pozyx_simulation::uwb_data)
  (if (not (find-package "POZYX_SIMULATION"))
    (make-package "POZYX_SIMULATION"))
  (shadow 'uwb_data (find-package "POZYX_SIMULATION")))
(unless (find-package "POZYX_SIMULATION::UWB_DATA")
  (make-package "POZYX_SIMULATION::UWB_DATA"))

(in-package "ROS")
;;//! \htmlinclude uwb_data.msg.html


(defclass pozyx_simulation::uwb_data
  :super ros::object
  :slots (_destination_id _distance _stamp ))

(defmethod pozyx_simulation::uwb_data
  (:init
   (&key
    ((:destination_id __destination_id) (make-array 0 :initial-element 0 :element-type :integer))
    ((:distance __distance) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:stamp __stamp) (let (r) (dotimes (i 0) (push (instance ros::time :init) r)) r))
    )
   (send-super :init)
   (setq _destination_id __destination_id)
   (setq _distance __distance)
   (setq _stamp __stamp)
   self)
  (:destination_id
   (&optional __destination_id)
   (if __destination_id (setq _destination_id __destination_id)) _destination_id)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:serialization-length
   ()
   (+
    ;; int64[] _destination_id
    (* 8    (length _destination_id)) 4
    ;; float64[] _distance
    (* 8    (length _distance)) 4
    ;; time[] _stamp
    (* 8    (length _stamp)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64[] _destination_id
     (write-long (length _destination_id) s)
     (dotimes (i (length _destination_id))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _destination_id i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _destination_id i)) (= (length ((elt _destination_id i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _destination_id i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _destination_id i) . bv) 1) -1) s))
             ((and (class (elt _destination_id i)) (= (length ((elt _destination_id i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _destination_id i) . bv) 0) s)
              (write-long (if (>= (elt _destination_id i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _destination_id i) s)(write-long (if (>= (elt _destination_id i) 0) 0 #xffffffff) s)))
       )
     ;; float64[] _distance
     (write-long (length _distance) s)
     (dotimes (i (length _distance))
       (sys::poke (elt _distance i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; time[] _stamp
     (write-long (length _stamp) s)
     (dotimes (i (length _stamp))
       (write-long (send (elt _stamp i) :sec) s) (write-long (send (elt _stamp i) :nsec) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64[] _destination_id
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _destination_id (instantiate integer-vector n))
     (dotimes (i n)
#+(or :alpha :irix6 :x86_64)
      (setf (elt _destination_id i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _destination_id i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;; float64[] _distance
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _distance (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _distance i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; time[] _stamp
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _stamp (let (r) (dotimes (i n) (push (instance ros::time :init) r)) r))
     (dolist (elem- _stamp)
     (send elem- :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send elem- :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get pozyx_simulation::uwb_data :md5sum-) "853a584c8bd9fd74a6b2709e39029b14")
(setf (get pozyx_simulation::uwb_data :datatype-) "pozyx_simulation/uwb_data")
(setf (get pozyx_simulation::uwb_data :definition-)
      "int64[] destination_id
float64[] distance
time[] stamp

")



(provide :pozyx_simulation/uwb_data "853a584c8bd9fd74a6b2709e39029b14")


