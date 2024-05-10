;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))

(use-package counsel
  :ensure t)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package nerd-icons
  ;; :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  ;; (nerd-icons-font-family "Symbols Nerd Font Mono")
  )

;; To improve the project navigation and search
(use-package projectile
  :ensure t
	:bind (("C-c p f" . projectile-find-file)
         ("C-c p p" . projectile-switch-project)
         ("C-c p d" . projectile-find-dir)
         ("C-c p b" . projectile-switch-to-buffer)
         ("C-c p r" . projectile-replace))
  :config
	(add-to-list 'projectile-globally-ignored-directories "node_modules")
  (projectile-mode +1))

;; Setting to use findstr instead of grep when the configs run in windows
(when (eq system-type 'windows-nt)
  (setq grep-command "findstr -n "))

(prefer-coding-system 'utf-8)

(provide 'common-packages)

