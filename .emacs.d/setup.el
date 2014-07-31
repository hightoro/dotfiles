; setup.el
;
; > emacs -Q -l setup.el
;
;;;;;;;;;;;;
;;; ELPA ;;;
;;;;;;;;;;;;
(require 'package)
(setq package-user-dir (concat user-emacs-directory "elpa"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")) 
(package-initialize)

;; パッケージ情報の更新
(package-refresh-contents)
;; インストールリストを作成
(defvar my/favorite-packages
 '(
   ;; init
   init-loader

   ;; auto-complete
   auto-complete fuzzy popup pos-tip auto-complete-clang-async

   ;; popwin + direx
   popwin direx

   ;; buffer utils
   ;buffer-move

   ;; flymake
   flycheck flycheck-pos-tip ;flymake-jslint

   ;; anything/helm
   helm

   ;; search/grep
   anzu

   ;; undo
   undo-tree undohist

   ;; quick-run
   quickrun

   ;; snippet
   yasnippe

  ;; elscreen
   elscreen

   ;; powerline
   powerline

   ;; scroll
   yascroll

   ;; cursor
   multiple-cursors

   ;; paren
   smartparens

   ;; git
   magit git-gutter-fringe

   ;; folding
   fold-dwim

   ;; highlight
   hlinum volatile-highlights

   ;; theme
   nzenburn-theme

   ;; C/C++
   c-eldoc

   ;;;; go go-mode

   ;;;; python jedi

))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))

