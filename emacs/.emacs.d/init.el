
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
 '(custom-safe-themes
   (quote
    ("79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "fe94e2e42ccaa9714dd0f83a5aa1efeef819e22c5774115a9984293af609fce7" "730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "dcdd1471fde79899ae47152d090e3551b889edf4b46f00df36d653adc2bf550d" "d71aabbbd692b54b6263bfe016607f93553ea214bc1435d17de98894a5c3a086" "912cac216b96560654f4f15a3a4d8ba47d9c604cbc3b04801e465fb67a0234f0" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" default)))
 '(org-agenda-files
   (quote
    ("/home/jacob/work/1/test1.org" "/home/jacob/work/1/test2.org" "/home/jacob/work/2/test2.org" "/home/jacob/work/notes/service-desk.org" "/home/jacob/work/notes/writing.org" "/home/jacob/work/programming/python/notes/python.org" "/home/jacob/work/programming/python/test2/python.org" "/home/jacob/work/programming/python/test2/test.org")))
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (yasnippet-snippets elixir-yasnippets ember-yasnippets zotxt org-ref ivy-bibtex use-package ox-pandoc pandoc-mode minimap dashboard all-the-icons projectile page-break-lines olivetti darkroom dracula-theme restart-emacs magit)))
 '(writeroom-fullscreen-effect (quote maximized))
 '(writeroom-maximize-window nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )





