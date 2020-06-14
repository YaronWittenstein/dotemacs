(require 'evil)
(require 'magit)

(with-eval-after-load 'evil
  (with-eval-after-load 'magit 
    (setq evil-magit-state 'normal)
    ;;
    ))

(provide 'config-magit)
