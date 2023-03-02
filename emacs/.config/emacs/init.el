
;;; PACKAGE LIST
(setq package-archives 
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")))

;;; BOOTSTRAP USE-PACKAGE
(package-initialize)
(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;;; UNDO
;; Vim style undo not needed for emacs 28
(use-package undo-fu)

;;; Vim Bindings
(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  ;; allows for using cgn
  ;; (setq evil-search-module 'evil-search)
  (setq evil-want-keybinding nil)
  ;; no vim insert bindings
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1))

;;; Vim Bindings Everywhere else
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package doom-themes
  :config
  (load-theme `doom-one t))

(use-package magit
  :ensure t)

(use-package dashboard
  :ensure t
  :config
    (dashboard-setup-startup-hook)
    (setq dashboard-startup-banner "~/.config/emacs/img/emacs.png")
    (setq dashboard-items '((recents  . 5)
			    (bookmarks . 5)
			    (agenda . 5)
			    (projects . 5)))
    (setq dashboard-banner-logo-title "This is a test"))

;; Keep custom-set-variables and friends out of my init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(setq inhibit-startup-screen t)

; Hide ugly gui stuff
(menu-bar-mode -1) 
(scroll-bar-mode -1) 
(tool-bar-mode -1)
(setq use-dialog-box nil)
(fringe-mode -1)
