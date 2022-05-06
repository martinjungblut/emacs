(setq current-line-number (line-number-at-pos))

(defun autoscroll ()
  (let ((new-line-number (line-number-at-pos)))
	(when (not (equal new-line-number current-line-number))
	  (setq current-line-number new-line-number)
	  ;; recenter must not be called directly, else magit is broken
	  (run-at-time nil nil #'recenter))))

(add-hook 'post-command-hook #'autoscroll)
