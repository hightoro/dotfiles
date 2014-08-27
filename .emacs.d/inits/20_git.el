;;;;;;;;;;;;;;;;;;
;;; git-gutter ;;;
;;;;;;;;;;;;;;;;;;
;(require 'git-gutter)
;(global-git-gutter-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;
;;; git-gutter-fringe ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'git-gutter-fringe)
(global-git-gutter-mode t)

(set-face-foreground 'git-gutter-fr:modified "yellow")
(set-face-foreground 'git-gutter-fr:added    "green")
(set-face-foreground 'git-gutter-fr:deleted  "red")

(setq git-gutter-fr:side 'right-fringe)

;;;;;;;;;;;;;
;;; magit ;;;
;;;;;;;;;;;;;
;(require 'magit)


