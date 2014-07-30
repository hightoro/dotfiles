;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; font config (Windows) ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (eq system-type 'windows-nt)
;;; 英語
  (set-face-attribute 'default nil
                      :family "Consolas"
                      :height 100)
;;; 日本語
  (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Meiryo"))

;;; asciiフォントと日本語フォントの横幅を1:2にする
  (setq face-font-rescale-alist
        '((".*Consolas.*" . 1.0)
          (".*Meiryo.*" . 1.2)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; font config (Linux) ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (eq system-type 'gnu/linux)
;;; 英語
  (set-face-attribute 'default nil
                     :family "Droid Sans Mono"
                     ;:family "Menlo"
                     ;:family "monaco"
                     ;:family "asciifont"
                     :height 130)    ;; font size

;;; 日本語
  (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "MonoSpace"))

;; asciiフォントと日本語フォントの横幅を1:2にする
  (setq face-font-rescale-alist
        '((".*Droid Sans Mono.*" . 1.0)
          (".*MonoSpace.*" . 1.2)))
)

