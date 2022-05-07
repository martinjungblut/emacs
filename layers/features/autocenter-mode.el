(make-variable-buffer-local
 (defvar current-line-number 0))

(defun autocenter ()
  "If autocenter-mode is enabled, recenter the cursor vertically if there was a line change."
  (if (or (bound-and-true-p autocenter-mode) (bound-and-true-p global-autocenter-mode))
	  (let ((new-line-number (line-number-at-pos)))
		(when (not (equal new-line-number current-line-number))
		  (setq current-line-number new-line-number)
		  ;; recenter must not be called directly, else magit is broken
		  (run-at-time nil nil #'recenter)))
	(remove-hook 'post-command-hook #'autocenter)))

(define-minor-mode autocenter-mode
  "autocenter-mode.
Automatically center the cursor vertically upon executing any commands."
  :lighter " autocenter"
  (add-hook 'post-command-hook #'autocenter))

(define-minor-mode global-autocenter-mode
  "global-autocenter-mode.
Automatically center the cursor vertically upon executing any commands."
  :lighter " global-autocenter"
  :global t
  (add-hook 'post-command-hook #'autocenter))

(provide 'autocenter-mode)
