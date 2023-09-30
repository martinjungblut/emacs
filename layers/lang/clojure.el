(use-package clojure-mode
  :ensure t
  :config
    (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
	;; hydra hooks
    (add-hook 'clojure-mode-hook 'hydra-clojure-mode)
    (add-hook 'window-state-change-hook 'hydra-clojure-mode-hook))

(use-package cider
  :ensure t)

(defun cider-eval-buffer-and-repl-set-ns ()
  (interactive)
  (cider-eval-buffer)
  (command-execute 'cider-repl-set-ns))

(defun hydra-clojure-mode-hook ()
  (if hydra-clojure-mode
      (defhydra hydra-language ()
        "clojure"
        ("q" nil "quit" :color red)
        ("?" cider-debug-defun-at-point "debug defun at point" :exit t)
        ("." cider-eval-defun-at-point "eval defun at point" :exit t)
        ("r" cider-eval-region "eval region" :exit t)
        ("b" cider-eval-buffer-and-repl-set-ns "eval buffer" :exit t)
        ("d" cider-doc "look up documentation" :exit t)
		("t" cider-test-run-ns-tests "run namespace tests" :exit t)
		("SPC" cider-jack-in-universal "jack-in (universal)" :exit t)
		("<return>" cider-format-buffer "format buffer" :exit t))))

(define-minor-mode hydra-clojure-mode
  "minor mode providing hydra bindings for the Clojure programming language"
  nil
  :lighter " hydra-clojure"
  (hydra-clojure-mode-hook))

(defun my-cider-debug-toggle-insert-state ()
  (if cider--debug-mode    ;; Checks if you're entering the debugger
      (evil-insert-state)  ;; If so, turn on evil-insert-state
    (evil-normal-state)))  ;; Otherwise, turn on normal-state

(add-hook 'cider--debug-mode-hook 'my-cider-debug-toggle-insert-state)
