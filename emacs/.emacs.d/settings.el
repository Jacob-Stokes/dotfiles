(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)



(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)

(transient-mark-mode 1)

(setq inhibit-splash-screen t)

(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'dashboard)
(dashboard-setup-startup-hook)

(defun dcaps-to-scaps ()
  "Convert word in DOuble CApitals to Single Capitals."
  (interactive)
  (and (= ?w (char-syntax (char-before)))
       (save-excursion
         (and (if (called-interactively-p)
                  (skip-syntax-backward "w")
                (= -3 (skip-syntax-backward "w")))
              (let (case-fold-search)
                (looking-at "\\b[[:upper:]]\\{2\\}[[:lower:]]"))
              (capitalize-word 1)))))

(add-hook 'post-self-insert-hook #'dcaps-to-scaps nil 'local)


;; Dubcaps mode

(define-minor-mode dubcaps-mode
  "Toggle `dubcaps-mode'.  Converts words in DOuble CApitals to
Single Capitals as you type."
  :init-value nil
  :lighter (" DC")
  (if dubcaps-mode
      (add-hook 'post-self-insert-hook #'dcaps-to-scaps nil 'local)
    (remove-hook 'post-self-insert-hook #'dcaps-to-scaps 'local)))

(add-hook 'org-mode-hook 'dubcaps-mode)
(add-hook 'markdown-mode-hook 'dubcaps-mode)

(use-package flyspell-correct
     :ensure t
 :after flyspell
  :bind (:map flyspell-mode-map ("C-;" . flyspell-correct-wrapper)))

(use-package flyspell-correct-ivy
    :ensure t 
 :after flyspell-correct)

;; Hook to org mode
(add-hook 'org-mode-hook 'flyspell-mode)

(global-set-key (kbd "<f5>") 'restart-emacs)
(global-set-key (kbd "<f6>") 'olivetti-mode)
(global-set-key (kbd "<f12>") 'open-file-fast)
(global-set-key (kbd "<M-f12>") 'package-install)

(defun other-window-kill-buffer ()
  "Kill the buffer in the other window"
  (interactive)
  ;; Window selection is used because point goes to a different window
  ;; if more than 2 windows are present
  (let ((win-curr (selected-window))
	(win-other (next-window)))
    (select-window win-other)
    (kill-this-buffer)
    (select-window win-curr)))

(global-set-key (kbd "C-x K") 'other-window-kill-buffer)

(defun is-help-buffer (buffer)
  (let ((name (buffer-name buffer)))
    (and (= ?* (aref name 0))
	 (string-match "Help" name))))

(defun kill-help-buffers ()
  (interactive)
  (cl-loop for buffer being the buffers
	do (and (is-help-buffer buffer) (kill-buffer buffer))))

(global-set-key (kbd "C-x C-k h") 'kill-help-buffers)

(add-hook 'org-mode-hook 'pandoc-mode)

(eval-after-load "org"
  '(require 'ox-md nil t))

(add-hook 'org-mode-hook 'pandoc-mode)

(setq org-pandoc-options-for-latex-pdf '((pdf-engine . "pdflatex")))

(set-register ?s (cons 'file "~/.emacs.d/settings.org"))

(global-set-key (kbd "<f7>") 'shell)

(defun open-file-fast ()
  "Prompt to open a file from bookmark `bookmark-bmenu-list'.
This command is similar to `bookmark-jump', but use `ido-mode' interface, and ignore cursor position in bookmark.

URL `http://ergoemacs.org/emacs/emacs_hotkey_open_file_fast.html'
Version 2019-02-26"
  (interactive)
  (require 'bookmark)
  (bookmark-maybe-load-default-file)
  (let (($this-bookmark
         (ido-completing-read "Open bookmark:" (mapcar (lambda ($x) (car $x)) bookmark-alist))))
    (find-file (bookmark-get-filename $this-bookmark))
    ;; (bookmark-jump $this-bookmark)
    ))

(use-package counsel :ensure t
  :after ivy
  :bind (("M-x" . 'counsel-M-x)
	 ("C-x C-f" . 'counsel-find-file)
	 ("<f1> f" . 'counsel-describe-function)
	 ("<f1> v" . 'counsel-describe-variable)
	 ("<f1> o" . 'counsel-describe-symbol)
	 ("<f1> l" . 'counsel-find-library)
	 ("<f2> i" . 'counsel-info-lookup-symbol)
	 ("<f2> u" . 'counsel-unicode-char)
	 ("C-c g" . 'counsel-git)
	 ("C-c j" . 'counsel-git-grep)
	 ("C-c k" . 'counsel-ag)
	 ("C-S-o" . 'counsel-rhythmbox)
	 :map minibuffer-local-map ("C-r" . 'counsel-minibuffer-history)))

(use-package ivy :ensure t
  :init (setq ivy-use-virtual-buffers t
	      enable-recursive-minibuffers t)
 :demand  :config (ivy-mode 1)
 :bind (("C-c C-r" . ivy-resume)))

(use-package swiper :ensure t
  :after ivy
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)))

(use-package switch-window
 :ensure t
 :bind (("C-x o" . switch-window)
	 ("C-x 1" . switch-window-then-maximize)
	 ("C-x 2" . switch-window-then-split-below)
	 ("C-x 3" . switch-window-then-split-right)
	 ("C-x 0" . switch-window-then-delete)
	 ("C-x 4 d" . switch-window-then-dired)
	 ("C-x 4 f" . switch-window-then-find-file)
	 ("C-x 4 m" . switch-window-then-compose-mail)
	 ("C-x 4 r" . switch-window-then-find-file-read-only)
	 ("C-x 4 C-f" . switch-window-then-find-file)
	 ("C-x 4 C-o" . switch-window-then-find-file-read-only)
	 ("C-x 4 C-f" . switch-window-then-find-file)
	 ("C-x 4 C-o" . switch-window-then-display-buffer)
	 ("C-x 4 0" . switch-window-then-kill-buffer)))

(defvar org-blocks-hidden nil)

(defun org-toggle-blocks ()
  (interactive)
  (if org-blocks-hidden
      (org-show-block-all)
    (org-hide-block-all))
  (setq-local org-blocks-hidden (not org-blocks-hidden)))

(add-hook 'org-mode-hook 'org-toggle-blocks)

(define-key org-mode-map (kbd "C-c t") 'org-toggle-blocks)

(setq org-src-tab-acts-natively t)
