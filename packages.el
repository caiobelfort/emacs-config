(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))



(use-package which-key
  :ensure t
  )

(use-package company
  :ensure t
  :defer t
  :init (global-company-mode)
  :config
  (progn
    ;; Use Company for completion
    (bind-key [remap completion-at-point] #'company-complete company-mode-map)

    (setq company-tooltip-align-annotations t
          ;; Easy navigation to candidates with M-<n>
          company-show-numbers t)
    (setq company-dabbrev-downcase nil))
  :diminish company-mode)


(use-package company-quickhelp
					; Documentation popups for Company
  :ensure t
  :defer t
  :init (add-hook 'global-company-mode-hook #'company-quickhelp-mode))


(use-package ivy
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :bind(
	("C-x C-f" . 'counsel-find-file)
	("M-x" . 'counsel-M-x)
	)
  
	 
 )


(use-package python-mode
  :mode ("\\.py?\\'" . python-mode)) 

(use-package lsp-pyright
  :hook ((python-mode . (lambda () (require 'lsp-pyright)))
	   (python-mode . lsp-deferred))
  :config
  ;; these hooks can't go in the :hook section since lsp-restart-workspace
  ;; is not available if lsp isn't active
  (add-hook 'conda-postactivate-hook (lambda () (lsp-restart-workspace)))
  (add-hook 'conda-postdeactivate-hook (lambda () (lsp-restart-workspace))))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package conda
  :init
  (setq conda-anaconda-home (expand-file-name "~/miniconda3"))
  (setq conda-env-home-directory (expand-file-name "~/miniconda3"))
  :config
  (conda-env-initialize-interactive-shells)
  (conda-env-initialize-eshell))

(use-package magit)
(use-package projectile
  :init
  (setq projectile-project-search-path '(( "~/projects" . 1))))

  
