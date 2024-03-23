(push (uiop:merge-pathnames* #p "") asdf:*central-registry*)
(ql:quickload :sbcl-server)

(defun main ()
  (sbcl-server:start-web-server)
  (bt:join-thread (find-if (lambda (th)
                            (search "hunchentoot" (bt:thread-name th)))
                          (bt:all-threads))))

(save-application "my-web-server.exe"
                  :prepend-kernel t
                  :error-handler :quit
                  :application-type :gui
                  :toplevel-function #'main)

;; build with:
;; ccl --load build.lisp
