(defun vterm-evil-reposition ()
  "Reposition the cursor inside vterm so it properly reads the upcoming key combinations."
  (interactive)
  (call-interactively 'evil-insert-resume)
  (vterm-reset-cursor-point))

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
  (message "Killed all other buffers!"))

(defun kill-all-buffers ()
  "Kill all other buffers."
  (interactive)
  (switch-to-buffer "*scratch*")
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
  (message "Killed all buffers!"))

(defun evaluate-region ()
  (interactive)
  (when (region-active-p)
    (eval-region (region-beginning) (region-end))
    (message "Region evaluated.")))

(defun evaluate-buffer ()
  (interactive)
  (eval-buffer)
  (message "Buffer evaluated."))

(defun go-to-buffer-running-subprocess (command buffer-number)
  "Create a function that toggle switches to a buffer running a specified subprocess, powered by vterm."
  `(lambda ()
     (interactive)
     (let ((unassociated-new-buffer-name (format "*%s*%s" ,command ,buffer-number)))
       (if (string-equal (buffer-name) unassociated-new-buffer-name)
           (previous-buffer)
         (if (get-buffer unassociated-new-buffer-name)
             (switch-to-buffer unassociated-new-buffer-name)
           (run-in-vterm ,command))))))

(defun go-to-buffer-running-bash ()
  "Go to a buffer running Bash, specially suited for vterm + evil-mode"
  (interactive)
  (funcall (go-to-buffer-running-subprocess "bash" ""))
  (vterm-evil-reposition))

(defun ensure-external-binaries-are-installed (binaries)
  "Ensure a list of binaries are installed, executable and in your exec-path."
  (dolist (binary binaries)
    (let ((absolute-binary-path (locate-file binary exec-path)))
      (if (not absolute-binary-path)
          (user-error (format "External binary '%s' is not in your exec-path. Please install it." binary))
        (if (not (file-executable-p absolute-binary-path))
            (user-error (format "External binary '%s' was found, but is not executable. Please chmod it." binary)))))))

(defun revert-buffers-no-confirm ()
  "Revert all file buffers, without confirmation.
  Buffers visiting files that no longer exist are ignored.
  Files that are not readable (including do not exist) are ignored.
  Other errors while reverting a buffer are reported only as messages."
  (interactive)
  (let (file)
    (dolist (buf (buffer-list))
      (setq file (buffer-file-name buf))
      (when (and file (file-readable-p file))
        (with-current-buffer buf
          (with-demoted-errors "Error: %S" (revert-buffer t t)))))))

(defun call-in-all-buffers-in-major-mode (target-major-mode callback)
  "Call a callback in all buffers currently in a target major mode."
  (dolist (buf (buffer-list (current-buffer)))
    (with-current-buffer buf
      (if (string-equal major-mode target-major-mode)
          (funcall callback)))))

(defun fs-get-project-directory ()
  (or (projectile-project-root) default-directory))

(defun bookmark-get-name ()
  (let* ((buffer (buffer-name (current-buffer)))
         (directory (file-name-directory buffer-file-name))
         (bookmark-name (format "%s%s:%s" directory buffer (line-number-at-pos))))
	bookmark-name))

(defun bookmark-current-line ()
  (interactive)
  (let ((bookmark-name (bookmark-get-name)))
    (progn
      (bookmark-set-internal "" bookmark-name 'overwrite)
      (bookmark-save)
      (message (format "Added new bookmark: %s" bookmark-name)))))

(defun bookmark-delete-current-line ()
  (interactive)
  (let ((bookmark-name (bookmark-get-name)))
	(progn
	  (bookmark-delete bookmark-name)
      (message (format "Removed bookmark: %s" bookmark-name)))))

(defun dired-emacs-directory ()
  (interactive)
  (dired "~/.emacs.d/layers/"))
