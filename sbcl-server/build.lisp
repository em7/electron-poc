(push (uiop:merge-pathnames* #p "") asdf:*central-registry*)
(ql:quickload :sbcl-server)

(defun main ()
  (format t "Starting server at port 8080~%")
  (sbcl-server:start-web-server)
  (bt:join-thread (find-if (lambda (th)
                            (search "hunchentoot" (bt:thread-name th)))
                          (bt:all-threads))))

(sb-ext:save-lisp-and-die "my-web-server.exe"
                          :executable t
                          :toplevel #'main
                          :compression nil)

;; build with:
;; sbcl --disable-debugger --load build.lisp
6:08 PM 23-Mar-24