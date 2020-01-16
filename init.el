(add-to-list 'load-path "~/.emacs.d/layers")

(load "package-management.el")
(load "library.el")
(load "general-settings.el")
(load "key-bindings.el")

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
 '(delete-selection-mode nil)
 '(package-selected-packages
   (quote
    (drag-stuff smart-mode-line ansible yaml-mode helm-projectile projectile helm-swoop plantuml-mode evil-magit dap-mode lsp-java powerline flymd company-lsp lsp-ui kaolin-themes markdown-mode which-key smartparens magit js2-mode helm go-mode evil-surround evil elpy discover company-quickhelp company ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
