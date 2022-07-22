(use-package tree-sitter :ensure t)
(use-package tree-sitter-langs :ensure t)
(use-package tree-sitter-indent :ensure t)

(use-package csharp-mode
  :ensure t
  :after lsp-mode
  :config (add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-tree-sitter-mode))
  :hook (csharp-tree-sitter-mode . (lambda () (lsp))))
