;; declare required packages
(setq package-list '(ace-jump-mode company company-quickhelp discover elpy evil evil-surround exec-path-from-shell go-mode helm js2-mode magit nlinum smartparens ujelly-theme which-key))

;; disable all menu bars
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; enable package management
(require 'package)
(package-initialize)

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

;; start emacs on a new buffer
(setq inhibit-splash-screen t)
(switch-to-buffer "**")

;; load a nice colour theme
(require 'ujelly-theme)
(load-theme 'ujelly t)

;; enable vim emulation
(require 'evil)
(require 'evil-surround)
(evil-mode 1)
(global-evil-surround-mode 1)

;; auto-completion framework
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(company-quickhelp-mode)

;; ace-jump
(autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick minor move mode" t)

;; discover.el
(require 'discover)
(global-discover-mode 1)

;; smart parenthesis matching
(require 'smartparens-config)
(smartparens-global-mode t)

;; enable line numbers
(global-nlinum-mode t)

;; elpy
(elpy-enable)
(setq elpy-rpc-python-command "python3")

;; which-key
(require 'which-key)
(which-key-mode)

;; helm
(require 'helm)

;; golang
(setenv "GOPATH" (format "%s/go" (getenv "HOME")))
(load "$GOPATH/src/github.com/stamblerre/gocode/emacs-company/company-go.el")
(add-hook 'go-mode-hook (lambda ()
			  (set (make-local-variable 'company-backends) '(company-go))
			  (company-mode)))

;; personalised goodies
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
  (message "Killed all other buffers!"))

(defun go-to-buffer-or-exec-subprocess (new-buffer-name command)
  "Create a function that switches to a buffer running the specified subprocess, powered by ansi-term. If the current buffer is the subprocess's, switch to the previous buffer."
  `(lambda ()
     (interactive)
     (let ((unassociated-new-buffer-name (format "*%s*" ,new-buffer-name)))
       (if (string-equal (buffer-name) unassociated-new-buffer-name)
	   (previous-buffer)
	 (if (get-buffer unassociated-new-buffer-name)
	     (switch-to-buffer unassociated-new-buffer-name)
	   (ansi-term ,command ,new-buffer-name))))))

;; define useful keymaps
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "s-x") 'helm-M-x)
(global-set-key (kbd "s-q") 'keyboard-quit)
(global-set-key (kbd "s-'") (go-to-buffer-or-exec-subprocess "shell" "/bin/bash"))
(global-set-key (kbd "s-.") 'narrow-to-region)
(global-set-key (kbd "s-,") 'widen)
(global-set-key (kbd "s--") 'text-scale-adjust)
(global-set-key (kbd "s-=") 'text-scale-adjust)
(global-set-key (kbd "s-/") 'comment-dwim)
(global-set-key (kbd "s-;") 'comment-dwim)
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

(global-set-key (kbd "s-h a") 'apropos)
(global-set-key (kbd "s-h b") 'describe-bindings)
(global-set-key (kbd "s-h k") 'describe-key)

(global-set-key (kbd "s-b l") 'helm-buffers-list)
(global-set-key (kbd "s-b k") 'kill-buffer)
(global-set-key (kbd "s-b o") 'kill-other-buffers)
(global-set-key (kbd "s-w k") 'delete-window)
(global-set-key (kbd "s-w o") 'delete-other-windows)
(global-set-key (kbd "s-f f") 'helm-find-files)
