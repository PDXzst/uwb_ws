
(cl:in-package :asdf)

(defsystem "pozyx_simulation-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "uwb_data" :depends-on ("_package_uwb_data"))
    (:file "_package_uwb_data" :depends-on ("_package"))
  ))