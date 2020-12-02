(defun c++-hook-set-indentation ()
  (progn
    (setq-default indent-tabs-mode nil)
    (setq-default tab-width 2)))

(add-hook 'c++-mode-hook 'c++-hook-set-indentation)
