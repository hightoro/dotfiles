; setup.el

;;;;;;;;;;;;
;;; ELPA ;;;
;;;;;;;;;;;;

;; パッケージ情報の更新　と　インストール
(package-refresh-contents) ;; 更新

(defvar my/favorite-packages ;; インストールするパッケージ
 '(
   auto-complete fuzzy popup pos-tip    ;;;; for auto-complete
   ;popwin elscreen yascroll buffer-move ;;;; buffer utils
   ;flycheck flymake-jslint              ;;;; flymake
   helm
   magit git-gutter
   ;;;; go go-mode
   ;;;; python jedi
))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))



