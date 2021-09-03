(defun autokill-buffers ()
  (let ((regexes '("magit.*")))
    (dolist (regex regexes)
      (dolist (buf (buffer-list))
        (if (string-match regex (buffer-name buf))
            (progn
              (message (format "Automatically killing buffer: %s" (buffer-name buf)))
              (kill-buffer buf)))))))

(add-hook 'after-save-hook 'autokill-buffers)
