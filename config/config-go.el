(require 'go-mode)

(with-eval-after-load 'go-mode
  (add-hook 'before-save-hook 'gofmt-before-save))

(define-key evil-normal-state-map (kbd "t") 'godoc-at-point)

(provide 'config-go)
