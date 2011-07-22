(add-to-list 'load-path (concat emacs-home "js"))

(vendor-require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; http://code.google.com/p/js2-mode/issues/detail?id=50#c7
;; hack to parse json properly
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(defadvice js2-reparse (before json)
  (setq js2-buffer-file-name buffer-file-name))

(ad-activate 'js2-reparse)

(defadvice js2-parse-statement (around json)
  (if (and (= tt js2-LC)
	   js2-buffer-file-name
	   (string-equal (substring js2-buffer-file-name -5) ".json")
	   (eq (+ (save-excursion
		    (goto-char (point-min))
		    (back-to-indentation)
		    (while (eolp)
		      (next-line)
		      (back-to-indentation))
		    (point)) 1) js2-ts-cursor))
      (setq ad-return-value (js2-parse-assign-expr))
    ad-do-it))
(ad-activate 'js2-parse-statement)

(setq js2-consistent-level-indent-inner-bracket-p t
      js2-pretty-multiline-decl-indentation-p t)
(setq js-indent-level 4)
(add-hook 'js2-mode-hook (lambda ()
			   (setq indent-tabs-mode nil)))

(vendor-require 'jquery-doc)
(add-hook 'js2-mode-hook 'jquery-doc-setup)

(provide 'init-js)
