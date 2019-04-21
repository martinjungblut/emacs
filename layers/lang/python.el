(defun elpy-hook ()
  (let ((python-interpreter (python-interpreter-locate "python3")))
    (message "Python Elpy - using the following interpreter: %s" python-interpreter)
    (setq elpy-rpc-python-command python-interpreter)))

(use-package elpy
  :ensure t
  :bind ("s-\\ e i" . python-interpreter-run)
  :init (elpy-enable)
  :config (add-hook 'python-mode-hook 'elpy-hook))
