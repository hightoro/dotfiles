;; flycheck
(require 'flycheck)
(require 'flycheck-autoloads)

;; セーブした時だけにチェック
(setq flycheck-check-syntax-automatically '(mode-enabled save))
;; 下線をなくす
(setq flycheck-highlighting-mode 'nil)



;; active flycheck (init)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook (lambda ()
                           (custom-set-variables '(flycheck-clang-language-standard "c++1y"))))

;; active [flycheck-pos-tip]
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
