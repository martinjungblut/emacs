(use-package rpm-spec-mode
  :ensure t
  :config (setq auto-mode-alist (append '(("\\.spec" . rpm-spec-mode)) auto-mode-alist)))
