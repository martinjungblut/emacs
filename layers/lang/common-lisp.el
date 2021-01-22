(use-package slime
  :ensure t)

(defun lisp-hook-indentation ()
  (progn
	(setq-local indent-tabs-mode nil)
	(setq-local lisp-indent-offset 2)))

(add-hook 'lisp-mode-hook 'lisp-hook-indentation)

(setq inferior-lisp-program (executable-find "sbcl"))
