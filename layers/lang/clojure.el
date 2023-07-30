(use-package clojure-mode
  :ensure t
  :config
    (add-hook 'clojure-mode-hook 'clojure-hook)
    (add-hook 'clojure-mode-hook 'hydra-clojure-mode)
    (add-hook 'window-state-change-hook 'hydra-clojure-mode-hook))

(use-package cider
  :ensure t)

(defun hydra-clojure-mode-hook ()
  (if hydra-clojure-mode
      (defhydra hydra-language ()
        "clojure"
        ("q" nil "quit" :color red)
        ("r" cider-eval-region "eval region" :exit t)
        ("b" cider-eval-buffer "eval buffer" :exit t)
        ("d" cider-doc "look up documentation" :exit t))))

(define-minor-mode hydra-clojure-mode
  "minor mode providing hydra bindings for the Clojure programming language"
  nil
  :lighter " hydra-clojure"
  (hydra-clojure-mode-hook))

(defun clojure-hook ()
  (progn
    (cider-jack-in nil)))
