(setq custom-file "~/.emacs.d/custom.el")

(defun load-from-directory (directory file)
  (load (format "%s/%s" directory file)))

(defun load-directory (directory)
  (mapc (lambda (file) (load-from-directory directory file))
		(directory-files directory nil "\\.el$")))

(load-directory "~/.emacs.d/layers")
(load-directory "~/.emacs.d/layers/features")
(load-directory "~/.emacs.d/layers/lang")

(load custom-file t)

;; automatically start server
;; connect with "emacsclient"
(server-start)
