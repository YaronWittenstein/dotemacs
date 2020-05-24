(require 'lsp-mode)

(with-eval-after-load 'lsp-mode
  (setq lsp-file-watch-threshold 10000)

  (with-eval-after-load 'evil
    (define-key evil-normal-state-map (kbd "t") 'lsp-find-definition)
    (define-key evil-normal-state-map (kbd "r") 'lsp-find-references)))

(provide 'config-lsp)
