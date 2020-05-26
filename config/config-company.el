(require 'company)

(with-eval-after-load 'company
  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'prog-mode-hook 'company-mode)

  (setq company-tooltip-align-annotations t)
  (setq company-backends '((company-capf company-dabbrev-code company-files)))

  (define-key company-active-map (kbd "RET") 'company-complete)
  (define-key company-active-map (kbd "TAB") 'company-select-next)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-k") 'company-select-previous)
  (define-key company-active-map (kbd "<backtab>") 'company-select-previous)

  (with-eval-after-load 'evil
    (define-key evil-insert-state-map (kbd "C-.") 'company-files)))

(provide 'config-company)
