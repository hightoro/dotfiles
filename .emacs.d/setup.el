; setup.el

;;;;;;;;;;;;
;;; ELPA ;;;
;;;;;;;;;;;;

;; パッケージ情報の更新
(package-refresh-contents)
;; インストールリストを作成
(defvar my/favorite-packages
 '(

   ;; auto-complete
   auto-complete fuzzy popup pos-tip

   ;; buffer utils
   ;popwin elscreen yascroll buffer-move

   ;; flymake
   flycheck flycheck-pos-tip ;flymake-jslint

   ;; anything
   helm

   ;; undo
   undo-tree undohist

   ;; snippet
   yasnippet

   ;; find extension
   anzu

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



