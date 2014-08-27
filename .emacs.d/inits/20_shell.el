;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  [ shell Mode ]
;;
;;  Command : M-x shell
;;
;;  単純な機能としては貧弱。タブによる補完などが十分にできない。
;;  カスタマイズ性はややすぐれている
;;  Zsh と連携したり Bash の最新機能を利用しよとうすると不便。
;;
;;
;;
;;  [ term (あるいはansi-term) ]
;;
;;  Command : M-x term (もしくは M-x ansi-term)
;;
;;  (term と ansi-term は同じ物)
;;  カスタマイズ性がややよろしく無い
;;  機能がすぐれており、Zsh や Bash と連携させるなら、このモード。
;;
;;
;;
;;  [ eshell Mode ]
;;
;;  Command M-x eshell
;;
;;  Emacs Lisp のみで実装された Shell 。
;;  shell の中で Emacs Lisp 関数を利用できたり、Emacs Lisp な関数をその場で定義することが可能。
;;  Windows のように Cygwin を入れないと Bash や Zsh を利用できない環境では便利。
;;  カスタマイズも Emacs Lisp でかなり高度にできる。
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;
;; [ Term Mode ] ;;
;;;;;;;;;;;;;;;;;;;
;; より下に記述した物が PATH の先頭に追加されます
;(dolist (dir (list
;              "/sbin"
;              "/usr/sbin"
;              "/bin"
;              "/usr/bin"
;              ;"/opt/local/bin"
;              ;"/sw/bin"
;              "/usr/local/bin"
;              (expand-file-name "~/bin")
;              (expand-file-name "~/local/bin")
;              (expand-file-name "~/.emacs.d/bin")
;              ))
;
; ;; PATH と exec-path に同じ物を追加します
; (when (and (file-exists-p dir) (not (member dir exec-path)))
;   (setenv "PATH" (concat dir ":" (getenv "PATH")))
;   (setq exec-path (append (list dir) exec-path))));


;; shell の存在を確認
;(defun skt:shell ()
;  (or (executable-find "zsh")
;      (executable-find "bash")
;      ;; (executable-find "f_zsh") ;; Emacs + Cygwin を利用する人は Zsh の代りにこれにしてください
;      ;; (executable-find "f_bash") ;; Emacs + Cygwin を利用する人は Bash の代りにこれにしてください
;      ;; (executable-find "cmdproxy")
;      (error "can't find 'shell' command in PATH!!")))

;; Shell 名の設定
;(setq shell-file-name (skt:shell))
;(setenv "SHELL" shell-file-name)
;(setq explicit-shell-file-name shell-file-name)

;;;;;;;;;;;;;;;;;;;;;;;;
;; [ Mult-term Mode ] ;;
;;;;;;;;;;;;;;;;;;;;;;;;
;;(require 'multi-term)


