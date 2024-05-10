(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (
				 (json-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)
         (web-mode . lsp-deferred)
         (svelte-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         (vue-mode . lsp-deferred)
	       (typescript-mode . lsp-deferred)
				 (scss-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp lsp-deferred)

;; Auto completion package
(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
              ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
              ("<tab>" . company-indent-or-complete-common)))

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :init
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'top
        lsp-ui-doc-header t
        lsp-ui-doc-include-signature t
        lsp-ui-sideline-enable t
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-sideline-show-hover nil
        lsp-ui-sideline-show-symbol t
        lsp-ui-sideline-show-diagnostics t
        lsp-ui-sideline-update-mode 'line
        lsp-ui-sideline-delay 1.0
        lsp-ui-imenu-enable t
				lsp-ui-flycheck-enable t
        lsp-ui-flycheck-list-position 'right
        lsp-ui-flycheck-live-reporting t
        lsp-ui-flycheck-list-position 'right
        lsp-ui-flycheck-live-reporting t
        lsp-ui-peek-enable t
        lsp-ui-peek-list-width 60
        lsp-ui-peek-peek-height 25
        lsp-ui-peek-fontify 'always
        lsp-ui-imenu-kind-position 'top
				lsp-headerline-breadcrumb-enable nil
        lsp-ui-remap-xref-keybindings t))

;; For TypeScript/JavaScript/React/Node.js
(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred))

;; For JSON
(use-package json-mode
  :ensure t
  :mode "\\.json\\'"
  :hook (json-mode . lsp-deferred))

;; For Vue.js
(use-package vue-mode
  :ensure t
  :mode "\\.vue\\'"
  :hook (vue-mode . lsp-deferred))

;; For Svelte
(use-package svelte-mode
  :ensure t
  :mode "\\.svelte\\'"
  :hook (svelte-mode . lsp-deferred))

;; For HTML/CSS
(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
         ("\\.css\\'" . web-mode)
         ("\\.tsx\\'" . web-mode)
         ("\\.jsx\\'" . web-mode))
  :hook (web-mode . lsp-deferred))

(use-package scss-mode
  :ensure t)

;; optionally if you want to use debugger
(use-package dap-mode
  :after lsp-mode
  :commands dap-debug)

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

;; Instalar o pacote flycheck
(use-package flycheck
  :ensure t
  :config
  ;; Ativar o flycheck globalmente
  (global-flycheck-mode))

(use-package prettier
  :ensure t
  :hook ((js2-mode . prettier-mode)
         (web-mode . prettier-mode)
         (typescript-mode . prettier-mode)
         (json-mode . prettier-mode)
         (scss-mode . prettier-mode)))

(setq typescript-indent-level 2)

(provide 'language-servers)
