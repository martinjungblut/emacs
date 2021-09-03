(defun autokill-buffers ()
  (let ((regexes '("magit.*")))
    (dolist (regex regexes)
      (dolist (buf (buffer-list))
        (let ((buf-name (buffer-name buf)))
        (if (and
             (string-match regex buf-name)
             (not (get-buffer-process buf-name)))
            (progn
              (message (format "Automatically killing buffer: %s" buf-name))
              (kill-buffer buf))))))))

(add-hook 'after-save-hook 'autokill-buffers)
