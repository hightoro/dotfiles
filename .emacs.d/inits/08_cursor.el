;;;;;;;;;;;;;;;;;;;;;
;;; Cursor config ;;;
;;;;;;;;;;;;;;;;;;;;;
(set-cursor-color "white")        ;;カーソルの色
(setq blink-cursor-interval 0.5)  ;;カーソルの点滅間隔
(setq blink-cursor-delay 1.0)     ;;カーソルの点滅開始される放置時間
(blink-cursor-mode 1)             ;;カーソルの点滅on

;;;;;;;;;;;;;;;;;;;
;;; Cursor line ;;;
;;;;;;;;;;;;;;;;;;;
;;; カーソル行のハイライト
(global-hl-line-mode t)

;;; カーソル行の色
;(set-face-background 'hl-line "LemonChiffon4")
;(set-face-background 'hl-line "cornsilk4")
;(set-face-background 'hl-line "honeydew4")
;(set-face-background 'hl-line "green4")
;(set-face-background 'hl-line "SpringGreen3")
;(set-face-background 'hl-line "MidnightBlue")
(set-face-background 'hl-line "DarkSlateGrey")
;;;;;;;;;;;;;;;;;;;;;;;
;;; Multiple-Cursor ;;;
;;;;;;;;;;;;;;;;;;;;;;;

