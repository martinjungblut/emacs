;; (setq recenter-positions '(middle))

(setq current-buffer-name (buffer-name))

(defun update-buffer-name ()
  (setq current-buffer-name (buffer-name)))

(add-hook 'post-command-hook #'update-buffer-name)

(setq current-line-number (line-number-at-pos))

(defun autoscroll ()
  (let ((new-line-number (line-number-at-pos))
		(new-buffer-name (buffer-name)))
	(when
		(and
		 (not (equal new-line-number current-line-number))
		 (equal new-buffer-name current-buffer-name))
	  (setq current-line-number new-line-number)
	  (recenter-top-bottom))))

(add-hook 'post-command-hook #'autoscroll)
