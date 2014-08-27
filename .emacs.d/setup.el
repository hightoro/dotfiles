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

   ;; theme
   nzenburn-theme solarized-theme

   ;;;;;;;;;;;;;;;;

   ;; buffer utils
   ;buffer-move

   ;; elscreen
   ;elscreen

   ;; tabbar
   tabbar

   ;; powerline
   powerline

   ;; scroll
   yascroll

   ;; cursor
   multiple-cursors

   ;; paren
   smartparens

   ;; highlight
   hlinum volatile-highlights

   ;;;;;;;;;;;;;;;;

   ;; anything/helm
   helm

   ;; search/grep
   anzu

   ;; smartrep
   smartrep

   ;; expand-region
   expand-region

   ;; undo
   undo-tree undohist

   ;; popwin + direx
   popwin direx

   ;;;;;;;;;;;;;;;;

   ;; git
   magit git-gutter git-gutter-fringe

   ;;;;;;;;;;;;;;;;

  ;; auto-complete
   auto-complete fuzzy popup pos-tip auto-complete-clang-async

   ;; snippet
   yasnippet

   ;; flymake
   flycheck flycheck-pos-tip ;flymake-jslint

   ;; folding
   fold-dwim

   ;; quick-run
   quickrun

   ;;;;;;;;;;;;;;;;

   ;; C/C++
   c-eldoc

   ;;;; go go-mode

   ;;;; python jedi

))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))

