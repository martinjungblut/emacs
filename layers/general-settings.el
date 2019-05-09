;; disable all menu bars
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; stop creating backup~ files
(setq make-backup-files nil)

;; stop creating #autosave# files
(setq auto-save-default nil)

;; start emacs on a new buffer
(setq inhibit-splash-screen t)
(switch-to-buffer "*scratch*")

;; display line numbers
(global-display-line-numbers-mode)

;; load a nice font
(when (member "Inconsolata" (font-family-list))
  (set-face-attribute 'default nil :font "Inconsolata" :height 105))

;; load a nice colour theme
(use-package kaolin-themes
  :ensure t
  :config (load-theme 'kaolin-eclipse t))

;; evil - vim emulation
(use-package evil
  :ensure t
  :config (evil-mode t))
(use-package evil-surround
  :ensure t
  :after evil
  :config (global-evil-surround-mode t))
(use-package evil-escape
  :ensure t
  :after evil
  :config (evil-escape-mode))

;; company - modern auto-completion framework
(use-package company
  :ensure t
  :config (add-hook 'after-init-hook 'global-company-mode))
(use-package company-quickhelp
  :ensure t
  :after company
  :config (company-quickhelp-mode))

;; support for language server protocol (lsp) and debug adapter protocol (dap)
(use-package lsp-mode
  :ensure t)
(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config (add-hook 'lsp-mode-hook 'lsp-ui-mode))
(use-package company-lsp
  :ensure t
  :after (:all lsp-mode company)
  :config (push 'company-lsp company-backends))
(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config (dap-mode t)
          (dap-ui-mode t))

;; ace-jump - easily jump anywhere across multiple windows and buffers
(use-package ace-jump-mode
  :ensure t
  :config (autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick minor move mode" t))

;; discover.el
(use-package discover
  :ensure t
  :config (global-discover-mode t))

;; smartparens - smart parenthesis matching
(use-package smartparens
  :ensure t
  :config (smartparens-global-mode t))

;; which-key - interactively describe key bindings
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; helm - incremental completion and selection narrowing framework
(use-package helm
  :ensure t)

(use-package helm-swoop
  :ensure t
  :after helm)

;; f.el - modern API for working with files and directories
;; https://github.com/rejeep/f.el
(use-package f
  :ensure t)

;; powerline
(use-package powerline
  :ensure t
  :config (powerline-default-theme))

;; enable magit globally
(use-package magit
  :ensure t
  :config (global-magit-file-mode t))

(use-package flymd
  :ensure t)

(use-package markdown-mode
  :ensure t)
