;; declare required packages
(setq package-list '())
(add-to-list 'package-list 'ace-jump-mode)
(add-to-list 'package-list 'company)
(add-to-list 'package-list 'company-lsp)
(add-to-list 'package-list 'company-quickhelp)
(add-to-list 'package-list 'discover)
(add-to-list 'package-list 'elpy)
(add-to-list 'package-list 'evil)
(add-to-list 'package-list 'evil-surround)
(add-to-list 'package-list 'f)
(add-to-list 'package-list 'flymd)
(add-to-list 'package-list 'go-mode)
(add-to-list 'package-list 'helm)
(add-to-list 'package-list 'js2-mode)
(add-to-list 'package-list 'js2-refactor)
(add-to-list 'package-list 'kaolin-themes)
(add-to-list 'package-list 'lsp-mode)
(add-to-list 'package-list 'lsp-ui)
(add-to-list 'package-list 'magit)
(add-to-list 'package-list 'markdown-mode)
(add-to-list 'package-list 'powerline)
(add-to-list 'package-list 'smartparens)
(add-to-list 'package-list 'which-key)
(add-to-list 'package-list 'xref-js2)

;; declare package repositories
(setq package-archives '())
(add-to-list 'package-archives
	     '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;; enable package management
(require 'package)
(package-initialize)

;; update all package repositories unless all required packages are installed and archive contents are available
(setq refresh-contents-needed nil)
(unless package-archive-contents
  (setq refresh-contents-needed t))
(dolist (package package-list)
  (unless (package-installed-p package)
    (setq refresh-contents-needed t)))
(if refresh-contents-needed (package-refresh-contents))

;; install all required packages automatically
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
