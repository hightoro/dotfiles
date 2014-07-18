;; flycheck
(require 'flycheck)
(require 'flycheck-autoloads)

;; active flycheck (init)
;(flycheck-mode t)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))

;; セーブした時だけにチェック
(custom-set-variables '(flycheck-check-syntax-automatically '(mode-enabled save)))
;; 下線をなくす
(custom-set-variables '(flycheck-highlighting-mode 'nil))

;; c-mode
(add-hook 'c-mode-hook 'flycheck-mode)

;; c++-mode
(add-hook 'c++-mode-hook (lambda ()
                           (custom-set-variables '(flycheck-clang-language-standard "c++1y"))))

;(add-hook 'c++-mode-hook (lambda ()
;                           (setq flycheck-clang-language-standard "c++11")
;                           (setq flycheck-clang-standard-library "libc++") ))

;(flycheck-define-checker c/c++
;  "A C/C++ checker using g++."
;  :command ("g++" "-Wall" "-Wextra" source)
;  :error-patterns ((error line-start
;                          (file-name) ":" line ":" column ":" " エラー: " (message) 
;                          line-end)
;                   (warning line-start
;                            (file-name) ":" line ":" column ":" " 警告: " (message)
;                            line-end))
;  :modes (c-mode c++-mode))


;; active [flycheck-pos-tip]
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;; key-bind
(defun my/flymake-goto-next-error (arg)
  (interactive "P")
  (if (and (boundp 'flycheck-mode) flycheck-mode)
      (flycheck-next-error arg)
    (flymake-goto-next-error)
    (my/flymake-popup-error-message)))

(defun my/flymake-goto-previous-error (arg)
  (interactive "P")
  (if (and (boundp 'flycheck-mode) flycheck-mode)
      (flycheck-previous-error arg)
    (flymake-goto-prev-error)
    (my/flymake-popup-error-message)))

(global-set-key (kbd "M-g M-n") 'my/flymake-goto-next-error)
(global-set-key (kbd "M-g M-p") 'my/flymake-goto-previous-error)
