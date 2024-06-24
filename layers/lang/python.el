(defun python-locate-interpreter ()
  (let ((located-interpreter (car (f-glob (format "%s*/bin/%s" (fs-get-project-directory) "python")))))
    (if located-interpreter located-interpreter "/usr/bin/python3")))

(use-package lsp-pyright
  :ensure t
  :after lsp-mode
  :init (when (executable-find "python3")
          (setq lsp-pyright-python-executable-cmd "python3"))
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))

(use-package python-black
  :ensure t)

(use-package pyimport
  :ensure t)

(defun dap-mode-python ()
  (require 'dap-python)
  ;; if you installed debugpy, you need to set this
  ;; https://github.com/emacs-lsp/dap-mode/issues/306
  (setq dap-python-debugger 'debugpy)
  (setq dap-python-executable (python-locate-interpreter)))

(add-hook 'python-mode-hook 'helm-gtags-mode)
(add-hook 'python-mode-hook 'dap-mode-python)
