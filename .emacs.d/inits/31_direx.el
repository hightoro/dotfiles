(require 'direx)

(setq direx:leaf-icon "  "
      direx:open-icon "- "
      direx:closed-icon "+ ")
(push '(direx:direx-mode :position left :width 40 :dedicated t)
      popwin:special-display-config)

(global-set-key (kbd "C-f") 'direx:jump-to-directory-other-window)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)


;;; direxを使う場合 / gitの状態のみ色付け
(require 'direx-k)
(global-set-key (kbd "C-\\") 'direx:jump-to-project-root-other-window)
(define-key direx:direx-mode-map (kbd "K") 'direx-k)
