; evil
(require 'evil)
(setq evil-default-state 'normal)
(setq evil-auto-indent t)
(setq evil-esc-delay 0)
(evil-mode 1)

; evil-leader (should be enabled before `evil-mode`)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  ","  'helm-projectile
  "m"  'helm-find-files
  "b"  'helm-buffers-list
  "h"  'helm-find-files-history
  "k"  'helm-show-kill-ring
  "d"  'helm-dash-at-point
  "r"  'recentf-open-files
  "w"  'save-buffer
  "q"  'evil-quit
  "x"  'evil-save-and-quit
  "cc" 'split-window-below
  "vv" 'split-window-right)

;; C-s
(define-key evil-normal-state-map (kbd "C-s") 'save-buffer)

; evil-search
(evil-select-search-module 'evil-search-module 'evil-search)

; Colemak
(define-key evil-normal-state-map (kbd "n") 'next-line)
(define-key evil-visual-state-map (kbd "n") 'next-line)

;; (defun clean-search-and-mc ()
;;   "Clean last highlight-search and quit multiple-cursors"
;;   (interactive)
;;   (evil-ex-nohighlight)
;;   (evil-mc-undo-all-cursors))

;; (define-key evil-normal-state-map (kbd "RET") 'clean-search-and-mc)
;; (define-key evil-normal-state-map (kbd "<escape>") 'clean-search-and-mc)

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
