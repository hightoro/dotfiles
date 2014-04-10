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
(package-initialize)

;; パッケージ情報の更新
(package-refresh-contents)
;; インストールリストを作成
(defvar my/favorite-packages
 '(
   ;; init
   init-loader

   ;; auto-complete
   auto-complete fuzzy popup pos-tip

   ;; buffer utils
   ;popwin elscreen yascroll buffer-move

   ;; flymake
   flycheck flycheck-pos-tip ;flymake-jslint

   ;; anything/helm
   helm

   ;; undo
   undo-tree undohist

   ;; quick-run
   quickrun

   ;; snippet
   yasnippet

   ;; find extension
   anzu hlinum

   ;; git
   magit git-gutter

   ;; C/C++
   ;auto-complete-clang-async
   c-eldoc

   ;;;; go go-mode

   ;;;; python jedi
))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))



