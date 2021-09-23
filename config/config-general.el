; Theme
;(load-theme 'dracula t)

; Turn off UI elements
(menu-bar-mode -1)
(tool-bar-mode 0)

; Say y or n instead of yes or no
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(defalias 'yes-or-no-p 'y-or-n-p)

; Line numbers
(global-linum-mode 1)
(setq linum-format " %4d ")

; Reduce startup screen noise
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

; Remember buffer last visited place
(save-place-mode 1)

; Recent Files
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(setq recentf-max-saved-items 10)

;; Colemak
(define-key recentf-dialog-mode-map (kbd "C-n") 'next-line)
(define-key recentf-dialog-mode-map (kbd "C-k") 'previous-line)
(define-key recentf-dialog-mode-map (kbd "n") 'next-line)
(define-key recentf-dialog-mode-map (kbd "k") 'previous-line)

; Save mini-buffer history
(savehist-mode t)

; Don't create lockfiles
(setq create-lockfiles nil)

(provide 'config-general)
