;; Go
(setenv "GOPATH" (format "%s/go" (getenv "HOME")))
(load "$GOPATH/src/github.com/mdempsky/gocode/emacs-company/company-go.el")
(add-hook 'go-mode-hook (lambda ()
			  (set (make-local-variable 'company-backends) '(company-go))
			  (company-mode)))

;; Python
(elpy-enable)
(setq elpy-rpc-python-command "python3")
(add-hook 'python-mode-hook
	  (lambda ()
	    (global-set-key (kbd "s-\\ e i") 'python-interpreter-run)))

;; JavaScript
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(require 'js2-refactor)
(require 'xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "s-r")
;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
;; (define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda () (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
