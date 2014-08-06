;; init.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; enveroment ( encode ) ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq-default default-file-name-coding-system 'utf-8-unix)
(setq-default default-keyboard-coding-system 'utf-8-unix)
(setq-default default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq-default default-sendmail-coding-system 'utf-8-unix)
(setq-default default-terminal-coding-system 'utf-8-unix)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; enveroment ( locale ) ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Localeに合わせた環境の設定(Language)
(set-locale-environment nil)

;;;;;;;;;;;;;;;;;;;;
;;; Resent Files ;;;
;;;;;;;;;;;;;;;;;;;;
;; 最近使ったファイルをメニューに表示
(recentf-mode t)
(setq recentf-max-menu-items 10)    ;; 最近使ったファイルの表示数
(setq recentf-max-saved-items 3000) ;; 最近開いたファイルの保存数を増やす


;;;;;;;;;;;;;;;;;;;;
;;; Mini Buffer ;;;
;;;;;;;;;;;;;;;;;;;;
;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; ミニバッファの履歴の保存数を増やす
(setq history-length 3000)


;;;;;;;;;;;;;;;;;
;;; clipboard ;;;
;;;;;;;;;;;;;;;;;
;;; クリップボードの共有
(setq x-select-enable-clipborad t)


;;;;;;;;;;;;;;;
;;; control ;;;
;;;;;;;;;;;;;;;
;;; ホイールマウス
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mouse t)


;;;;;;;;;;;;;
;;; other ;;;
;;;;;;;;;;;;;
;; dissable startup message
(setq inhibit-startup-message t)

;;; ファイルの先頭に#!...があるファイルを保存すると実行権をつける
(add-hook 'after-save-hook
	  'executable-make-buffer-file-executable-if-script-p)

;;; [yes or no]を[y or n]
(fset 'yes-or-no-p 'y-or-n-p)

;;; 自動スペルチェック
(setq-default flyspell-mode t) (setq ispell-dictionary "american")





;;; GUI
;(if (eq window-system 'ns)
;  (progn
;
;    ; ここにGUIアプリとして起動したときの設定
;    (require 'server)
;    (unless (server-running-p) (server-start)) ; ← こいつで server 起動
;
;    ))
