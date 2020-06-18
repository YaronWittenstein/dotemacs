(require 'package)

(setq package-enable-at-startup nil)

(package-initialize)

(require 'cask "~/.cask/cask.el")

(cask-initialize)

(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "custom" user-emacs-directory))

;; Spelling
;;
;; requires `ispell` first.
;; on macOS:
;; brew install ispell
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

; config
(require 'config-general)
(require 'config-helm)
(require 'config-company)
(require 'config-flycheck)
(require 'config-magit)
(require 'config-evil)
(require 'config-lsp)
(require 'config-rust)
(require 'config-go)
(require 'config-typescript)
(require 'config-smartparens)
