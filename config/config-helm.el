(require 'helm-config)

(helm-mode 1)

(with-eval-after-load 'helm
    (define-key helm-map (kbd "C-n") 'helm-next-line)
    (define-key helm-map (kbd "C-k") 'helm-previous-line)
    (define-key helm-map (kbd "C-w") 'helm-find-files-up-one-level))

(with-eval-after-load 'helm-dash
  (helm-dash-activate-docset "Rust"))

(provide 'config-helm)
