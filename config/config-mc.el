;; (require 'evil)
;; (require 'evil-mc)

(global-evil-mc-mode 1)

;; (define-key evil-normal-state-map (kbd "<C-n>")
;;   (lambda () 
;;     (evil-set-jump)
;;     (evil-mc-make-and-goto-next-match)))

;; (define-key evil-normal-state-map (kbd "<C-x>") 'evil-mc-skip-and-goto-next-match)

(provide 'config-mc)
