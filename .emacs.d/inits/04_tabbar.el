;;;;;;;;;;;;;;;;
;;;  tabbar  ;;;
;;;;;;;;;;;;;;;;
(require `tabbar)
(tabbar-mode 1)

;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode -1)

;; グループ化しない
(setq tabbar-buffer-groups-function nil)

;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
        (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; ウインドウからはみ出たタブを省略して表示
(setq tabbar-auto-scroll-flag nil)

;; タブとタブの間の長さ
;(setq tabbar-separator '(1))
(set-face-attribute 'tabbar-separator nil
                    :height 0.1)

;; 外観変更
(set-face-attribute 'tabbar-default nil
                    ;:family (face-attribute 'default :family)
                    :background (face-attribute 'mode-line-inactive :background)
                    :height 0.9)

(set-face-attribute 'tabbar-unselected nil
                    :background (face-attribute 'mode-line :background)
                    :foreground (face-attribute 'mode-line :foreground)
                    :box nil)

(set-face-attribute 'tabbar-selected nil
                    :background "DarkOliveGreen";(face-attribute 'linum-highlight-face :background)
                    :foreground "white";(face-attribute 'linum-highlight-face :foreground)
                    :inherit  'mode-line
                    :box nil)

;(set-face-attribute
; 'tabbar-default nil
; :family (face-attribute 'default :family)
; :background (face-attribute 'mode-line-inactive :background)
; :height 0.9)
;(set-face-attribute
; 'tabbar-unselected nil
; :background (face-attribute 'mode-line-inactive :background)
; :foreground (face-attribute 'mode-line-inactive :foreground)
; :box nil)
;(set-face-attribute
; 'tabbar-selected nil
; :background (face-attribute 'mode-line :background)
; :foreground (face-attribute 'mode-line :foreground)
; :box nil)

;(set-face-attribute
; 'tabbar-default nil
; :family "Monaco"
; :background "black"
; :foreground "gray72"
; :height 0.8)
;(set-face-attribute
; 'tabbar-unselected nil
; :background "black"
; :foreground "grey72"
; :box '(:line-width 3 :color "black"))
;(set-face-attribute
; 'tabbar-selected nil
; :background "white"
; :foreground "gray28"
; :box '(:line-width 3 :color "white"))
;(set-face-attribute
; 'tabbar-button nil
; :box nil)

;; タブに表示させるバッファの設定
(defvar my-tabbar-displayed-buffers
 '("scratch*" "*Messages*" "*Backtrace*" "*Colors*" "*Faces*" "*shell*" "*terminal*" "*eshell*")
  "*Regexps matches buffer names always included tabs.")

(defun my-tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or an asterisk.
The current buffer and buffers matches `my-tabbar-displayed-buffers'
are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my-tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; key-bind (like firefox)
(global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)
(global-set-key (kbd "<C-S-tab>") 'tabbar-backward-tab)
(global-set-key (kbd "<C-S-iso-lefttab>") 'tabbar-backward-tab)

;; key-bind (like chrome)
;(global-set-key (kbd "<S-M-right>") 'tabbar-forward-tab)
;(global-set-key (kbd "<S-M-left>") 'tabbar-backward-tab)


;(defun my-tabbar-buffer-list ()
;  (delq nil
;        (mapcar #'(lambda (b)
;                    (cond
;                     ;; Always include the current buffer.
;                     ((eq (current-buffer) b) b)
;                     ((buffer-file-name b) b)
;                     ((char-equal ?\ (aref (buffer-name b) 0)) nil)
;                     ((equal "*scratch*" (buffer-name b)) b) ; *scratch*バッファは表示する
;                     ((char-equal ?* (aref (buffer-name b) 0)) nil) ; それ以外の * で始まるバッファは表示しない
;                     ((buffer-live-p b) b)))
;                (buffer-list))))
;(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)



;;;;;;;;;;;;;;;;;;
;;;  elscreen  ;;;
;;;;;;;;;;;;;;;;;;
;(elscreen-start)

;(setq-default eslcreen-prefix-key "\C-xt")
;(setq-default elscreen-tab-display-control nil)
;(setq-default elscreen-tab-display-kill-screen nil)
;(global-set-key (kbd "C-S-t") 'elscreen-create)
;(global-set-key (kbd "C-S-w") 'elscreen-kill)
;(global-set-key (kbd "M-]") 'elscreen-next)
;(global-set-key (kbd "M-[") 'elscreen-previous)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; APEL非依存版 (Emacs 24の場合)
;(when (>= emacs-major-version 24)
;(elscreen-start))


;; APEL依存版 (Emacs 23と同居させたい場合)
;	(when (<= emacs-major-version 23)
;	  (add-to-load-path "elisp/apel")
;	  (require 'elscreen))
