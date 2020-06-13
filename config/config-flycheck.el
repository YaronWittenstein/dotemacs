(require 'flycheck)
(require 'flycheck-inline)

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

(provide 'config-flycheck)
