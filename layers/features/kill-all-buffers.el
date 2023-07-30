(defun kill-all-buffers ()
  (interactive)
  (dolist (buf (buffer-list))
	(let ((buf-name (buffer-name buf)))
	  (progn
		(message (format "Automatically killing buffer: %s" buf-name))
		(kill-buffer buf)))))
