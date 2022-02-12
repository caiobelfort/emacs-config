
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


(add-to-list 'load-path  "~/.emacs.d/")

(load "editor.el")
(load "packages.el")



