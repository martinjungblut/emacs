(defun hydra-language-clojure ()
  (interactive)
  (defhydra hydra-language ()
	"clojure"
	("q" nil "quit" :color red)
	("?" cider-debug-defun-at-point "debug defun at point" :exit t)
	("m" cider-debug-move-here "debug move here" :exit t)
	("a" cider-eval-all-files "eval all files" :exit t)
	("." cider-eval-defun-at-point "eval defun at point" :exit t)
	("r" cider-eval-region "eval region" :exit t)
	("b" cider-eval-buffer-and-repl-set-ns "eval buffer" :exit t)
	("d" cider-doc "look up documentation" :exit t)
	("t" cider-test-run-ns-tests "run namespace tests" :exit t)
	("i" evil-insert-resume "insert resume (evil)" :exit t)
	("SPC" cider-jack-in-universal "jack-in (universal)" :exit t)
	("<return>" cider-format-buffer "format buffer" :exit t)))

(defun hydra-language-go ()
  (interactive)
  (defhydra hydra-language ()
	"go"
	("q" nil "quit" :color red)
	("r" lsp-rename "rename variable (lsp)" :exit t)
	("l" lsp-ui-peek-find-references "find references (lsp)" :exit t)
	("R" lsp-restart-workspace "restart workspace (lsp)" :exit t)
	("." evil-jump-to-tag "go to definition" :exit t)))

(defun hydra-language-vterm ()
  (interactive)
  (defhydra hydra-language ()
	"go"
	("q" nil "quit" :color red)
	("<return>" vterm-evil-reposition "reposition cursor" :exit t)))

(defun hydra-language-default ()
  (interactive)
  (defhydra hydra-language ()
	""
	("q" nil "quit" :color red)))

(defun hook-hydra-language-window-state-change ()
  (cond
   ((string-equal major-mode "vterm-mode") (call-interactively 'hydra-language-vterm))
   ((string-equal major-mode "clojure-mode") (call-interactively 'hydra-language-clojure))
   ((string-equal major-mode "go-mode") (call-interactively 'hydra-language-go))
   (t (call-interactively 'hydra-language-default))))

(call-interactively 'hydra-language-default)

(add-hook 'window-state-change-hook 'hook-hydra-language-window-state-change)
