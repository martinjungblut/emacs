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
  ("a" apropos "apropos")
  ("b" describe-bindings "describe-bindings")
  ("k" describe-key "describe-key")
  ("f" describe-function "describe-function"))

(global-set-key (kbd "s-e") 'hydra-eval/body)
(defhydra hydra-eval ()
  "evaluate"
  ("e" eval-expression "expression")
  ("r" evaluate-region "region")
  ("r" evaluate-buffer "buffer"))

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

;; search and replace
(global-set-key (kbd "s-g s") 'search-and-replace--start)
(global-set-key (kbd "s-g SPC") 'search-and-replace--toggle-buffer)
(global-set-key (kbd "s-g c") 'search-and-replace--commit)

;; feature toggle key bindings
(global-set-key (kbd "s-t s") 'global-whitespace-mode)
(global-set-key (kbd "s-t c") 'global-flycheck-mode)
(define-key projectile-mode-map (kbd "s-t p") 'projectile-command-map)
(global-set-key (kbd "s-t f ]") 'hs-hide-all)
(global-set-key (kbd "s-t f [") 'hs-show-all)
(global-set-key (kbd "s-t f SPC") 'hs-toggle-hiding)

;; magit/git key bindings
(global-set-key (kbd "s-g") 'hydra-magit/body)
(defhydra hydra-magit ()
  "magit"
  ("." magit "here")
  ("b" magit-blame "blame")
  ("k" magit-run-gitk "gitk"))
