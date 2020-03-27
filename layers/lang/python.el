(defun python-locate-interpreter (interpreter)
  (let ((located-interpreter (car (f-glob (format "*/bin/%s" interpreter)))))
    (if located-interpreter located-interpreter (format "/usr/bin/%s" interpreter))))

(defun python-locate-virtualenv-directory (interpreter)
  (let ((found (python-locate-interpreter interpreter)))
    (if (and found (not (cl-search "/usr/bin" found)))
	(f-dirname (f-dirname found)))))

(defun python-interpreter-run ()
  (interactive)
  (let ((interpreter (python-locate-interpreter "python3")))
    (funcall (go-to-buffer-running-subprocess interpreter interpreter))))

(defun python-get-pwd-pythonpath ()
  (format "%s:%s"
	  default-directory
	  (shell-command-to-string "$SHELL --login -c 'echo -n $PYTHONPATH'")))

(defun python-elpy-hook ()
  (let ((interpreter (python-locate-interpreter "python3"))
	(virtualenv-directory (python-locate-virtualenv-directory "python3")))
    (message "Adding $PWD to $PYTHONPATH.")
    (setenv "PYTHONPATH" (python-get-pwd-pythonpath))
    (message "New PYTHONPATH: %s" (getenv "PYTHONPATH"))

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
