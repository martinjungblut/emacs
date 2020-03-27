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

(defun font-size-increase ()
  "Increase font size."
  (interactive)
  (let ((new-font-size (+ (face-attribute 'default :height) 5)))
    (set-face-attribute 'default nil :height new-font-size)
    (message (format "+ New font size: %d" new-font-size))))

(defun font-size-decrease ()
  "Decrease font size."
  (interactive)
  (let ((new-font-size (- (face-attribute 'default :height) 5)))
    (set-face-attribute 'default nil :height new-font-size)
    (message (format "- New font size: %d" new-font-size))))

(defun font-size-default ()
  "Set font size to its default value: 100."
  (interactive)
  (set-face-attribute 'default nil :height 100)
  (message (format "- New font size: %d" 100)))

(defun evaluate-region ()
  (interactive)
  (when (region-active-p)
    (eval-region (region-beginning) (region-end))
    (message "Region evaluated.")))

(defun evaluate-buffer ()
  (interactive)
  (eval-buffer)
  (message "Buffer evaluated."))

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
