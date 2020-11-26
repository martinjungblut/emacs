(defmacro apply-font-settings (font-name font-size size-factor)
  `(progn
	 ;; load a nice font
	 (when (member ,font-name (font-family-list))
	   (set-face-attribute 'default nil :font ,font-name :height ,font-size))

	 (defun font-size-increase ()
	   "Increase font size."
	   (interactive)
	   (let ((new-font-size (+ (face-attribute 'default :height) ,size-factor)))
		 (set-face-attribute 'default nil :height new-font-size)
		 (message (format "+ New font size: %d" new-font-size))))

	 (defun font-size-decrease ()
	   "Decrease font size."
	   (interactive)
	   (let ((new-font-size (- (face-attribute 'default :height) ,size-factor)))
		 (set-face-attribute 'default nil :height new-font-size)
		 (message (format "- New font size: %d" new-font-size))))

	 (defun font-size-default ()
	   "Set font size to its default value."
	   (interactive)
	   (set-face-attribute 'default nil :height ,font-size)
	   (message (format "Default font size: %d" ,font-size)))))


(apply-font-settings "Ubuntu Mono" 130 10)
