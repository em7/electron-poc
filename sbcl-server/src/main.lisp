(defpackage #:sbcl-server
  (:use #:cl
        #:hunchentoot
        #:hunchentools
        #:sbcl-server.layout)
  (:export #:start-web-server))


(in-package #:sbcl-server)

(defvar *app* nil)

(define-easy-handler (root :uri "/") ()
  (with-main-layout))

(defun start-web-server (&optional (port 8080))
  (when *app*
    (stop *app* :soft t))
  (setf *app* (make-instance 'easy-acceptor :port port))
  (start *app*))

