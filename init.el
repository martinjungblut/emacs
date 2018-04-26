;; declare required packages
(setq package-list '(evil evil-surround ace-jump-mode js2-mode discover ujelly-theme smartparens nlinum))

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

;; enable vim emulation
(require 'evil)
(require 'evil-surround)
(evil-mode 1)
(global-evil-surround-mode 1)

;; ace-jump
(autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick minor move mode" t)

;; start emacs on a new buffer
(setq inhibit-splash-screen t)
(switch-to-buffer "**")

;; load a nice colour theme
(require 'ujelly-theme)
(load-theme 'ujelly t)

;; discover.el
(require 'discover)
(global-discover-mode 1)

;; smart parenthesis matching
(require 'smartparens-config)
(smartparens-global-mode t)

;; define useful functions
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
  (message "Killed all other buffers!"))

;; define useful keymaps
(global-set-key (kbd "s-!") 'kill-other-buffers)
(global-set-key (kbd "s-'") 'shell)
(global-set-key (kbd "s-`") 'shell)
(global-set-key (kbd "s-,") 'widen)
(global-set-key (kbd "s-.") 'narrow-to-region)
(global-set-key (kbd "s-/") 'comment-dwim)
(global-set-key (kbd "s-;") 'comment-dwim)
(global-set-key (kbd "s-SPC") 'ace-jump-mode)
(global-set-key (kbd "s-a") 'find-file)
(global-set-key (kbd "s-=") 'text-scale-adjust)
(global-set-key (kbd "s--") 'text-scale-adjust)
(global-set-key (kbd "s-e") 'eval-expression)
(global-set-key (kbd "s-r") 'eval-buffer)
(global-set-key (kbd "s-x") 'execute-extended-command)
(global-set-key (kbd "s-q") 'keyboard-quit)
(global-set-key (kbd "s-h k") 'describe-key)
(global-set-key (kbd "s-h b") 'describe-bindings)

;; enable line numbers
(global-nlinum-mode t)

;; custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4a888176c950a6716b10312cf5878dfb01a57e1b8c0e902590fe9c00b4ab8955" default)))
 '(package-selected-packages
   (quote
    (nlinum smartparens discover ujelly-theme js2-mode ace-jump-mode evil-surround evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
