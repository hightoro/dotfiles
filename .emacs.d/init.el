;;2行はこの設定ファイルをどこか隔離されたディレクトリに置いて試したい場合にも対応するための設定
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

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
(when (>= emacs-major-version 24)
(add-to-load-path
		;"~/.emacs.d/"
		"elisp"
		"elpa")
)
(when (<= emacs-major-version 23)
(add-to-load-path
		"elisp"
		"emacs23")
)

;;; load-pathに追加するフォルダ(通常手法)
;(setq load-path (append '("~/.emacs.d/") load-path))
;(setq load-path (append '("~/.emacs.d/elisp/") load-path))
;(normal-top-level-add-subdirs-to-load-path))

;;;;;;;;;;;;;;;
;;; package ;;;
;;;;;;;;;;;;;;;
;;; Emacs24標準のパッケージマネージャを使用する
(require 'package)
;;; setting directory
(setq package-user-dir (concat user-emacs-directory "elpa"))
;;; パッケージを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/")) ;; MELPAを追加
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")) ;; Marmaladeを追加
;; パッケージの初期化
(package-initialize)

;; パッケージ情報の更新
;;(package-refresh-contents)

;; Install Melpa packages
(require 'cl)
(load "~/.emacs.d/Package")
(dolist (package my/packages)
  (when (or (not (package-installed-p package)))
    (package-install package)))

;;;;;;;;;;;;;;
;;; el-get ;;;
;;;;;;;;;;;;;;
;;; El-Getがインストールされていればそれを有効化し,
;;; そうでなければGitHubからダウンロードしてインストールする
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;;;;;;;;;;;;;;;;;;;
;;; init-loader ;;;
;;;;;;;;;;;;;;;;;;;
;;; init-loaderパッケージを使用して環境設定
(require 'init-loader)
;;; 設定ファイルがあるディレクトリを指定
;(init-loader-load)                           ; 指定しなければ"~/init-loader-directory/"を読みに行く
(init-loader-load "~/.emacs.d/inits/")

