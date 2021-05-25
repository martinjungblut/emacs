(defmacro apply-font-settings (font-name font-size size-factor)
  `(progn
	 ;; load a nice font
	 (when (member ,font-name (font-family-list))
	   (set-face-attribute 'default nil :font ,font-name :height ,font-size))

	 (defun font-size-get ()
	   (face-attribute 'default :height))

	 (defun font-size-increase ()
	   "Increase font size."
	   (interactive)
	   (set-face-attribute 'default nil :height (+ (font-size-get) ,size-factor))
	   (message (format "+ New font size: %d" (font-size-get))))

	 (defun font-size-decrease ()
	   "Decrease font size."
	   (interactive)
	   (set-face-attribute 'default nil :height (- (font-size-get) ,size-factor))
	   (message (format "- New font size: %d" (font-size-get))))

	 (defun font-size-default ()
	   "Set font size to its default value."
	   (interactive)
	   (set-face-attribute 'default nil :height ,font-size)
	   (message (format "Default font size: %d" (font-size-get))))))


(apply-font-settings "PT Mono" 110 5)
