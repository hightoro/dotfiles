;;;;;;;;;;;;;;;;;;
;;; Non Daemon ;;;
;;;;;;;;;;;;;;;;;;
;; alias emacs='emacsclient -n -a "emacs"'
(require 'server)
(unless (server-running-p) (server-start))



;;;;;;;;;;;;;;
;;; Daemon ;;;
;;;;;;;;;;;;;; 
;; alias emacs='emacsclient -c -a ""'
 
