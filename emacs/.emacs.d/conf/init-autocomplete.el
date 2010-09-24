;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;; http://cx4a.org/software/auto-complete/manual.ja.html

(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default)
  )

(provide 'init-autocomplete)
