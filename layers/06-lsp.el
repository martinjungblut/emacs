;; support for language server protocol (lsp) and debug adapter protocol (dap)
(use-package lsp-mode
  :ensure t
  :config (progn
			(setq lsp-enable-file-watchers nil)
			(add-hook 'lsp-mode-hook 'hook-lsp-mode)))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config (dap-mode t)
  (dap-ui-mode t))

(defun lsp-mode-go ()
  (lsp-workspace-folders-add
   (find-go-project-directory default-directory)))

(defun hook-lsp-mode ()
  (cond ((string-equal major-mode "go-mode") (lsp-mode-go))
		(t nil)))

(defun find-go-project-directory (dir)
  (message "Trying to find Go directory in: %s" dir)
  (if (equal dir "/") nil
    (if (member "go.mod" (directory-files dir)) dir
      (find-go-project-directory (file-name-directory (string-trim-right dir "/"))))))
