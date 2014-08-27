;;; バックアップファイルを作らない
;(setq backup-inhibited t)

;;; バックアップファイルの保存先指定
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))

;;; バックアップファイルの保存数設定
(setq version-control t)
(setq kept-new-versions 5)
;(setq kept-old-versions 5)
(setq delete-old-versions t)
