;; clojure-mode
(use-package clojure-mode
  :ensure t
  :config
    (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
    (add-hook 'clojure-mode-hook 'hook-clojure-lsp))

;; lsp
(defun hook-clojure-lsp ()
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "clojure-lsp")
                    :major-modes '(clojure-mode)
                    :server-id 'clojure-lsp))
  (lsp))

;; cider
(use-package cider
  :ensure t)

(defun hook-cider-debug-toggle-insert-state ()
  (if cider--debug-mode    ;; Checks if you're entering the debugger
      (evil-insert-state)  ;; If so, turn on evil-insert-state
    (evil-normal-state)))  ;; Otherwise, turn on normal-state
(add-hook 'cider--debug-mode-hook 'hook-cider-debug-toggle-insert-state)

(defun hook-cider-repl-mode ()
  (cider-switch-to-repl-buffer)
  (evil-insert-state))
(add-to-list '*frame-configuration-callbacks* (list "cider-repl-mode" 'hook-cider-repl-mode))

(defun cider-eval-buffer-and-repl-set-ns ()
  (interactive)
  (cider-eval-buffer)
  (command-execute 'cider-repl-set-ns))
