;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Menu-bar & Tool-bar & Title-bar  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; タイトルバーにファイル名を表示
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

;;; ツールバー非表示
;(tool-bar-mode -1)

;;; メニューバーを非表示
;(menu-bar-mode -1)

;;; メニューバー日本語化(http://www11.atwiki.jp/s-irie/pages/13.html)
;(load "~/.emacs.d/elisp/menu-tree.el")
;(if (and (= emacs-major-version 22)
;	 (eq window-system 'x))
;    (setq menu-tree-coding-system 'utf-8))
;(require 'menu-tree nil t)

;;;;;;;;;;;;;;;;;;;
;;; Text window ;;;
;;;;;;;;;;;;;;;;;;;
;;; ウィンドウサイズの変更
(setq initial-frame-alist
      '((top . 1) (left . 1) (width . 100) (height . 55)))

;;; 文字の色を設定
(add-to-list 'default-frame-alist '(foreground-color . "white"))

;;; 背景色を設定
(add-to-list 'default-frame-alist '(background-color . "black"))

;;; 半透明化
(set-frame-parameter nil 'alpha 90)


;;;;;;;;;;;;;;;;;;
;;; scroll-bar ;;;
;;;;;;;;;;;;;;;;;;
;;; スクロールバー非表示
(set-scroll-bar-mode nil)


;;;;;;;;;;;;;;;;;
;;; Mode line ;;;
;;;;;;;;;;;;;;;;;
;;; モードラインに行番号表示
(line-number-mode t)

;;; モードラインに列番号表示
(column-number-mode t)


;;;;;;;;;;;;;;
;;; Cursor ;;;
;;;;;;;;;;;;;;
;; カーソル
(set-cursor-color "white")        ;;カーソルの色
(setq blink-cursor-interval 0.5)  ;;カーソルの点滅間隔
(setq blink-cursor-delay 1.0)     ;;カーソルの点滅開始される放置時間
(blink-cursor-mode 1)             ;;カーソルの点滅on

;; カーソル行
(global-hl-line-mode t)           ;;カーソル行のハイライトon
(set-face-background 'hl-line "navy") ;;カーソル行の色


;;;;;;;;;;;;;
;;; Paren ;;;
;;;;;;;;;;;;;
;;; 対応する括弧を光らせる
(show-paren-mode t)

;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)


;;;;;;;;;;;;;;;;;;;
;;; Space & Tab ;;;
;;;;;;;;;;;;;;;;;;;
;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
;;(set-face-background 'trailing-whitespace "#b14770")

;; タブをスペースで扱う
(setq-default indent-tabs-mode nil)    ;; tab -> space

;; タブ幅
(custom-set-variables '(tab-width 4))
