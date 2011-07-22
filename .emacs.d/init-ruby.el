(add-to-list 'load-path (concat emacs-home "ruby"))

(vendor-require 'inf-ruby)

(vendor-require 'rspec-mode)

(setq rspec-spec-command "rspec")
(setq rspec-use-rvm t)
(setq rspec-use-rake-flag nil)

(vendor-require 'yari)


;; (vendor-require 'rvm)
;; (rvm-use-default)

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(setq auto-mode-alist (append auto-mode-alist
			      '(("\\.rake$" . ruby-mode)
				("\\.gemspec$" . ruby-mode)
				("\\.ru$" . ruby-mode)
				("\\.god$" . ruby-mode)
				("Rakefile$" . ruby-mode)
				("Gemfile$" . ruby-mode)
				("capfile$" . ruby-mode)
				("Capfile$" . ruby-mode)
				("Vagrantfile$" . ruby-mode))))
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(vendor-require 'rhtml-mode "rhtml")

(provide 'init-ruby)
