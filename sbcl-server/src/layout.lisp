(defpackage #:sbcl-server.layout
  (:use #:cl
        #:spinneret)
  (:export #:with-main-layout))

(in-package #:sbcl-server.layout)

(defmacro with-main-layout (&body body)
  `(spinneret:with-html-string
     (:doctype)
     (:html
      (:head
       (:meta :charset "utf-8")
       (:meta :name "viewport" :content "width=device-width, initial-scale=1")
       (:script :src "https://unpkg.com/htmx.org@1.9.11")
       (:link :rel "stylesheet" :href "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" :integrity "sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" :crossorigin "anonymous")
       (:script :src "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" :integrity "sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" :crossorigin "anonymous"))

      (:body
       (:h1 "Hello World")
       (:p "from SBCL")))))
