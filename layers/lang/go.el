(if (not (getenv "GOPATH"))
    (let ((default-go-path (format "%s/go" (getenv "HOME"))))
      (message (format "Using default GOPATH: %s" default-go-path))
      (setenv "GOPATH" default-go-path))
  (message (format "Using user-defined GOPATH: %s" (getenv "GOPATH"))))

(if (not (file-directory-p (getenv "GOPATH")))
    (user-error (format "GOPATH directory not found: %s" (getenv "GOPATH"))))

(if (not (locate-file "gocode" exec-path))
    (user-error "gocode not found in your exec-path."))

(if (not (locate-file "bingo" exec-path))
    (user-error "bingo not found in your exec-path."))

(let ((company-go-file (substitute-env-vars "$GOPATH/src/github.com/mdempsky/gocode/emacs-company/company-go.el")))
  (if (not (file-exists-p company-go-file))
      (user-error (format "company-go not found: %s" company-go-file))))

(defun my-go-hook ()
  (set (make-local-variable 'company-backends) '(company-go company-lsp))
  (company-mode))
(add-hook 'go-mode-hook 'my-go-hook)
(add-hook 'go-mode-hook #'lsp)
