(setq custom-file "~/.emacs.d/custom.el")

(add-to-list 'load-path "~/.emacs.d/layers")

(load "package-management.el")

(load "theme.el")
(load "font.el")
(load "library.el")
(load "general-settings.el")
(load "key-bindings.el")

(load "features/vterm.el")
(load "features/search-and-replace.el")

(load "lang/ansible.el")
(load "lang/c++.el")
(load "lang/common-lisp.el")
(load "lang/go.el")
(load "lang/java.el")
(load "lang/javascript.el")
(load "lang/nasm.el")
(load "lang/plantuml.el")
(load "lang/python.el")
(load "lang/racket.el")
(load "lang/rpmspec.el")
(load "lang/typescript.el")
