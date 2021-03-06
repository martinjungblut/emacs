(use-package hydra
  :ensure t)

;; general key bindings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "s-x") 'helm-M-x)
(global-set-key (kbd "s-q") 'evil-escape)
(global-set-key (kbd "<escape>") 'evil-escape)
(global-set-key (kbd "s--") 'font-height-decrease)
(global-set-key (kbd "s-=") 'font-height-increase)
(global-set-key (kbd "s-0") 'font-height-default)

(global-set-key (kbd "C-<up>") 'drag-stuff-up)
(global-set-key (kbd "C-<down>") 'drag-stuff-down)
(global-set-key (kbd "C-<left>") 'drag-stuff-left)
(global-set-key (kbd "C-<right>") 'drag-stuff-right)

(global-set-key (kbd "s-<up>") 'windmove-up)
(global-set-key (kbd "s-<down>") 'windmove-down)
(global-set-key (kbd "s-<left>") 'windmove-left)
(global-set-key (kbd "s-<right>") 'windmove-right)

(global-set-key (kbd "s-S-<up>") 'split-window-vertically)
(global-set-key (kbd "s-S-<down>") 'split-window-vertically)
(global-set-key (kbd "s-S-<left>") 'split-window-horizontally)
(global-set-key (kbd "s-S-<right>") 'split-window-horizontally)

(global-set-key (kbd "s-C-<up>") 'enlarge-window)
(global-set-key (kbd "s-C-<down>") 'shrink-window)
(global-set-key (kbd "s-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "s-C-<right>") 'enlarge-window-horizontally)

(global-set-key (kbd "s-'") (go-to-buffer-running-subprocess "bash"))

(defhydra hydra-help ()
  "help"
  ("q" nil "quit" :color red)
  ("a" apropos "apropos")
  ("b" describe-bindings "describe-bindings")
  ("k" describe-key "describe-key")
  ("f" describe-function "describe-function"))

(defhydra hydra-eval ()
  "evaluate"
  ("q" nil "quit" :color red)
  ("e" eval-expression "expression" :exit t)
  ("r" evaluate-region "region" :exit t)
  ("b" evaluate-buffer "buffer" :exit t))

(defhydra hydra-buffer ()
  "buffer"
  ("q" nil "quit" :color red)
  ("k" kill-buffer "kill current" :exit t)
  ("o" kill-other-buffers "kill others" :exit t)
  ("a" kill-all-buffers "kill all" :exit t)
  ("b" bookmark-set "set bookmark" :exit t)
  ("B" helm-bookmarks "list bookmarks" :exit t)
  ("l" helm-buffers-list "list buffers" :exit t)
  ("i" ibuffer "ibuffer" :exit t)
  ("r" revert-buffers-no-confirm "revert all" :exit t)
  ("<left>" switch-to-prev-buffer "previous" :exit t)
  ("<right>" switch-to-next-buffer "next" :exit t))

(defhydra hydra-window ()
  "window"
  ("q" nil "quit" :color red)
  ("k" delete-window "kill current" :exit t)
  ("o" delete-other-windows "kill others" :exit t))

(defhydra hydra-toggle ()
  "toggle"
  ("q" nil "quit" :color red)
  ("c" comment-dwim "comment" :exit t)
  ("s" global-whitespace-mode "whitespace" :exit t)
  ("t" toggle-theme "cycle colour theme")
  ("n" narrow-to-region "narrow to region" :exit t)
  ("N" widen "widen from region" :exit t)
  ("l" global-display-line-numbers-mode "line numbers" :exit t)
  ("C" global-flycheck-mode "flycheck" :exit t)
  ("]" hs-hide-all "folding hide all")
  ("[" hs-show-all "folding show all")
  ("SPC" hs-toggle-hiding "folding toggle"))

(defhydra hydra-magit ()
  "magit"
  ("q" nil "quit" :color red)
  ("." magit "here" :exit t)
  ("b" magit-blame "blame" :exit t)
  ("k" magit-run-gitk "gitk"))

(defhydra hydra-find ()
  "find"
  ("q" nil "quit" :color red)
  ("d" cd "change directory" :exit t)
  ("f" helm-projectile-find-file "find project files" :exit t)
  ("a" helm-find-files "find all files" :exit t)
  ("g" helm-projectile-grep "grep" :exit t)
  ("s" helm-multi-swoop-all "swoop in all buffers" :exit t)
  ("D" (dired default-directory) "dired here" :exit t))

(defhydra hydra-features ()
  ("q" nil "quit" :color red)
  ("<return>" indent-region "indent region" :exit t)
  ("j" ace-jump-mode "jump to character" :exit t)
  ("s" search-and-replace--start "search-and-replace start" :exit t)
  ("t" search-and-replace--toggle-buffer "search-and-replace toggle-buffer" :exit t)
  ("c" search-and-replace--commit "search-and-replace commit" :exit t))

(global-set-key (kbd "s-h") 'hydra-help/body)
(global-set-key (kbd "s-e") 'hydra-eval/body)
(global-set-key (kbd "s-b") 'hydra-buffer/body)
(global-set-key (kbd "s-w") 'hydra-window/body)
(global-set-key (kbd "s-t") 'hydra-toggle/body)
(global-set-key (kbd "s-g") 'hydra-magit/body)
(global-set-key (kbd "s-f") 'hydra-find/body)
(global-set-key (kbd "s-<return>") 'hydra-features/body)

(global-set-key (kbd "s-SPC") 'hydra-master/body)
(defhydra hydra-master ()
  "master"
  ("q" nil "quit" :color red)
  ("h" hydra-help/body "help" :exit t)
  ("e" hydra-eval/body "eval" :exit t)
  ("b" hydra-buffer/body "buffer" :exit t)
  ("w" hydra-window/body "window" :exit t)
  ("t" hydra-toggle/body "toggle" :exit t)
  ("g" hydra-magit/body "magit" :exit t)
  ("f" hydra-find/body "find" :exit t)
  ("<return>" hydra-features/body "features" :exit t))
