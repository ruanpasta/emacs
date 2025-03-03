;; (setq debug-on-error t) ;; To debbug the startup
;; --------------- STRAT UP -------------------
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


;; Automatic package update
(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

;; Initialize Node PATH into Emacs
(use-package exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-envs '("PATH" "NODE_PATH")))

;; ------------- INTERFACE --------------
;; Show the line numbers
(global-display-line-numbers-mode)

;; Break lines in emacs to dosen't have vertical scroll
(global-visual-line-mode 1)

;; Removing the menu from toolbar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Removing the inicial emacs screen
(setq inhibit-startup-screen t)

;; Removing the side scroll bar
(scroll-bar-mode -1)

;; Defining the default font family
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font")

;; Increasing the font size
(set-face-attribute 'default nil :height 140)

;; Deflaut tab size
(setq-default tab-width 2)

;; Add the option to collapse function, objects etc ( C-c @ C-h )
(add-hook 'prog-mode-hook #'hs-minor-mode)


(use-package almost-mono-themes
  :config
  ;; (load-theme 'almost-mono-black t)
  ;; (load-theme 'almost-mono-gray t)
  (load-theme 'almost-mono-cream t))
;;(load-theme 'almost-mono-white t))

;; --- IMPORTANT PACKAGES ---
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

;; Cider
(use-package cider
  :ensure t)

;; Whichkey
(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

;; Magit
(use-package magit
  :ensure t)

;; ORG
(use-package org
  :ensure t
  :custom
  (org-confirm-babel-evaluate nil)
  (org-startup-indented t)
  (org-ellipsis " ▾"))

(use-package org-bullets
  :ensure t
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((js . t)))

(use-package toc-org
  :ensure t
  :config
  (toc-org-mode 1))

;; ORG Agenda
(setq org-agenda-files
      (directory-files-recursively "/home/ruan.pasta/projects/agenda" "\\`[^#].*\\.org\\'"))

(setq org-agenda-files
      (remove "/home/ruan.pasta/projects/agenda/dg.org" org-agenda-files))

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)

(setq org-agenda-show-tags t)

;; Ivy and counsel
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :after counsel
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :after ivy:
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))


(use-package ivy-prescient
  :after counsel
  :custom
  (ivy-prescient-enable-filtering nil)
  :config
  ;; Uncomment the following line to have sorting remembered across sessions!
																				;(prescient-persist-mode 1)
  (ivy-prescient-mode 1))

;; Paredit

(use-package paredit													
  :ensure t																	  
  :hook ((emacs-lisp-mode . paredit-mode)		  
         (lisp-mode . paredit-mode)					  
         (clojure-mode . paredit-mode)))

;; A Bad solution to resolve the bug:
;; (setq max-lisp-eval-depth 10000)

;; Projectile
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

;; Company (for auto-completions)
(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0))

;; Supress popup warnings in emacs
(setq warning-suppress-log-types '((comp)))
(setq warning-suppress-types '((comp)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
	 '("/home/ruan.pasta/projects/agenda/brasil-paralelo.org" "/home/ruan.pasta/projects/agenda/personal.org"))
 '(package-selected-packages
	 '(exec-path-from-shell company-cider company paredit ivy-prescient counsel ivy-rich ivy almost-mono-themes toc-org org-bullets which-key magit cider projectile auto-package-update)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
