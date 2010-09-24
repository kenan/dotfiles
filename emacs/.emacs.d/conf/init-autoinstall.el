;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; AutoInstall
;; http://www.emacswiki.org/emacs/AutoInstall

(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))

(provide 'init-autoinstall)
