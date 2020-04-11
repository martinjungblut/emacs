(defun python-locate-interpreter ()
  (let ((located-interpreter (car (f-glob (format "%s/*/bin/%s" (projectile-project-root) "python")))))
    (if located-interpreter located-interpreter "/usr/bin/python3")))

(defun python-locate-virtualenv-directory ()
  (let ((found (python-locate-interpreter)))
    (if (and found (not (cl-search "/usr/bin" found)))
	(f-dirname (f-dirname found)))))

(defun python-interpreter-run ()
  (interactive)
  (let ((interpreter (python-locate-interpreter)))
    (funcall (go-to-buffer-running-subprocess interpreter interpreter))))

(defun python-get-pwd-pythonpath ()
  (let ((current-pythonpath (shell-command-to-string "$SHELL --login -c 'echo -n $PYTHONPATH'")))
    (if (not (cl-search (projectile-project-root) current-pythonpath))
	(format "%s:%s" (projectile-project-root) current-pythonpath))))

(defun python-elpy-hook ()
  (let ((interpreter (python-locate-interpreter))
	(virtualenv-directory (python-locate-virtualenv-directory))
	(new-pythonpath (python-get-pwd-pythonpath)))
    (if new-pythonpath
	(progn
	  (message "Adding project root to PYTHONPATH.")
	  (setenv "PYTHONPATH" new-pythonpath)
	  (message "New PYTHONPATH: %s" (getenv "PYTHONPATH"))))

    (message "Python Elpy: Using the following interpreter: %s" interpreter)
    (setq elpy-rpc-python-command interpreter)

    (if virtualenv-directory
	(progn
	  (message "Python Elpy: Activating the following virtualenv: %s" virtualenv-directory)
	  (pyvenv-activate virtualenv-directory)))))

(use-package elpy
  :ensure t
  :bind ("s-\\ e i" . python-interpreter-run)
  :init (elpy-enable)
  :config (add-hook 'python-mode-hook 'python-elpy-hook))
