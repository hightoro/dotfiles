(require 'tabbar)
(tabbar-mode 1)

(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ;; Always include the current buffer.
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\ (aref (buffer-name b) 0)) nil)
                     ((equal "*scratch*" (buffer-name b)) b) ; *scratch*バッファは表示する
                     ((char-equal ?* (aref (buffer-name b) 0)) nil) ; それ以外の * で始まるバッファは表示しない
                     ((buffer-live-p b) b)))
                (buffer-list))))

(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; タブ化
;; http://www.emacswiki.org/emacs/tabbar.el
;;(require 'cl)
;(require 'tabbar nil t)
;(setq tabbar-buffer-groups-function  ;; scratch buffer以外をまとめてタブに表示する
;      (lambda (b) (list "All Buffers")))
;(setq tabbar-buffer-list-function
;      (lambda ()
;	(remove-if
;	 (lambda(buffer)
;	   (unless (string-match (buffer-name buffer)
;				 "\\(*scratch*\\|*Apropos*\\|*shell*\\|*eshell*\\|*Customize*\\)")
;	     (find (aref (buffer-name buffer) 0) " *"))
;	   )
;	 (buffer-list))))
;(tabbar-mode 1)  ;; tabbarを有効にする

;;; ボタンをシンプルにする
;(setq tabbar-home-button-enabled "")
;(setq tabbar-scroll-right-button-enabled "")
;(setq tabbar-scroll-left-button-enabled "")
;(setq tabbar-scroll-right-button-disabled "")
;(setq tabbar-scroll-left-button-disabled "")

;; Ctrl-Tab, Ctrl-Shift-Tab でタブを切り替える
;(dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
;  (autoload func "tabbar" "Tabs at the top of buffers and easy control-tab navigation"))
;(defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
;  `(defun ,name (arg)
;     (interactive "P")
;     ,do-always
;     (if (equal nil arg)
;	 ,on-no-prefix
;      ,on-prefix)))
;(defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
;(defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
;(global-set-key [(control tab)] 'shk-tabbar-next)
;(global-set-key [(control shift tab)] 'shk-tabbar-prev)

;; GUIで直接ファイルを開いた場合フレームを作成しない
;(add-hook 'before-make-frame-hook
;	  (lambda ()
;	    (when (eq tabbar-mode t)
;	      (switch-to-buffer (buffer-name))
;	      (delete-this-frame))))
