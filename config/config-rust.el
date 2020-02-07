(require 'rust-mode)
(require 'lsp-mode)

(with-eval-after-load 'rust-mode
  (setq rust-format-on-save t)
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  (add-hook 'rust-mode-hook 'smartparens-mode)

  ;; treat underscore as part of a word
  (add-hook 'rust-mode-hook '(lambda () (modify-syntax-entry ?_ "w"))))

;; lsp
(with-eval-after-load 'lsp-mode
  (add-hook 'rust-mode-hook #'lsp))

(define-key evil-normal-state-map (kbd "t") 'lsp-find-definition)
(define-key evil-normal-state-map (kbd "r") 'lsp-find-references)

;; cargo
(setq cargo-process--command-clean "+nightly clean")
(setq cargo-process--command-build "+nightly build")
(setq cargo-process--command-run "+nightly run")
(setq cargo-process--command-test "+nightly test -- --nocapture")
(setq cargo-process--command-current-test "+nightly test -- --nocapture")
(setq cargo-process--command-current-file-tests "+nightly test -- --nocapture")

;; (define-key cargo-minor-mode-map (kbd "C-t") 'cargo-process-current-test)
;; (define-key cargo-minor-mode-map (kbd "C-f") 'cargo-process-current-file-tests)
;; (define-key cargo-minor-mode-map (kbd ",t") 'cargo-process-current-test)
;; (define-key cargo-minor-mode-map (kbd ",f") 'cargo-process-current-file-tests))

(provide 'config-rust)
