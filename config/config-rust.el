(require 'rust-mode)
(require 'flycheck-rust)

(with-eval-after-load 'rust-mode
  (setq rust-format-on-save t)

  ;; cargo
  (add-hook 'rust-mode-hook 'cargo-minor-mode)

  ;; smartparens
  (add-hook 'rust-mode-hook 'smartparens-mode)

  ;; fly-check
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

  ;; identation will use spaces.
  (add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

  ;; treat underscore as part of a word
  (add-hook 'rust-mode-hook '(lambda () (modify-syntax-entry ?_ "w"))))

;; rls
(with-eval-after-load 'lsp-mode
  (add-hook 'rust-mode-hook #'lsp)
  (setq lsp-rust-server 'rls))

(provide 'config-rust)
