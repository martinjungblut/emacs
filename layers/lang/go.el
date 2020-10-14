(if (not (getenv "GOPATH"))
    (let ((default-go-path (format "%s/go" (getenv "HOME"))))
      (message (format "Using default GOPATH: %s" default-go-path))
      (setenv "GOPATH" default-go-path))
  (message (format "Using user-defined GOPATH: %s" (getenv "GOPATH"))))

(if (not (file-directory-p (getenv "GOPATH")))
    (user-error (format "GOPATH directory not found: %s" (getenv "GOPATH"))))

;; nodejs is required by dap-go
(ensure-external-binaries-are-installed '("node"))

(defun go-lsp-hook ()
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "gopls")
                    :major-modes '(go-mode)
                    :server-id 'gopls))
  (lsp))

(defun go-dap-hook ()
  (progn
	(require 'dap-go)
	(dap-go-setup)))

(defun go-before-save-hook ()
  (call-in-all-buffers-in-major-mode "go-mode" 'gofmt))

(defun go-company-hook ()
  (set (make-local-variable 'company-backends) '(company-capf)))

(use-package go-mode
  :ensure t
  :after (lsp-mode dap-mode)
  :config (add-hook 'go-mode-hook 'go-lsp-hook)
          (add-hook 'go-mode-hook 'go-dap-hook)
          (add-hook 'go-mode-hook 'go-company-hook)
          (add-hook 'before-save-hook 'go-before-save-hook))

(use-package godoctor
  :ensure t
  :after go-mode)
