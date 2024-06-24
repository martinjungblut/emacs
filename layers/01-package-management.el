;; declare required packages
(setq package-list '())
(add-to-list 'package-list 'use-package)

;; enable package management
(require 'package)
(package-initialize)

;; declare package repositories
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

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

;; install straight.el
;; (defvar bootstrap-version)
;; (let ((bootstrap-file
;;        (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;;       (bootstrap-version 5))
;;   (unless (file-exists-p bootstrap-file)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;          "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
;;          'silent 'inhibit-cookies)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp)))
;;   (load bootstrap-file nil 'nomessage))
