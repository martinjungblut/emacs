(if (not (getenv "GOPATH"))
    (let ((default-go-path (format "%s/go" (getenv "HOME"))))
      (message (format "Using default GOPATH: %s" default-go-path))
      (setenv "GOPATH" default-go-path))
  (message (format "Using user-defined GOPATH: %s" (getenv "GOPATH"))))

(if (not (file-directory-p (getenv "GOPATH")))
    (user-error (format "GOPATH directory not found: %s" (getenv "GOPATH"))))

(ensure-external-binaries-are-installed '("gocode" "bingo"))

(let ((company-go-file (substitute-env-vars "$GOPATH/src/github.com/mdempsky/gocode/emacs-company/company-go.el")))
  (if (not (file-exists-p company-go-file))
      (user-error (format "company-go not found: %s" company-go-file))
    (load company-go-file)))

(defun my-go-hook ()
  (push 'company-go company-backends)
  (company-mode))

(add-hook 'go-mode-hook #'lsp)
(add-hook 'go-mode-hook 'my-go-hook)
