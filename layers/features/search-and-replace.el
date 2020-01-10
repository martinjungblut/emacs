(defmacro search-and-replace--with-buffer (&rest body)
  `(let ((search-and-replace--buffer-name "*hgrep*"))
     (if (get-buffer search-and-replace--buffer-name)
	 (with-current-buffer search-and-replace--buffer-name
	   (progn ,@body)))))

(add-hook 'helm-grep-mode-hook 'wgrep-change-to-wgrep-mode t)

(defun search-and-replace--start ()
  (interactive)
  (search-and-replace--with-buffer
   (kill-buffer-and-window))
  (helm-projectile-grep))

(defun search-and-replace--toggle-buffer ()
  (interactive)
  (helm-grep-run-save-buffer))

(defun search-and-replace--commit ()
  (interactive)
  (wgrep-finish-edit)
  (search-and-replace--with-buffer
   (kill-buffer-and-window)))
