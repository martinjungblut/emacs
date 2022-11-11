(defun c-c++-hook-lsp ()
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "clangd")
                    :major-modes '(c++-mode c-mode)
                    :server-id 'clangd))
  (lsp))

;; C++
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'c-c++-hook-lsp)

;; C
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'c-c++-hook-lsp)
