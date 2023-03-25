(use-package typescript-mode
  :ensure t)

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (typescript-mode . flycheck-mode)
         (before-save . tide-format-before-save)))

(defun web-mode-hook()
  (when (string-equal "jsx" (file-name-extension buffer-file-name))
    (setup-tide-mode)))

(use-package web-mode
  :ensure t
  :config
  (progn
	(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
	(flycheck-add-mode 'javascript-eslint 'web-mode)
	(flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append))
  :hook ((web-mode . web-mode-hook)))
