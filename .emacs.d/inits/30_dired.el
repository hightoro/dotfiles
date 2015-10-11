(require 'dired)

;; lsオプションの設定
; 今のところこれを設定するとエラーになる（2015.7.12）
;(setq dired-listing-switches "-AFhvl")

;; lsの日付フォーマットの指定
;http://blog.livedoor.jp/tek_nishi/tag/dired
(setq ls-lisp-use-localized-time-format t)
(setq ls-lisp-format-time-list (quote ("%Y-%m-%d %H:%M" "%Y-%m-%d %H:%M")))

;; ディレクトリを先に表示する
(setq ls-lisp-dirs-first t)

;; diredを２つ表示しているときにコピー先がもう一方になる
(setq dired-dwim-target t)

;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)

;; ファイルなら別バッファで、ディレクトリなら同じバッファで開く
; http://nishikawasasaki.hatenablog.com/entry/20120222/1329932699
;(defun dired-open-in-accordance-with-situation ()
;  (interactive)
;  (let ((file (dired-get-filename)))
;    (if (file-directory-p file)
;        (dired-find-alternate-file)
;      (dired-find-file))))

;; バッファを複数作成しない関数
; http://tam5917.hatenablog.com/entry/20130126/1359206522
(defun dired-open-in-accordance-with-situation ()
  (interactive)
  (cond ((string-match "\\(?:\\.\\.?\\)"
                       (format "%s" (thing-at-point 'filename)))
         (dired-find-alternate-file))
        ((file-directory-p (dired-get-filename))
         (dired-find-alternate-file))
        (t
         (dired-find-file))))

;; ディレクトリに戻る時も、同一バッファで開く
;; cf: http://www.bookshelf.jp/soft/meadow_25.html#SEC28
(defvar my-dired-before-buffer nil)
(defadvice dired-up-directory (before kill-up-dired-buffer activate)
  (setq my-dired-before-buffer (current-buffer)))
(defadvice dired-up-directory (after kill-up-dired-buffer-after activate)
  (if (and (equal major-mode 'dired-mode)
           (not (equal my-dired-before-buffer (current-buffer)))) ;リンク先のだとルートでやったら完全消滅したので追加
      (kill-buffer my-dired-before-buffer)))

;; RETに割り当てる
(define-key dired-mode-map (kbd "RET") 'dired-open-in-accordance-with-situation)

;; 左右キーにも割り当てる
(define-key dired-mode-map (kbd "<left>") 'dired-up-directory)
(define-key dired-mode-map (kbd "<right>") 'dired-open-in-accordance-with-situation)


;; diredに色を付ける(dired-k)
(require 'dired-k)
(define-key dired-mode-map (kbd "g") 'dired-k)
(add-hook 'dired-initial-position-hook 'dired-k)
