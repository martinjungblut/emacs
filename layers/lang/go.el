(if (not (getenv "GOPATH"))
    (let ((default-go-path (format "%s/go" (getenv "HOME"))))
      (message (format "Using default GOPATH: %s" default-go-path))
      (setenv "GOPATH" default-go-path))
  (message (format "Using user-defined GOPATH: %s" (getenv "GOPATH"))))

(if (not (file-directory-p (getenv "GOPATH")))
    (user-error (format "GOPATH directory not found: %s" (getenv "GOPATH"))))

;; nodejs is required by dap-go
(ensure-external-binaries-are-installed '("node"))

(defun go-hook-lsp ()
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "gopls")
                    :major-modes '(go-mode)
                    :server-id 'gopls))
  (lsp))

(defun go-hook-dap ()
  (progn
    (require 'dap-dlv-go)))

(defun go-hook-before-save ()
  (call-in-all-buffers-in-major-mode "go-mode" 'gofmt))

(defun go-hook-company ()
  (set (make-local-variable 'company-backends) '(company-capf)))

(use-package go-mode
  :ensure t
  :after (lsp-mode dap-mode)
  :config
    (add-hook 'go-mode-hook 'go-hook-lsp)
    (add-hook 'go-mode-hook 'go-hook-dap)
    (add-hook 'go-mode-hook 'go-hook-company)
    (add-hook 'go-mode-hook 'hydra-go-mode)
    (add-hook 'go-mode-hook 'helm-gtags-mode)
    (add-hook 'window-state-change-hook 'hydra-go-mode-hook)
    (add-hook 'before-save-hook 'go-hook-before-save))

(use-package godoctor
  :ensure t
  :after go-mode)

(defun hydra-go-mode-hook ()
  (if hydra-go-mode
      (defhydra hydra-language ()
        "go"
        ("q" nil "quit" :color red)
        ("d" godoc "look up documentation" :exit t))))

(define-minor-mode hydra-go-mode
  "minor mode providing hydra bindings for the Go programming language"
  nil
  :lighter " hydra-go"
  (hydra-go-mode-hook))
