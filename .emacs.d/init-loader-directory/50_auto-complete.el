;; auto-complete

(require 'auto-complete-config)
(require 'auto-complete-clang)

;;
(ac-config-default)
;;
(global-auto-complete-mode)

;;
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil);;自動で補完画面を出すならt.補完キーを押すまで補完画面を出さないならnil.数字なら文字数.
(setq ac-ignore-case);;大文字・小文字を区別しない
(setq ac-menu-height 22);;補完列表示数
(setq ac-quick-help-delay);;ヘルプを表示
(setq ac-use-quick-help);ヘルプを表示
