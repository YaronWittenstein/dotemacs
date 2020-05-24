(require 'package)

(setq package-enable-at-startup nil)

(package-initialize)

(require 'cask "~/.cask/cask.el")

(cask-initialize)

(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "custom" user-emacs-directory))

; config
(require 'config-general)
(require 'config-helm)
(require 'config-evil)
(require 'config-rust)
(require 'config-go)
(require 'config-smartparens)
