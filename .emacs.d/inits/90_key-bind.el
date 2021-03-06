;;; key-bind

;;; 覚書 ;;;;;;;;;;;;;;;;;;;
;
; [\記法]
;   "\C-h"      >>  Ctrl+h
;   "\M-h"      >>  Meta+h
;
; [kbd記法]
;   (kbd "C-h") >>  Ctrl+h
;   (kbd "M-;") >>  Ctrl+;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; System
(global-set-key (kbd "C-x C-c") 'nil)                    ;; C-x C-c(Quit)を無効か
(global-set-key (kbd "C-x C-z") 'nil)                    ;;
;(define-key global-map "\C-h" 'delete-backward-char)     ;; 削除

;; Text
(global-set-key (kbd "C-w") 'nil)                        ;; C-w(Cut)を排除
(global-set-key (kbd "C-d") 'nil)                        ;; C-d(delete)を排除
(global-set-key (kbd "C-t") 'nil)                        ;; C-c(transpose-chars)を排除
(global-set-key (kbd "C-z") 'undo)                       ;; C-z で undo

;; X

(global-set-key (kbd "M-S-y") 'x-clipboard-yank)         ;; clip-boardからコピー

;; windows
(global-set-key (kbd "C-S-w") 'clipboard-kill-ring-save) ;; clip-boardからヤンク
(global-set-key (kbd "C-S-y") 'clipboard-yank)         ;; clip-boardからコピー

;; windowが１つならsplitする
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(defun back-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window -1))
(global-set-key (kbd "C-x o") 'other-window-or-split)    ;; C-tab で other-windows
;(global-set-key (kbd "<C-S-tab>") 'back-window-or-split) ;; C-tab で other-windows

;; I never use C-x C-c
(defalias 'exit 'save-buffers-kill-emacs)

;;; direx
(global-set-key (kbd "C-x X-j") 'direx-project:jump-to-project-root-other-window)
(define-key direx:direx-mode-map (kbd "K") 'direx-k)

