; evil
(require 'evil)
(require 'evil-leader)
(require 'evil-multiedit)
(require 'evil-visualstar)
(require 'evil-magit)

(setq evil-default-state 'normal)
(setq evil-auto-indent t)
(setq evil-esc-delay 0)
(evil-mode 1)

; evil-leader (should be enabled before `evil-mode`)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "w"  'save-buffer
  "q"  'evil-quit
  "x"  'evil-save-and-quit
  "cc" 'split-window-below
  "vv" 'split-window-right)

(with-eval-after-load 'recentf
  (evil-leader/set-key
    "r"  'recentf-open-files))

(with-eval-after-load 'helm
  (evil-leader/set-key
    "m"  'helm-find-files
    "f"  'helm-projectile
    "b"  'helm-buffers-list
    "h"  'helm-find-files-history
    "k"  'helm-show-kill-ring))

(with-eval-after-load 'cargo
  (evil-leader/set-key
    "c" 'cargo-process-build
    "t" 'cargo-process-current-test))
  

;; lsp-ui
(with-eval-after-load 'lsp-ui
  (evil-leader/set-key
    "d"  'lsp-ui-doc))

;; magit
(with-eval-after-load 'magit
  (evil-leader/set-key
    "s" 'magit-status
    "," 'magit-file-dispatch))

;; save-buffer
(define-key evil-normal-state-map (kbd "C-s") 'save-buffer)

; evil-search
(evil-select-search-module 'evil-search-module 'evil-search)

; Colemak
(define-key evil-normal-state-map (kbd "n") 'next-line)
(define-key evil-visual-state-map (kbd "n") 'next-line)

; evil-visualstar
(global-evil-visualstar-mode)

; evil-multiedit
(define-key evil-normal-state-map (kbd "SPC") 'evil-multiedit-match-symbol-and-next)
(define-key evil-visual-state-map (kbd "SPC") 'evil-multiedit-match-symbol-and-next)

;; (define-key evil-normal-state-map (kbd "C-k") 'evil-multiedit-match-and-prev)
;; (define-key evil-visual-state-map (kbd "C-k") 'evil-multiedit-match-and-prev)

(define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
(define-key evil-multiedit-state-map (kbd "C-k") 'evil-multiedit-prev)
(define-key evil-multiedit-state-map (kbd "C-x") #'evil-multiedit-toggle-or-restrict-region)

;; C-h
(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char)

;; Comments
(define-key evil-normal-state-map (kbd "gcc") 'comment-line)
(define-key evil-visual-state-map (kbd "gc") 'comment-or-uncomment-region)

;; Windows
(define-key evil-normal-state-map (kbd "C-w") 'evil-window-next)

; evil-terminal-cursor-changer
(setq evil-motion-state-cursor 'box)
(setq evil-visual-state-cursor 'box)
(setq evil-normal-state-cursor 'box)
(setq evil-insert-state-cursor 'bar)
(setq evil-emacs-state-cursor  'hbar)
(evil-terminal-cursor-changer-activate)

; Escape quits
(defun minibuffer-keyboard-quit ()
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
  (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
  (abort-recursive-edit)))

(define-key evil-visual-state-map [escape] 'keyboard-quit)

(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(provide 'config-evil)
