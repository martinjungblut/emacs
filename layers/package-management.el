;; declare required packages
(setq package-list '())
(add-to-list 'package-list 'use-package)

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
