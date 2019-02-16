;;;; package management ;;;;
;; declare required packages
(setq package-list '())
(add-to-list 'package-list 'ace-jump-mode)
(add-to-list 'package-list 'company)
(add-to-list 'package-list 'company-quickhelp)
(add-to-list 'package-list 'discover)
(add-to-list 'package-list 'elpy)
(add-to-list 'package-list 'evil)
(add-to-list 'package-list 'evil-surround)
(add-to-list 'package-list 'f)
(add-to-list 'package-list 'go-mode)
(add-to-list 'package-list 'helm)
(add-to-list 'package-list 'js2-mode)
(add-to-list 'package-list 'js2-refactor)
(add-to-list 'package-list 'magit)
(add-to-list 'package-list 'markdown-mode)
(add-to-list 'package-list 'nlinum)
(add-to-list 'package-list 'smartparens)
(add-to-list 'package-list 'ujelly-theme)
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
	     '("melpa" . "http://stable.melpa.org/packages/") t)

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
;;;; package management ;;;;


;;;; user interface and generic settings ;;;;
;; disable all menu bars
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; start emacs on a new buffer
(setq inhibit-splash-screen t)
(switch-to-buffer "**")

;; load a nice colour theme
(require 'ujelly-theme)
(load-theme 'ujelly t)

;; load a nice font
(when (member "Inconsolata" (font-family-list))
  (set-face-attribute 'default nil :font "Inconsolata"))

;; stop creating backup~ files
(setq make-backup-files nil)

;; stop creating #autosave# files
(setq auto-save-default nil)
;;;; user interface ;;;;


;;;; general extensions ;;;;
;; evil - vim emulation
(require 'evil)
(require 'evil-surround)
(evil-mode 1)
(global-evil-surround-mode 1)

;; company - modern auto-completion framework
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(company-quickhelp-mode)

;; ace-jump - easily jump anywhere across multiple windows and buffers
(autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick minor move mode" t)

;; discover.el
(require 'discover)
(global-discover-mode 1)

;; smartparens - smart parenthesis matching
(require 'smartparens-config)
(smartparens-global-mode t)

;; display line numbers
(global-display-line-numbers-mode)

;; which-key - interactively describe key bindings 
(require 'which-key)
(which-key-mode)

;; helm - incremental completion and selection narrowing framework
(require 'helm)

;; f.el - modern API for working with files and directories
;; https://github.com/rejeep/f.el
(require 'f)
;;;; general extensions ;;;;


;;;; my own functions ;;;;
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
  (message "Killed all other buffers!"))

(defun go-to-buffer-running-subprocess (new-buffer-name command)
  "Create a function that toggle switches to a buffer running a specified subprocess, powered by ansi-term."
  `(lambda ()
     (interactive)
     (let ((unassociated-new-buffer-name (format "*%s*" ,new-buffer-name)))
       (if (string-equal (buffer-name) unassociated-new-buffer-name)
	   (previous-buffer)
	 (if (get-buffer unassociated-new-buffer-name)
	     (switch-to-buffer unassociated-new-buffer-name)
	   (ansi-term ,command ,new-buffer-name))))))

(defun python-interpreter-locate (interpreter)
  (let ((located-interpreter (car (f-glob (format "*/bin/%s" interpreter)))))
    (if located-interpreter located-interpreter (format "/usr/bin/%s" interpreter))))

(defun python-interpreter-run ()
  (interactive)
  (let ((interpreter (python-interpreter-locate "python3")))
    (funcall (go-to-buffer-running-subprocess interpreter interpreter))))
;;;; my own functions ;;;;


;;;; language specific ;;;;
;; Go
(setenv "GOPATH" (format "%s/go" (getenv "HOME")))
(load "$GOPATH/src/github.com/mdempsky/gocode/emacs-company/company-go.el")
(add-hook 'go-mode-hook (lambda ()
			  (set (make-local-variable 'company-backends) '(company-go))
			  (company-mode)))

;; Python
(elpy-enable)
(setq elpy-rpc-python-command "python3")
(add-hook 'python-mode-hook
	  (lambda ()
	    (global-set-key (kbd "s-\\ e i") 'python-interpreter-run)))

;; JavaScript
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(require 'js2-refactor)
(require 'xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "s-r")
;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
;; (define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda () (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
;;;; language specific ;;;;


;;;; key bindings ;;;;
;; general key bindings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "s-x") 'helm-M-x)
(global-set-key (kbd "s-q") (lambda () (interactive) (keyboard-quit) (evil-normal-state)))
(global-set-key (kbd "s-'") (go-to-buffer-running-subprocess "shell" "/bin/bash"))
(global-set-key (kbd "s-.") 'narrow-to-region)
(global-set-key (kbd "s-,") 'widen)
(global-set-key (kbd "s--") 'text-scale-adjust)
(global-set-key (kbd "s-=") 'text-scale-adjust)
(global-set-key (kbd "s-/") 'comment-dwim)
(global-set-key (kbd "s-;") 'comment-dwim)
(global-set-key (kbd "s-<return>") 'indent-region)
(global-set-key (kbd "s-SPC") 'ace-jump-mode)
(global-set-key (kbd "s-<") 'switch-to-prev-buffer)
(global-set-key (kbd "s->") 'switch-to-next-buffer)
(global-set-key (kbd "s-S-<up>") 'split-window-vertically)
(global-set-key (kbd "s-S-<down>") 'split-window-vertically)
(global-set-key (kbd "s-S-<left>") 'split-window-horizontally)
(global-set-key (kbd "s-S-<right>") 'split-window-horizontally)
(global-set-key (kbd "s-<up>") 'windmove-up)
(global-set-key (kbd "s-<down>") 'windmove-down)
(global-set-key (kbd "s-<left>") 'windmove-left)
(global-set-key (kbd "s-<right>") 'windmove-right)

;; help key bindings
(global-set-key (kbd "s-h a") 'apropos)
(global-set-key (kbd "s-h b") 'describe-bindings)
(global-set-key (kbd "s-h k") 'describe-key)
(global-set-key (kbd "s-h f") 'describe-function)
(global-set-key (kbd "s-h e") 'eval-expression)
(global-set-key (kbd "s-h r") 'eval-region)

;; buffer key bindings
(global-set-key (kbd "s-b l") 'helm-buffers-list)
(global-set-key (kbd "s-b k") 'kill-buffer)
(global-set-key (kbd "s-b o") 'kill-other-buffers)

;; window key bindings
(global-set-key (kbd "s-w k") 'delete-window)
(global-set-key (kbd "s-w o") 'delete-other-windows)

;; navigation/search/jump key bindings
(global-set-key (kbd "s-f f") 'helm-find-files)

;; feature toggle key bindings
(global-set-key (kbd "s-t s") 'global-whitespace-mode)
;;;; key bindings ;;;;


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode which-key ujelly-theme smartparens nlinum magit js2-mode helm go-mode evil-surround evil elpy discover company-quickhelp company ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
