
;;;;Org mode configuration
;; Enable Org mode
(require 'org)
(require 'cl-lib)

(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))

(setq custom-file
      (expand-file-name "custom.el"
			user-emacs-directory))
