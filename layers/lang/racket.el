(defun racket-hook-before-save ()
  (indent-region (point-min) (point-max) nil))

(use-package racket-mode
  :ensure t
  :hook (racket-mode . (lambda () (racket-xp-mode))))
