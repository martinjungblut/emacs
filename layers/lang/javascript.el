(use-package js2-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
          (add-hook 'js2-mode-hook #'js2-imenu-extras-mode))

(use-package js2-refactor
  :ensure t
  :after js2-mode
  :config (add-hook 'js2-mode-hook #'js2-refactor-mode)
          (js2r-add-keybindings-with-prefix "s-\\ r"))

(use-package xref-js2
  :ensure t
  :after js2-mode
  :config (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))

;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
;; (define-key js-mode-map (kbd "M-.") nil)
