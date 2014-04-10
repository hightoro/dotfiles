;;; cc-mode.el

(require 'cc-mode)

;;; 
;(custom-set-variables '(c-default-style
;                        '((c-mode . "gnu")
;                          (c++-mode . "gnu")
;                          (java-mode . "java")
;                          (awk-mode . "awk")
;                          (other . "gnu"))))

;; スペースでインデントをする
;(setq indent-tabs-mode nil)

;; インデント幅を2にする
;(setq c-basic-offset 2)

;;; *.hをc++モードで開く
;(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

;(add-hook 'c-mode-common-hook
;          '(lambda ()
;             ;; センテンスの終了である ';' を入力したら、自動改行+インデント
;             (c-toggle-auto-hungry-state 1)
;             ;; RET キーで自動改行+インデント
;             (define-key c-mode-base-map "\C-m" 'newline-and-indent)
;))

;;; コンマとかカッコをタイプしただけでオートインデント
;(add-hook 'c-mode-hook
;          '(lambda ()
;             (c-toggle-electric-state -1)))
