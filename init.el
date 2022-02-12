
(setq package-archives
'(
   ("org" . "https://orgmode.org/elpa/")
   ("gnu" . "https://elpa.gnu.org/packages/")
   ("melpa" . "https://melpa.org/packages/")
))

(package-initialize)


(unless package-archive-contents
  (package-refresh-contents))


;; Instalação do use package
(unless (package-installed-p 'use-package)
	(package-install 'use-package))
(require 'use-package)


(add-to-list 'load-path  "~/.emacs.d/customizations")

(load "editor.el")
(load "packages.el")



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(projectile magit conda lsp-ui lsp-pyright python-mode ivy company-quickhelp company which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
