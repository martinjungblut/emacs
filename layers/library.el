(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
  (message "Killed all other buffers!"))

(defun go-to-buffer-running-subprocess (new-buffer-name command)
  "Create a function that toggle switches to a buffer running a specified subprocess, powered by ansi-term."
  `(lambda ()
     (interactive)
     (let ((unassociated-new-buffer-name (format "*%s*" ,new-buffer-name)))
       (if (string-equal (buffer-name) unassociated-new-buffer-name)
	   (previous-buffer)
	 (if (get-buffer unassociated-new-buffer-name)
	     (switch-to-buffer unassociated-new-buffer-name)
	   (ansi-term ,command ,new-buffer-name))))))

(defun python-interpreter-locate (interpreter)
  (let ((located-interpreter (car (f-glob (format "*/bin/%s" interpreter)))))
    (if located-interpreter located-interpreter (format "/usr/bin/%s" interpreter))))

(defun python-interpreter-run ()
  (interactive)
  (let ((interpreter (python-interpreter-locate "python3")))
    (funcall (go-to-buffer-running-subprocess interpreter interpreter))))
