;; projectile - project integration library
(use-package projectile
  :ensure t
  :config (projectile-mode +1))

;; helm-projectile - seamless intergration between helm and projectile
(use-package helm-projectile
  :ensure t
  :after (helm projectile))
