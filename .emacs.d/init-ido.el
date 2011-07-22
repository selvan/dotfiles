;; Use C-f during file selection to switch to regular find-fxonpxonile
(ido-mode t)  ; use 'buffer rather than t to use only buffer switching
(setq
 ido-everywhere t
 ido-use-filename-at-point nil
 ido-auto-merge-work-directories-length 0
 ido-use-filename-at-point nil      ; don't use filename at point (annoying)
 ido-use-url-at-point nil           ; don't use url at point (annoying)
 ido-case-fold  t                   ; be case-insensitive
 ido-max-prospects 10
 ido-max-window-height 1
 ido-ignore-files (append ido-ignore-files '("\\.orig\\'")))

(autoload 'idomenu "idomenu" nil t)
(provide 'init-ido)
