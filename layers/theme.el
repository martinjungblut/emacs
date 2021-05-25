(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic nil)
  (load-theme 'doom-homage-black t))

(use-package modus-themes
  :ensure t)

(defun cycle-themes (&rest themes)
  (interactive)
  (let* ((current-theme-index (-elem-index (car custom-enabled-themes) themes))
         (attempted-index (+ 1 (or current-theme-index -1)))
         (next-theme (or (nth attempted-index themes) (car themes))))
    (progn
      (dolist (theme custom-enabled-themes)
        (disable-theme theme))
      (load-theme next-theme t)
      next-theme)))

(defun toggle-theme ()
  (interactive)
  (cycle-themes 'modus-operandi 'doom-homage-white 'modus-vivendi 'doom-homage-black))
