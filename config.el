;; Add MELPA repository
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Update the package list
(unless package-archive-contents
  (package-refresh-contents))

;; Install the material theme
(unless (package-installed-p 'material-theme)
  (package-install 'material-theme))

;; Load the material theme
(load-theme 'material t)

(global-display-line-numbers-mode t)    ;; Display the lines numeration
(menu-bar-mode -1)                      ;; Remove the menubar
(tool-bar-mode -1)                      ;; Remove the toolbar
(scroll-bar-mode -1)                    ;; Remove the scrollbar

(column-number-mode t)                  ;; Display the current column in modeline
(global-visual-line-mode t)             ;; Automatic line wrapping

(defun cancel-all-commands()
  "Cancel all commands in progress."
  (interactive)
  (keyboard-quit))

(global-set-key (kbd "<escape>") 'cancel-all-commands)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((js . t)))
