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

(defun ensure-external-binaries-are-installed (binaries)
  "Ensure a list of binaries are installed, executable and in your exec-path."
  (dolist (binary binaries)
    (let ((absolute-binary-path (locate-file binary exec-path)))
      (if (not absolute-binary-path)
	  (user-error (format "External binary '%s' is not in your exec-path. Please install it." binary))
	(if (not (file-executable-p absolute-binary-path))
	    (user-error (format "External binary '%s' was found, but is not executable. Please chmod it." binary)))))))

(defun revert-all-no-confirm ()
  "Revert all file buffers, without confirmation.
  Buffers visiting files that no longer exist are ignored.
  Files that are not readable (including do not exist) are ignored.
  Other errors while reverting a buffer are reported only as messages."
  (interactive)
  (let (file)
    (dolist (buf  (buffer-list))
      (setq file  (buffer-file-name buf))
      (when (and file  (file-readable-p file))
        (with-current-buffer buf
          (with-demoted-errors "Error: %S" (revert-buffer t t)))))))
