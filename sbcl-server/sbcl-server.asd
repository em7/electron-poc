(asdf:defsystem #:sbcl-server
  :description "Describe gasmile here"
  :author "em7 <mm007.emko@gmail.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :depends-on (#:hunchentoot #:hunchentools #:spinneret)
  :components ((:module "src"
                :components ((:file "layout")
                             (:file "main" :depends-on  ("layout"))))))

