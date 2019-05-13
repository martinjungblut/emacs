(defmacro search-and-replace--with-buffer (&rest body)
  `(let ((search-and-replace--buffer-name "*hgrep*"))
    (if (get-buffer search-and-replace--buffer-name)
	(with-current-buffer search-and-replace--buffer-name
	  (progn ,@body)))))

(defun search-and-replace--start (arg)
  (interactive "P")
  (search-and-replace--with-buffer
   (kill-buffer-and-window))
  (helm-do-grep-ag arg)
  (search-and-replace--with-buffer
   (wgrep-change-to-wgrep-mode)))

(defun search-and-replace--commit ()
  (interactive)
  (wgrep-finish-edit)
  (search-and-replace--with-buffer
   (kill-buffer-and-window)))
