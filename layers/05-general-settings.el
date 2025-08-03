;; disable warnings
(setq warning-minimum-level :emergency)

;; disable ring-bell-function
(setq ring-bell-function 'ignore)

;; set utf-8 as the default encoding
(set-default-coding-systems 'utf-8)

;; disable all menu bars
(defun disable-bars ()
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1))

(defun disable-bars-on-frame (frame)
  (select-frame frame)
  (disable-bars))

(disable-bars)
(add-hook 'after-make-frame-functions 'disable-bars-on-frame)

;; enable save-place-mode
(save-place-mode 1)

;; stop creating backup~ and #autosave# files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; start emacs on a new buffer
(setq inhibit-splash-screen t)
(switch-to-buffer "*scratch*")

;; display line numbers
(global-display-line-numbers-mode)

(setq-default tab-width 4)

;; hideshow - code folding
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; whenever ibuffer is used, we sort by major mode
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-do-sort-by-major-mode)))
