; key-bind

;;; キーバインド
;(define-key global-map "\C-h" 'delete-backward-char) ; 削除
(global-set-key (kbd "C-w") 'nil)             ; C-z で undo
(global-set-key (kbd "C-z") 'undo)             ; C-z で undo
(global-set-key (kbd "C-S-w") 'clipboard-kill-ring-save) ;
(global-set-key (kbd "C-S-y") 'x-clipborad-yank) ; clip-boardからコピー
