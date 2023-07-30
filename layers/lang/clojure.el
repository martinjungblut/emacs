(use-package clojure-mode
  :ensure t
  :config (add-hook 'clojure-mode-hook 'clojure-hook))

(use-package cider
  :ensure t)

(defun clojure-hook ()
  (progn
	(cider-jack-in '())))
