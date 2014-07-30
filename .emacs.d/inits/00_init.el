;; init.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; enveroment ( encode ) ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; enveroment ( font ) ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Windowsで英数と日本語にMeiryoを指定
;; Linuxで英数と日本語にRictyを指定
;(let ((ws window-system))
;  (cond ((eq ws 'w32)
;	 (set-face-attribute 'default nil
;			     :family "Meiryo" ;; 英数
;			     :height 100)
;	 (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Meiryo"))) ;; 日本語
;	((eq ws 'ns)
;	 (set-face-attribute 'default nil
;			     :family "Ricty" ;; 英数
;			     :height 140)
;	 (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty"))))) ;; 日本語


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; enveroment ( locale ) ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Localeに合わせた環境の設定(Language)
(set-locale-environment nil)


;;;;;;;;;;;;;;;
;;; Tab Key ;;;
;;;;;;;;;;;;;;;
;; タブをスペースで扱う
(setq-default indent-tabs-mode nil)    ;; tab -> space

;; タブ幅
(custom-set-variables '(tab-width 4))



;;;;;;;;;;;;;;;;;;;;
;;; Resent Files ;;;
;;;;;;;;;;;;;;;;;;;;
;; 最近使ったファイルをメニューに表示
(recentf-mode t)
(setq recentf-max-menu-items 10)    ;; 最近使ったファイルの表示数
(setq recentf-max-saved-items 3000) ;; 最近開いたファイルの保存数を増やす


;;;;;;;;;;;;;;;;;;;;
;;; Mini Buffer ;;;
;;;;;;;;;;;;;;;;;;;;
;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; ミニバッファの履歴の保存数を増やす
(setq history-length 3000)



;;;;;;;;;;;;;;;;;
;;; clipboard ;;;
;;;;;;;;;;;;;;;;;
;;; クリップボードの共有
(setq x-select-enable-clipborad t)




;;;;;;;;;;;;;;;
;;; control ;;;
;;;;;;;;;;;;;;;
;;; ホイールマウス
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mouse t)


;;;;;;;;;;;;;
;;; other ;;;
;;;;;;;;;;;;;
;; dissable startup message
(setq inhibit-startup-message t)

;;; ファイルの先頭に#!...があるファイルを保存すると実行権をつける
(add-hook 'after-save-hook
	  'executable-make-buffer-file-executable-if-script-p)

;;; [yes or no]を[y or n]
(fset 'yes-or-no-p 'y-or-n-p)

;;; 自動スペルチェック
(setq-default flyspell-mode t) (setq ispell-dictionary "american")

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


