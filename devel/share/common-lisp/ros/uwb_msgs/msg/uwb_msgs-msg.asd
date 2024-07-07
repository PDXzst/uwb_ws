
(cl:in-package :asdf)

(defsystem "uwb_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :nlink_parser-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "uwb" :depends-on ("_package_uwb"))
    (:file "_package_uwb" :depends-on ("_package"))
  ))