;; disable all menu bars
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; stop creating backup~ and #autosave# files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; start emacs on a new buffer
(setq inhibit-splash-screen t)
(switch-to-buffer "*scratch*")

;; display line numbers
(global-display-line-numbers-mode)

(setq-default tab-width 4)

;; hideshow - code folding
(add-hook 'prog-mode-hook #'hs-minor-mode)

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

;; smart-mode-line
(use-package smart-mode-line
  :ensure t
  :init (setq sml/no-confirm-load-theme t)
  :config (sml/setup))

;; which-key - interactively describe key bindings
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; helm - incremental completion and selection narrowing framework
(use-package helm
  :ensure t)

;; helm-swoop
(use-package helm-swoop
  :ensure t
  :after helm)

;; wgrep - powerful searching and replacing
(use-package wgrep
  :ensure t)

;; wgrep-helm - integrate wgrep and helm
(use-package wgrep-helm
  :ensure t
  :after (helm wgrep))

;; projectile - project integration library
(use-package projectile
  :ensure t
  :config (projectile-mode +1))

;; helm-projectile - seamless intergration between helm and projectile
(use-package helm-projectile
  :ensure t
  :after (helm projectile))

;; f.el - modern API for working with files and directories
;; https://github.com/rejeep/f.el
(use-package f
  :ensure t)

;; powerline
(use-package powerline
  :ensure t
  :config (powerline-default-theme))

;; magit - git porcelain inside emacs
(use-package magit
  :ensure t)

(use-package flymd
  :ensure t)

(use-package markdown-mode
  :ensure t)

;; drag-stuff - move text around easily
(use-package drag-stuff
  :ensure t
  :config (drag-stuff-global-mode 1))

;; hightlight symbol at point
(use-package highlight-symbol
  :ensure t
  :config
  (progn (setq highlight-symbol-idle-delay 0.2)
         (add-hook 'prog-mode-hook #'highlight-symbol-mode)))

(use-package protobuf-mode
  :ensure t)

(use-package flycheck
  :ensure t)

;; rainbow-delimiters - colour matching parentheses
(use-package rainbow-delimiters
  :ensure t
  :config
  (progn (add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)
         (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)))
