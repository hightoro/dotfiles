;;; オートセーブファイルの保存先指定
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backup/") t)))

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

