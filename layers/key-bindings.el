;; general key bindings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "s-x") 'helm-M-x)
(global-set-key (kbd "s-q") 'evil-escape)
(global-set-key (kbd "<escape>") 'evil-escape)
(global-set-key (kbd "s-.") 'narrow-to-region)
(global-set-key (kbd "s-,") 'widen)
(global-set-key (kbd "s--") 'font-size-decrease)
(global-set-key (kbd "s-=") 'font-size-increase)
(global-set-key (kbd "s-0") 'font-size-default)
(global-set-key (kbd "s-/") 'comment-dwim)
(global-set-key (kbd "s-;") 'comment-dwim)
(global-set-key (kbd "s-<return>") 'indent-region)
(global-set-key (kbd "s-SPC") 'ace-jump-mode)
(global-set-key (kbd "C-<up>") 'drag-stuff-up)
(global-set-key (kbd "C-<down>") 'drag-stuff-down)
(global-set-key (kbd "C-<left>") 'drag-stuff-left)
(global-set-key (kbd "C-<right>") 'drag-stuff-right)

(global-set-key (kbd "s-h") 'hydra-help/body)
(defhydra hydra-help ()
  "help"
  ("q" nil "quit" :color red)
  ("a" apropos "apropos")
  ("b" describe-bindings "describe-bindings")
  ("k" describe-key "describe-key")
  ("f" describe-function "describe-function"))

(global-set-key (kbd "s-e") 'hydra-eval/body)
(defhydra hydra-eval ()
  "evaluate"
  ("q" nil "quit" :color red)
  ("e" eval-expression "expression" :exit t)
  ("r" evaluate-region "region" :exit t)
  ("b" evaluate-buffer "buffer" :exit t))

;; buffer key bindings
(global-set-key (kbd "s-'") (go-to-buffer-running-subprocess "bash"))
(global-set-key (kbd "s-<") 'switch-to-prev-buffer)
(global-set-key (kbd "s->") 'switch-to-next-buffer)
(global-set-key (kbd "s-b i") 'ibuffer)
(global-set-key (kbd "s-b l") 'helm-buffers-list)
(global-set-key (kbd "s-b k") 'kill-buffer)
(global-set-key (kbd "s-b o") 'kill-other-buffers)
(global-set-key (kbd "s-b a") 'kill-all-buffers)
(global-set-key (kbd "s-b r") 'revert-buffers-no-confirm)

;; window key bindings
(global-set-key (kbd "s-<up>") 'windmove-up)
(global-set-key (kbd "s-<down>") 'windmove-down)
(global-set-key (kbd "s-<left>") 'windmove-left)
(global-set-key (kbd "s-<right>") 'windmove-right)

(global-set-key (kbd "s-S-<up>") 'split-window-vertically)
(global-set-key (kbd "s-S-<down>") 'split-window-vertically)
(global-set-key (kbd "s-S-<left>") 'split-window-horizontally)
(global-set-key (kbd "s-S-<right>") 'split-window-horizontally)

(global-set-key (kbd "s-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "s-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-C-<down>") 'shrink-window)
(global-set-key (kbd "s-C-<up>") 'enlarge-window)

(global-set-key (kbd "s-w k") 'delete-window)
(global-set-key (kbd "s-w o") 'delete-other-windows)

;; navigation/search/jump key bindings
(global-set-key (kbd "s-f f") 'helm-projectile-find-file)
(global-set-key (kbd "s-f a") 'helm-find-files)
(global-set-key (kbd "s-f s") 'helm-projectile-grep)
(global-set-key (kbd "s-d d") 'cd)
(global-set-key (kbd "s-d .") (lambda () (interactive) (dired default-directory)))

;; feature toggle key bindings
(global-set-key (kbd "s-t") 'hydra-toggle/body)
(defhydra hydra-toggle ()
  "toggle"
  ("q" nil "quit" :color red)
  ("s" global-whitespace-mode "whitespace" :exit t)
  ("c" global-flycheck-mode "flycheck" :exit t)
  ("]" hs-hide-all "folding hide all")
  ("[" hs-show-all "folding show all")
  ("SPC" hs-toggle-hiding "folding toggle"))

;; magit/git key bindings
(global-set-key (kbd "s-g") 'hydra-magit/body)
(defhydra hydra-magit ()
  "magit"
  ("q" nil "quit" :color red)
  ("." magit "here" :exit t)
  ("b" magit-blame "blame" :exit t)
  ("k" magit-run-gitk "gitk")
  ("s" search-and-replace--start "search-and-replace start")
  ("SPC" search-and-replace--toggle-buffer "search-and-replace toggle-buffer")
  ("c" search-and-replace--commit "search-and-replace commit"))
