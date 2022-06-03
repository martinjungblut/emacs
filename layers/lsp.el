;; support for language server protocol (lsp) and debug adapter protocol (dap)

(use-package lsp-mode
  :ensure t
  :config (setq lsp-enable-file-watchers nil))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config (dap-mode t)
  (dap-ui-mode t))
