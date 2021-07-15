(defun asm-hook-indentation ()
    (setq-local indent-tabs-mode nil))

(use-package nasm-mode
  :ensure t
  :config (add-hook 'asm-mode-hook 'nasm-mode)
          (add-hook 'asm-mode-hook 'asm-hook-indentation))
