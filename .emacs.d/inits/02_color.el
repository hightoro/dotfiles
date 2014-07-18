;;;;;;;;;;;;;;;;;;;;;
;;; window coloer ;;;
;;;;;;;;;;;;;;;;;;;;;;
;;; 文字の色を設定
(add-to-list 'default-frame-alist '(foreground-color . "white"))

;;; 背景色を設定
(add-to-list 'default-frame-alist '(background-color . "black"))

;;; ソースファイルに色をつける
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))


;;;;;;;;;;;;;;;;;;;
;;; color theme ;;;
;;;;;;;;;;;;;;;;;;;
;;; カラーテーマは非推奨 (Emacs24から)
;;; テーマフレームワークを使う　

;;; カラーテーマを使用する
;(add-to-list 'load-path "~/.emacs.d/elisp/color-theme-6.6.0/") ;ディレクトリの指定
;(load "~/.emacs.d/elisp/color-theme-6.6.0/color-theme.el")
;(require 'color-theme)
;(add-to-list 'load-path "~/.emacs.d/theme") ;ディレクトリの指定
;(require 'color-theme)
;(eval-after-load "color-theme"x
;  '(progn
;     (color-theme-initialize)
;     (color-theme-molokai)
;))
;(color-theme-initialize)

;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(setq molokai-theme-kit t)
;(load-theme 'molokai t)

;;; テーマフレームワークを使用する
;(setq custom-theme-directory "~/.emacs.d/themes/") ;ディレクトリの指定

;;; [ (load-theme '設定したいテーマの名前 t) ]
;(load-theme 'foobar t)
;(load-theme 'tsdh-dark t)
