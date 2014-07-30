;
;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; enveroment ( path ) ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; load-path 追加用の関数の定義(http://sakito.jp/emacs/emacs23.html)
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-loadpath)
	    (normal-top-level-add-subdirs-to-load-path))))))

;;; load-pathに追加するフォルダ(上記関数を使用)
;; 2つ以上フォルダを指定する場合の引数 => (add-to-load-path "elisp" "xxx" "xxx")
(add-to-load-path
		;"~/local/share/emacs/24.3/"
		"~/.emacs.d/"
		"~/.emacs.d/elisp/"
		"~/.emacs.d/elpa/")

;;; load-pathに追加するフォルダ(通常手法)
;(setq load-path (append '("~/.emacs.d/") load-path))
;(setq load-path (append '("~/.emacs.d/elisp/") load-path))
;(normal-top-level-add-subdirs-to-load-path))


;;;;;;;;;;;;;;;
;;; package ;;;
;;;;;;;;;;;;;;;
;;; Emacs24標準のパッケージマネージャを使用する
(require 'package)
;;; パッケージを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/")) ;; MELPAを追加
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")) ;; Marmaladeを追加
;; パッケージの初期化
(package-initialize)


;;;;;;;;;;;;;;;;;;;
;;; init-loader ;;;
;;;;;;;;;;;;;;;;;;;
;;; init-loaderパッケージを使用して環境設定
(require 'init-loader)
;;; 設定ファイルがあるディレクトリを指定
;(init-loader-load)                           ; 指定しなければ"~/init-loader-directory/"を読みに行く
(init-loader-load "~/.emacs.d/inits/")

