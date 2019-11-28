;; general key bindings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "s-x") 'helm-M-x)
(global-set-key (kbd "s-q") 'evil-escape)
(global-set-key (kbd "<escape>") 'evil-escape)
(global-set-key (kbd "s-.") 'narrow-to-region)
(global-set-key (kbd "s-,") 'widen)
(global-set-key (kbd "s--") 'font-size-decrease)
(global-set-key (kbd "s-=") 'font-size-increase)
(global-set-key (kbd "s-/") 'comment-dwim)
(global-set-key (kbd "s-;") 'comment-dwim)
(global-set-key (kbd "s-<return>") 'indent-region)
(global-set-key (kbd "s-SPC") 'ace-jump-mode)
(global-set-key (kbd "C-<up>") 'move-line-up)
(global-set-key (kbd "C-<down>") 'move-line-down)

;; help key bindings
(global-set-key (kbd "s-h a") 'apropos)
(global-set-key (kbd "s-h b") 'describe-bindings)
(global-set-key (kbd "s-h k") 'describe-key)
(global-set-key (kbd "s-h f") 'describe-function)

;; eval
(global-set-key (kbd "s-e e") 'eval-expression)
(global-set-key (kbd "s-e r") 'eval-region)
(global-set-key (kbd "s-e b") 'eval-buffer)

;; buffer key bindings
(global-set-key (kbd "s-'") (go-to-buffer-running-subprocess "shell" "/bin/bash"))
(global-set-key (kbd "s-<") 'switch-to-prev-buffer)
(global-set-key (kbd "s->") 'switch-to-next-buffer)
(global-set-key (kbd "s-b i") 'ibuffer)
(global-set-key (kbd "s-b l") 'helm-buffers-list)
(global-set-key (kbd "s-b k") 'kill-buffer)
(global-set-key (kbd "s-b o") 'kill-other-buffers)
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

;; search and replace
(global-set-key (kbd "s-g s") 'search-and-replace--start)
(global-set-key (kbd "s-g SPC") 'search-and-replace--toggle-buffer)
(global-set-key (kbd "s-g c") 'search-and-replace--commit)

;; feature toggle key bindings
(global-set-key (kbd "s-t s") 'global-whitespace-mode)
(define-key projectile-mode-map (kbd "s-t p") 'projectile-command-map)

;; magit/git key bindings
(global-set-key (kbd "s-g .") 'magit)
