(defun c++-hook-set-indentation ()
  (progn
    (setq-default indent-tabs-mode nil)
    (setq-default tab-width 2)))

;; C++
(add-hook 'c++-mode-hook 'c++-hook-set-indentation)
(add-hook 'c++-mode-hook 'helm-gtags-mode)

;; C
(add-hook 'c-mode-hook 'helm-gtags-mode)
