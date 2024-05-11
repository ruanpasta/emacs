
(require 'org)
(require 'ob-tangle)

;;; Code:
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 '(prettier scss-mode flycheck web-mode svelte-mode vue-mode json-mode projectile doom-themes doom-modeline counsel company typescript-mode which-key dap-mode lsp-treemacs lsp-ivy helm-lsp lsp-ui lsp-mode ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
