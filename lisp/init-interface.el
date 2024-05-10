(global-display-line-numbers-mode)

;; Removendo menu e barra de ferramentas
(menu-bar-mode -1)
(setq inhibit-startup-screen t)

;; Removendo a tela inicial do emacs
(tool-bar-mode -1)

;; Removendo scroll bar lateral
(scroll-bar-mode -1)

;; Defina a fonte padrão
(set-face-attribute 'default nil :font "FiraCode Nerd Font Mono")

;; Aumente o tamanho da fonte do modo texto
(set-face-attribute 'default nil :height 140)

;; Set the tango-dark as a default theme ( I'm using the doom-one theme in common-packages.el
;; (load-theme 'tango-dark)

;; Deflaut tab size
(setq-default tab-width 2)

;; Seting the backtab to delete a tab
(global-set-key (kbd "<backtab>") 'backward-delete-char)

;; Defina o diretório para armazenar arquivos temporários
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "auto-save/") t)))

;; Crie o diretório se ele não existir
(unless (file-exists-p (concat user-emacs-directory "auto-save/"))
  (make-directory (concat user-emacs-directory "auto-save/")))

(provide 'init-interface)
