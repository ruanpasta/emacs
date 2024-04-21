(global-display-line-numbers-mode)

;; Removendo menu e barra de ferramentas
(menu-bar-mode -1)
(setq inhibit-startup-screen t)

;; Removendo a tela inicial do emacs
(tool-bar-mode -1)

;; Removendo scroll bar lateral
(scroll-bar-mode -1)

;; Defina a fonte padrão
(set-face-attribute 'default nil :font "Consolas-12")

;; Aumente o tamanho da fonte do modo texto
(set-face-attribute 'default nil :height 140)

;; Set the tango-dark as a default theme
(load-theme 'tango-dark)

(provide 'init-interface)
