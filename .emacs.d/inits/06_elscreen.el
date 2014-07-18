
(elscreen-start)

(setq-default eslcreen-prefix-key "\C-xt")
(setq-default elscreen-tab-display-control nil)
(setq-default elscreen-tab-display-kill-screen nil)
(global-set-key (kbd "C-S-t") 'elscreen-create)
(global-set-key (kbd "C-S-w") 'elscreen-kill)
(global-set-key (kbd "M-]") 'elscreen-next)
(global-set-key (kbd "M-[") 'elscreen-previous)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; APEL非依存版 (Emacs 24の場合)
;(when (>= emacs-major-version 24)
;(elscreen-start))


;; APEL依存版 (Emacs 23と同居させたい場合)
;	(when (<= emacs-major-version 23)
;	  (add-to-load-path "elisp/apel")
;	  (require 'elscreen))
