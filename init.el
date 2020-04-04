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
 '(custom-safe-themes
   '("730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "3577ee091e1d318c49889574a31175970472f6f182a9789f1a3e9e4513641d86" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "2f945b8cbfdd750aeb82c8afb3753ebf76a1c30c2b368d9d1f13ca3cc674c7bc" "58c2c8cc4473c5973e77f4b78a68c0978e68f1ddeb7a1eb34456fce8450be497" "054e929c1df4293dd68f99effc595f5f7eb64ff3c064c4cfaad186cd450796db" "0eb3c0868ff890b0c4ee138069ce2a8936a8a69ba150efa6bfb9fb7c05af5ec3" "3788e589eb432e6a515d557cbeb8dc4eaca9e00ae54f932b4bd43ed78605532e" "f7b0f2d0f37846ef75157f5c8c159e6d610c3efcc507cbddec789c02e165c121" default))
 '(delete-selection-mode nil)
 '(package-selected-packages
   '(doom-themes highlight-symbol drag-stuff smart-mode-line ansible yaml-mode helm-projectile projectile helm-swoop plantuml-mode evil-magit dap-mode lsp-java powerline flymd company-lsp lsp-ui kaolin-themes markdown-mode which-key smartparens magit js2-mode helm go-mode evil-surround evil elpy discover company-quickhelp company ace-jump-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
