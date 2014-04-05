; key-bind

;;; キーバインド
;(define-key global-map "\C-h" 'delete-backward-char) ; 削除
(global-set-key "\C-z" 'undo)             ; C-z で undo
(global-set-key "\C-S-w" 'clipboard-kill-ring-save)
(global-set-key "\C-S-y" 'x-clipborad-yank) ; clip-boardからコピー
