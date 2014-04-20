(require 'yasnippet)

 ;; 作成するスニペットはここに入る
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))

;; 最初から入っていたスニペット(省略可能)
;;(setq yas-snippet-dirs
;;      '("~/.emacs.d/elpa/yasnippet/snippets"))

;; active
(yas-global-mode 1)


;; helm interface
(defun my/yas-prompt (prompt choices &optional display-fn)
  (let* ((names (cl-loop for choice in choices
                         collect (or (and display-fn (funcall display-fn choice))
                                     choice)))
         (selected (helm-other-buffer
                    `(((name . ,(format "%s" prompt))
                       (candidates . names)
                       (action . (("Insert snippet" . (lambda (arg) arg))))))
                    "*helm yas/prompt*")))
    (if selected
        (nth (cl-position selected names :test 'equal) choices)
      (signal 'quit "user quit!"))))
(custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))

;; anything interface
;(eval-after-load "anything-config"
;  '(progn
;     (defun my-yas/prompt (prompt choices &optional display-fn)
;       (let* ((names (loop for choice in choices
;                           collect (or (and display-fn (funcall display-fn choice))
;                                       choice)))
;              (selected (anything-other-buffer
;                         `(((name . ,(format "%s" prompt))
;                            (candidates . names)
;                            (action . (("Insert snippet" . (lambda (arg) arg))))))
;                         "*anything yas/prompt*")))
;         (if selected
;             (let ((n (position selected names :test 'equal)))
;               (nth n choices))
;           (signal 'quit "user quit!"))))
;     (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))))


