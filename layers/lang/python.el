(use-package lsp-pyright
  :ensure t
  :after lsp-mode
  :init (when (executable-find "python3")
          (setq lsp-pyright-python-executable-cmd "python3"))
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))

(use-package python-black
  :ensure t)

(use-package pyimport
  :ensure t)
