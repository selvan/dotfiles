;; path constants
(defvar emacs-home "~/code/dotfiles/.emacs.d/")
(setq exec-path (cons "~/code/dotfiles/bin/" exec-path))
(defvar vendor (concat emacs-home "vendor/"))

(defun vendor-require (feature &optional dir)
  (if dir
      (add-to-list 'load-path (concat vendor dir))
    (add-to-list 'load-path (concat vendor (symbol-name feature))))
  (require feature))

;; load the files in emacs home
(add-to-list 'load-path emacs-home)

;;; autocomplete
(vendor-require 'auto-complete-config "auto-complete")
(add-to-list 'ac-dictionary-directories (concat emacs-home "dict"))
(ac-config-default)
;; Distinguish case
(setq ac-ignore-case nil)

;; C
(require 'cc-mode)

;; Ruby
(require 'init-ruby)

;; JavaScript
(require 'init-js)

;; YAML
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; ack
(vendor-require 'full-ack)
(setq ack-executable "ack-grep")
(setenv "ACK_PAGER")
;(setq ack-arguments (read-lines (concat emacs-home "../.ackrc")))

;; tex
(setq TeX-PDF-mode t)
(add-hook 'doc-view-mode-hook 'auto-revert-mode)


(vendor-require 'nginx-mode)

;; smex
(vendor-require 'smex)
(smex-initialize)

(require 'init-ido)

(server-start)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((encoding . utf-8) (encoding . binary) (ruby-compilation-executable . "ruby") (ruby-compilation-executable . "ruby1.8") (ruby-compilation-executable . "ruby1.9") (ruby-compilation-executable . "rbx") (ruby-compilation-executable . "jruby")))))

