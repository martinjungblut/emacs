(defun my-java-hook ()
  (require 'lsp-java)
  (require 'dap-java))

(add-hook 'java-mode-hook #'lsp)
(add-hook 'java-mode-hook 'my-java-hook)
