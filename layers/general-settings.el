;; disable all menu bars
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; start emacs on a new buffer
(setq inhibit-splash-screen t)
(switch-to-buffer "*scratch*")

;; load a nice colour theme
(require 'kaolin-themes)
(load-theme 'kaolin-eclipse t)

;; load a nice font
(when (member "Inconsolata" (font-family-list))
  (set-face-attribute 'default nil :font "Inconsolata" :height 105))

;; stop creating backup~ files
(setq make-backup-files nil)

;; stop creating #autosave# files
(setq auto-save-default nil)

;; evil - vim emulation
(require 'evil)
(evil-mode 1)
(require 'evil-surround)
(global-evil-surround-mode 1)
(require 'evil-escape)
(evil-escape-mode)

;; company - modern auto-completion framework
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(company-quickhelp-mode)

;; language server protocol (lsp) support
(require 'lsp-mode)
(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(require 'company-lsp)
(push 'company-lsp company-backends)

;; debug adapter protocol (dap) support
(dap-mode 1)
(dap-ui-mode 1)

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

;; powerline
(require 'powerline)
(powerline-default-theme)

;; enable magit globally
(global-magit-file-mode t)
