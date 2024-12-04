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
(global-set-key (kbd "s-<tab>") 'ace-jump-mode)
(global-set-key (kbd "s-<insert>") 'evil-insert-resume)

(global-set-key (kbd "C-<up>") 'drag-stuff-up)
(global-set-key (kbd "C-<down>") 'drag-stuff-down)
(global-set-key (kbd "C-<left>") 'drag-stuff-left)
(global-set-key (kbd "C-<right>") 'drag-stuff-right)

(global-set-key (kbd "s-<up>") 'windmove-up)
(global-set-key (kbd "s-<down>") 'windmove-down)
(global-set-key (kbd "s-<left>") 'windmove-left)
(global-set-key (kbd "s-<right>") 'windmove-right)

(global-set-key (kbd "S-<up>") 'evil-previous-line-recenter)
(global-set-key (kbd "S-<down>") 'evil-next-line-recenter)
(global-set-key (kbd "S-<left>") 'recenter)
(global-set-key (kbd "S-<right>") 'recenter)

(global-set-key (kbd "s-S-<up>") 'split-window-vertically)
(global-set-key (kbd "s-S-<down>") 'split-window-vertically)
(global-set-key (kbd "s-S-<left>") 'split-window-horizontally)
(global-set-key (kbd "s-S-<right>") 'split-window-horizontally)

(global-set-key (kbd "s-C-<up>") 'enlarge-window)
(global-set-key (kbd "s-C-<down>") 'shrink-window)
(global-set-key (kbd "s-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "s-C-<right>") 'enlarge-window-horizontally)

(global-set-key (kbd "s-'") 'go-to-buffer-running-bash)
(global-set-key (kbd "s-.") 'lsp-find-definition)

(global-set-key (kbd "C-s-1") (frame-configuration-save ?1))
(global-set-key (kbd "C-s-2") (frame-configuration-save ?2))
(global-set-key (kbd "C-s-3") (frame-configuration-save ?3))
(global-set-key (kbd "C-s-4") (frame-configuration-save ?4))
(global-set-key (kbd "C-s-5") (frame-configuration-save ?5))
(global-set-key (kbd "C-s-6") (frame-configuration-save ?6))
(global-set-key (kbd "C-s-7") (frame-configuration-save ?7))
(global-set-key (kbd "C-s-8") (frame-configuration-save ?8))
(global-set-key (kbd "C-s-9") (frame-configuration-save ?9))
(global-set-key (kbd "s-1")   (frame-configuration-restore ?1))
(global-set-key (kbd "s-2")   (frame-configuration-restore ?2))
(global-set-key (kbd "s-3")   (frame-configuration-restore ?3))
(global-set-key (kbd "s-4")   (frame-configuration-restore ?4))
(global-set-key (kbd "s-5")   (frame-configuration-restore ?5))
(global-set-key (kbd "s-6")   (frame-configuration-restore ?6))
(global-set-key (kbd "s-7")   (frame-configuration-restore ?7))
(global-set-key (kbd "s-8")   (frame-configuration-restore ?8))
(global-set-key (kbd "s-9")   (frame-configuration-restore ?9))

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
  ("l" helm-buffers-list "list buffers" :exit t)
  ("i" ibuffer "ibuffer" :exit t)
  ("r" revert-buffers-no-confirm "revert all" :exit t)
  ("<left>" switch-to-prev-buffer "previous" :exit t)
  ("<right>" switch-to-next-buffer "next" :exit t))

(defhydra hydra-window ()
  "window"
  ("q" nil "quit" :color red)
  ("k" delete-window "kill current" :exit t)
  ("o" delete-other-windows "kill others" :exit t)
  ("SPC" make-frame "make a new frame" :exit t))

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
  ("g" helm-projectile-rg "ripgrep" :exit t)
  ("s" helm-swoop "swoop buffer" :exit t)
  ("S" helm-multi-swoop-all "swoop all buffers" :exit t)
  ("D" (dired default-directory) "dired here" :exit t)
  ("E" dired-emacs-directory "dired emacs directory" :exit t)
  ("SPC" find-file "find file (without helm)" :exit t))

(defhydra hydra-features ()
  ("q" nil "quit" :color red)
  ("<return>" indent-region "indent region" :exit t)
  ("f" fill-region "fill region" :exit t)
  ("b" helm-bookmarks "list bookmarks" :exit t)
  ("B" bookmark-current-line "set bookmark" :exit t)
  ("d" bookmark-delete-current-line "delete bookmark" :exit t)
  ("s" search-and-replace--start "search-and-replace start" :exit t)
  ("t" search-and-replace--toggle-buffer "search-and-replace toggle-buffer" :exit t)
  ("c" search-and-replace--commit "search-and-replace commit" :exit t))

(defhydra hydra-reference ()
  ("q" nil "quit" :color red)
  ("<return>" helm-gtags-find-tag-from-here "find tag from here" :exit t)
  ("." lsp-ui-peek-find-references "peek at references via LSP" :exit t)
  ("d" lsp-goto-type-definition "go to type definition via LSP" :exit t)
  ("i" lsp-goto-implementation "go to implementation via LSP" :exit t)
  ("t" helm-gtags-find-tag "find tag" :exit t)
  ("f" helm-gtags-find-pattern "find pattern" :exit t)
  ("<backspace>" helm-gtags-pop-stack "pop stack" :exit t)
  ("c" helm-gtags-create-tags "create tags" :exit t)
  ("u" helm-gtags-update-tags "update tags" :exit t))

(global-set-key (kbd "s-h") 'hydra-help/body)
(global-set-key (kbd "s-r") 'hydra-reference/body)
(global-set-key (kbd "s-e") 'hydra-eval/body)
(global-set-key (kbd "s-b") 'hydra-buffer/body)
(global-set-key (kbd "s-w") 'hydra-window/body)
(global-set-key (kbd "s-t") 'hydra-toggle/body)
(global-set-key (kbd "s-g") 'hydra-magit/body)
(global-set-key (kbd "s-f") 'hydra-find/body)
(global-set-key (kbd "s-p") 'hydra-language/body)
(global-set-key (kbd "s-<return>") 'hydra-features/body)

(global-set-key (kbd "s-SPC") 'hydra-master/body)
(defhydra hydra-master ()
  "master"
  ("q" nil "quit" :color red)
  ("h" hydra-help/body "help" :exit t)
  ("r" hydra-reference/body "reference" :exit t)
  ("e" hydra-eval/body "eval" :exit t)
  ("b" hydra-buffer/body "buffer" :exit t)
  ("w" hydra-window/body "window" :exit t)
  ("t" hydra-toggle/body "toggle" :exit t)
  ("g" hydra-magit/body "magit" :exit t)
  ("f" hydra-find/body "find" :exit t)
  ("p" hydra-language/body "programming language specific" :exit t)
  ("<return>" hydra-features/body "features" :exit t))