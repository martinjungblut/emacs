(use-package yaml-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(use-package ansible
  :ensure t
  :after yaml-mode
  :config (add-hook 'yaml-mode-hook '(lambda () (ansible 1))))
