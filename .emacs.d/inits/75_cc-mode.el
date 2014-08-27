;;; cc-mode.el
(require 'cc-mode)

;;; special thanks
;;; http://d.hatena.ne.jp/i_s/20091026/1256557730

;;; 
;(custom-set-variables '(c-default-style
;                        '((c-mode . "gnu")
;                          (c++-mode . "gnu")
;                          (java-mode . "java")
;                          (awk-mode . "awk")
;                          (other . "gnu"))))

;; c-mode-common-hook(c-modeとc++-modeの共通の設定)
(defun hightoro/c++-mode-hook ()
  ;;; デフォルトのスタイル
  (c-set-style "gnu")

  ;;; スペースでインデントをする
  (setq indent-tabs-mode nil)

  ;;; インデント幅を2にする
  (setq c-basic-offset 2)

  ;;; 自動改行（auto-new-line）と連続する空白の一括削除（hungry-delete）
  ;(c-toggle-auto-hungry-state 1)

  ;;; コンマとかカッコをタイプしただけでオートインデント
  ;(c-toggle-electric-state -1)

  ;;; RET キーで自動改行+インデント
  ;(define-key c-mode-base-map "\C-m" 'newline-and-indent)


)
(add-hook 'c-mode-common-hook 'hightoro/c++-mode-hook)

;;; *.hをc++モードで開く
;(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
