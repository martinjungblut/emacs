(add-to-list 'load-path "~/.emacs.d/layers")

(load "package-management.el")

(load "library.el")
(load "general-settings.el")
(load "key-bindings.el")

(load "features/vterm.el")
(load "features/search-and-replace.el")

(load "lang/javascript.el")
(load "lang/python.el")
(load "lang/go.el")
(load "lang/java.el")
(load "lang/plantuml.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" default))
 '(delete-selection-mode nil)
 '(package-selected-packages
   '(vterm plantuml-mode lsp-java godoctor go-mode elpy xref-js2 js2-refactor js2-mode protobuf-mode highlight-symbol tide drag-stuff ansible yaml-mode flymd magit powerline helm-projectile projectile wgrep-helm wgrep helm-swoop helm which-key smart-mode-line smartparens discover ace-jump-mode dap-mode lsp-ui lsp-mode company-quickhelp company evil-escape evil-surround evil doom-themes use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
