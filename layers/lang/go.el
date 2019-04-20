(if (not (getenv "GOPATH"))
    (let ((default-go-path (format "%s/go" (getenv "HOME"))))
      (message (format "Using default GOPATH: %s" default-go-path))
      (setenv "GOPATH" default-go-path))
  (message (format "Using user-defined GOPATH: %s" (getenv "GOPATH"))))

(if (not (file-directory-p (getenv "GOPATH")))
    (user-error (format "GOPATH directory not found: %s" (getenv "GOPATH"))))

(ensure-external-binaries-are-installed '("gocode" "gopls"))

(defun go-lsp-hook ()
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "gopls")
                    :major-modes '(go-mode)
                    :server-id 'gopls))
  (lsp))

(use-package go-mode
  :ensure t
  :after lsp-mode
  :config (add-hook 'go-mode-hook 'go-lsp-hook))
