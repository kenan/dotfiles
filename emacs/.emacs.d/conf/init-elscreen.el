;; elscreen
;; http://www.morishima.net/~naoto/software/elscreen/index.php.ja
;; ftp://ftp.morishima.net/pub/morishima.net/naoto/ElScreen/

(when (require 'elscreen nil t)
  (if window-system
      (define-key elscreen-map (kbd "C-z")
	'iconify-or-deiconify-frame)
    (define-key elscreen-map (kbd "C-z")
      'suspend-emacs)))

(provide 'init-elscreen)

	 
