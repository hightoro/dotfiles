
(require 'flycheck)

;; define showing error and warning by g++ (C/C++)
(flycheck-define-checker c/c++-g++
  "A C/C++ checker using g++."
  :command ("g++" "-fsyntax-only" "-Wall" "-Wextra" "-std=c++11" source)
  :error-patterns  ((error line-start
                           (file-name) ":" line ":" column ":" " エラー: " (message)
                           line-end)
                    (warning line-start
                           (file-name) ":" line ":" column ":" " 警告: " (message)
                           line-end))
  :modes (c-mode c++-mode))
(add-to-list 'flycheck-checkers 'c/c++-g++)

