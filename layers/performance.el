(use-package gcmh
  :ensure t
  :config (gcmh-mode +1)
  :init
  (add-hook 'minibuffer-setup-hook #'gcmh-set-high-threshold)
  (add-hook 'minibuffer-setup-hook #'gcmh-register-idle-gc)
  (add-hook 'focus-out-hook #'garbage-collect))
