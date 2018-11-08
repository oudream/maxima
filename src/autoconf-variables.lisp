; -*- Lisp -*-
(in-package :maxima)

(defparameter *autoconf-variables-set* "@variables_set@")
(defparameter *autoconf-prefix* "/usr/local")
(defparameter *autoconf-exec_prefix* "/usr/local")
(defparameter *autoconf-package* "maxima")
(defparameter *autoconf-version* "5.42.1")
(defparameter *autoconf-libdir* "/usr/local/lib")
(defparameter *autoconf-libexecdir* "/usr/local/libexec")
(defparameter *autoconf-datadir* "/usr/local/share")
(defparameter *autoconf-infodir* "/usr/local/share/info")
(defparameter *autoconf-host* "x86_64-unknown-linux-gnu")
;; This variable is kept for backwards compatibiliy reasons:
;; We seem to be in the fortunate position that we sometimes need to check for windows.
;; But at least until dec 2015 we didn't need to check for a specific windows flavour.
(defparameter *autoconf-win32* "false")
(defparameter *autoconf-windows* "false")
(defparameter *autoconf-ld-flags* "")

;; This will be T if this was a lisp-only build
(defparameter *autoconf-lisp-only-build* (eq t '@lisp_only_build@))
 
(defparameter *maxima-source-root* "/home/vttoth/dev/maxima")
(defparameter *maxima-default-layout-autotools* "true")
