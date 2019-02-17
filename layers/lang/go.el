(setenv "GOPATH" (format "%s/go" (getenv "HOME")))

(load "$GOPATH/src/github.com/mdempsky/gocode/emacs-company/company-go.el")

(defun my-go-hook ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode))
(add-hook 'go-mode-hook 'my-go-hook)
