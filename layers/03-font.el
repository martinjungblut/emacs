(defmacro apply-font-settings (font-name font-weight font-height height-factor)
  `(progn
	 ;; load a nice font
	 (when (member ,font-name (font-family-list))
	   (set-face-attribute 'default nil :font ,font-name :height ,font-height :weight ,font-weight))

	 (defun font-height-get ()
	   (face-attribute 'default :height))

	 (defun font-height-increase ()
	   "Increase font height."
	   (interactive)
	   (set-face-attribute 'default nil :height (+ (font-height-get) ,height-factor))
	   (message (format "+ New font height: %d" (font-height-get))))

	 (defun font-height-decrease ()
	   "Decrease font height."
	   (interactive)
	   (set-face-attribute 'default nil :height (- (font-height-get) ,height-factor))
	   (message (format "- New font height: %d" (font-height-get))))

	 (defun font-height-default ()
	   "Set font height to its default value."
	   (interactive)
	   (set-face-attribute 'default nil :height ,font-height)
	   (message (format "Default font height: %d" (font-height-get))))))

(let ((hostname (system-name)))
  (cond
   ((string-equal "aura" hostname) (apply-font-settings "DejaVu Sans Mono" 'regular 90 10))
   (t (apply-font-settings "DejaVu Sans Mono" 'regular 120 10))))
