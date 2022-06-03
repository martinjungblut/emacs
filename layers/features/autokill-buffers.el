(defun autokill-buffers ()
  (interactive)
  (let ((regexes '("magit.*" "\*Help\*" "\*Apropos\*" "\*WoMan-Log\*")))
    (dolist (regex regexes)
      (dolist (buf (buffer-list))
        (let ((buf-name (buffer-name buf)))
        (if (and
             (string-match regex buf-name)
             (not (get-buffer-process buf-name)))
            (progn
              (message (format "Automatically killing buffer: %s" buf-name))
              (kill-buffer buf))))))))
