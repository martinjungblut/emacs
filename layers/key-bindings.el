;; general key bindings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "s-x") 'helm-M-x)
(global-set-key (kbd "s-q") (lambda () (interactive) (evil-normal-state) (keyboard-escape-quit) (keyboard-quit)))
(global-set-key (kbd "s-'") (go-to-buffer-running-subprocess "shell" "/bin/bash"))
(global-set-key (kbd "s-.") 'narrow-to-region)
(global-set-key (kbd "s-,") 'widen)
(global-set-key (kbd "s--") 'text-scale-adjust)
(global-set-key (kbd "s-=") 'text-scale-adjust)
(global-set-key (kbd "s-/") 'comment-dwim)
(global-set-key (kbd "s-;") 'comment-dwim)
(global-set-key (kbd "s-<return>") 'indent-region)
(global-set-key (kbd "s-SPC") 'ace-jump-mode)
(global-set-key (kbd "s-<") 'switch-to-prev-buffer)
(global-set-key (kbd "s->") 'switch-to-next-buffer)
(global-set-key (kbd "s-S-<up>") 'split-window-vertically)
(global-set-key (kbd "s-S-<down>") 'split-window-vertically)
(global-set-key (kbd "s-S-<left>") 'split-window-horizontally)
(global-set-key (kbd "s-S-<right>") 'split-window-horizontally)
(global-set-key (kbd "s-<up>") 'windmove-up)
(global-set-key (kbd "s-<down>") 'windmove-down)
(global-set-key (kbd "s-<left>") 'windmove-left)
(global-set-key (kbd "s-<right>") 'windmove-right)

;; help key bindings
(global-set-key (kbd "s-h a") 'apropos)
(global-set-key (kbd "s-h b") 'describe-bindings)
(global-set-key (kbd "s-h k") 'describe-key)
(global-set-key (kbd "s-h f") 'describe-function)
(global-set-key (kbd "s-h e") 'eval-expression)
(global-set-key (kbd "s-h r") 'eval-region)

;; buffer key bindings
(global-set-key (kbd "s-b i") 'ibuffer)
(global-set-key (kbd "s-b l") 'helm-buffers-list)
(global-set-key (kbd "s-b k") 'kill-buffer)
(global-set-key (kbd "s-b o") 'kill-other-buffers)

;; window key bindings
(global-set-key (kbd "s-w k") 'delete-window)
(global-set-key (kbd "s-w o") 'delete-other-windows)

;; navigation/search/jump key bindings
(global-set-key (kbd "s-f f") 'helm-find-files)

;; feature toggle key bindings
(global-set-key (kbd "s-t s") 'global-whitespace-mode)
