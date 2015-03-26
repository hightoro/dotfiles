
(require 'highlight-thing)

;;; 現在の関数のみをハイライト対象にする
(setq highlight-thing-limit-to-defun t)

;;; word,sexp,sentence,list,line,number,page,whitespace,defun,filename,url,emailも設定可
(setq highlight-thing-what-thing 'symbol)

;;; ローカルマイナーモード化により更新
(add-to-list 'prog-mode-hook 'highlight-thing-mode)
(add-to-list 'ruby-mode-hook 'highlight-thing-mode)
