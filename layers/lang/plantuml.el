(use-package plantuml-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
	  (setq plantuml-jar-path "/usr/share/plantuml/plantuml.jar")
	  (setq plantuml-output-type "png"))
