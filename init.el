;;; package --- Summary
(require 'org)
(require 'ob-tangle)

;;; Code:

;;; Commentary:

;; Initial load
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "desktop.org" user-emacs-directory))

;; Others
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 '(auto-package-update rainbow-delimiters company-box lsp-ivy ivy-prescient ivy-rich exec-path-from-shell toc-org org-bullets command-log-mode dap-mode magit prettier flycheck scss-mode web-mode svelte-mode vue-mode json-mode typescript-mode which-key company lsp-ui lsp-mode projectile doom-modeline counsel ivy doom-themes use-package))
 '(warning-suppress-types '((lsp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
