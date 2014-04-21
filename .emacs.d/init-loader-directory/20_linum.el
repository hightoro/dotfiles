;; ver24あたりで標準で入ったそうです
;;(load "~/.emacs.d/elisp/linum.el")
(require 'linum)
(require 'hlinum)

;; active
(global-linum-mode t)

;; setting
(setq linum-format "%5d") ;; フォーマット
;(set-face-attribute 'linum nil
; :foreground "#800" ;; 色
; :height 0.9) ;; 大きさ

;; http://d.hatena.ne.jp/daimatz/20120215/1329248780
;; linum-mode を軽くする。
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))
