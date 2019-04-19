(defun elpy-hook ()
  (elpy-enable)
  (setq elpy-rpc-python-command "python3"))

(use-package elpy
  :ensure t
  :bind ("s-\\ e i" . python-interpreter-run)
  :config (add-hook 'python-mode-hook 'elpy-hook))
