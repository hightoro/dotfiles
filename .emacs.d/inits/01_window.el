;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; menu-bar & title & mode line ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; タイトルバーにファイル名を表示
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

;;; ツールバー非表示
;(tool-bar-mode -1)

;;; メニューバーを非表示
;(menu-bar-mode -1)

;;; スクロールバー非表示
(set-scroll-bar-mode nil)

;;; メニューバー日本語化(http://www11.atwiki.jp/s-irie/pages/13.html)
;(load "~/.emacs.d/elisp/menu-tree.el")
;(if (and (= emacs-major-version 22)
;	 (eq window-system 'x))
;    (setq menu-tree-coding-system 'utf-8))
;(require 'menu-tree nil t)

;;;;;;;;;;;;;;;;;;;
;;; font config ;;;
;;;;;;;;;;;;;;;;;;;
;;; 英語
 (set-face-attribute 'default nil
             :family "Consolas" ;; font
             ;:face "Ricty"
             :height 140)    ;; font size

;;; 日本語



;;;;;;;;;;;;;;;;;;;
;;; text Window ;;;
;;;;;;;;;;;;;;;;;;;
;;; ウィンドウさいずの変更
(setq initial-frame-alist
      '((top . 1) (left . 1) (width . 100) (height . 55)))

;;; 半透明化
(set-frame-parameter nil 'alpha 80)

;;; 対応する括弧を光らせる
(show-paren-mode t)

;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
;;(set-face-background 'trailing-whitespace "#b14770")


;;;;;;;;;;;;;;
;;; Cursor ;;;
;;;;;;;;;;;;;;
;; カーソルに関して
(set-cursor-color "white")        ;;カーソルの色
(setq blink-cursor-interval 0.5)  ;;カーソルの点滅間隔
(setq blink-cursor-delay 1.0)     ;;カーソルの点滅開始される放置時間
(blink-cursor-mode 1)             ;;カーソルの点滅on

;; カーソルのある行に関して
(global-hl-line-mode t)           ;;カーソル行のハイライトon
(set-face-background 'hl-line "navy") ;;カーソル行の色


;;;;;;;;;;;;;;;;;
;;; mode line ;;;
;;;;;;;;;;;;;;;;;
;;; モードラインに行番号表示
(line-number-mode t)

;;; モードラインに列番号表示
(column-number-mode t)

;;; emacs-powerlineを使用する
;(require 'powerline)
