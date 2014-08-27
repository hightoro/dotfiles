;;
;; auto-complete
;;
(require 'auto-complete-config)

;; active
(ac-config-default)           ; いろいろauto-complete-modeに指定 
;(global-auto-complete-mode)  ; 全てのモードで補完を有効に

;; key
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)      ; C-n/C-pで候補選択可能

;; option
(setq ac-auto-start 2)        ; 自動で補完画面を出すならt.
                              ; 補完キーを押すまで補完画面を出さないならnil.
                              ; 数字なら文字数.
(setq ac-auto-show-menu 0.5)  ; 0.5秒でメニュー表示
(setq ac-ignore-case nil)     ; 大文字・小文字を区別する(t)しない(nil)
(setq ac-use-comphist t)      ; 補完候補をソート
(setq ac-menu-height 22)      ; 補完列表示数
(setq ac-candidate-limit nil) ; 補完候補表示を無制限に
(setq ac-quick-help-delay)    ; ヘルプを表示
(setq ac-use-quick-help nil)  ; tool tip 無し

;; path
; 辞書ファイルのディレクトリ
; (setq ac-dictionary-directories "~/.emacs.d/ac-dict")
; 補完履歴のキャッシュ先
; (setq ac-comphist-file "~/.emacs.d/ac-comphist.dat")

;;
;; auto-complete-clang ( using clang_complete )
;;
;(require 'auto-complete-clang)
(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  (message " * calling ac-cc-mode-clang-setup")
  (setq ac-clang-complete-executable (expand-file-name "~/.emacs.d/clang-complete"))
  (setq ac-sources (append '(ac-source-clang-async) ac-sources))   ; source
  (setq ac-clang-cflags (append '("-std=c++1y") ac-clang-cflags))  ; append cflags(c++-1y)
  (setq ac-clang-cflags
        (mapcar (lambda (item)
                  (concat "-I" (expand-file-name item)))
                (split-string "/usr/include/clang/3.4/include /usr/include")))
  (ac-clang-launch-completion-process)
)

;; c-mode
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)

;; c++-mode
(add-hook 'c++-mode-common-hook 'ac-cc-mode-setup)

;; other-mode
(add-hook 'auto-complete-mode-hook 'ac-common-setup)
;(global-auto-complete-mode t)



;; C++-mode-hook
;(defun ac-cc-init ()
;  (ac-cc-mode-setup)
;  (setq ac-clang-prefix-header "~/.emacs.d/elisp/auto-complete/stdafx.pch")
;  (setq ac-clang-flags
;        '("-std=c++11" "-w" "-ferror-limit" "1")) ; C++11の場合 
;  (setq ac-sources (append
;                    '(ac-source-clang
;                      ac-source-yasnippet
;                      ac-source-gtags)
;                    ac-sources)))
;; hook
;(add-hook 'c++-mode-hook 'ac-cc-init)
