
;;;;Org mode configuration
;; Enable Org mode
(require 'org)
(require 'cl-lib)

(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (use-package ox-pandoc pandoc-mode minimap dashboard all-the-icons projectile page-break-lines olivetti darkroom dracula-theme restart-emacs magit)))
 '(writeroom-fullscreen-effect (quote maximized))
 '(writeroom-maximize-window nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )





