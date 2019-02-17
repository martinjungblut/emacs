(elpy-enable)
(setq elpy-rpc-python-command "python3")

(defun my-python-hook ()
  (global-set-key (kbd "s-\\ e i") 'python-interpreter-run))
(add-hook 'python-mode-hook 'my-python-hook)
