
((digest . "68b329da9893e34099c7d8ad5cb9c940") (undo-list nil (#(";; load-pathの設定
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; elispとconfディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path \"elisp\" \"conf\")

;; Pathを設定
(add-to-list 'exec-path \"/opt/local/bin\")
(add-to-list 'exec-path \"/usr/local/bin\")

;; Emacs の種類バージョンを判別するための変数を定義
;; @see http://github.com/elim/dotemacs/blob/master/init.el
(defun x->bool (elt) (not (not elt)))
(defvar emacs22-p (equal emacs-major-version 22))
(defvar emacs23-p (equal emacs-major-version 23))
(defvar darwin-p (eq system-type 'darwin))
(defvar ns-p (featurep 'ns))
(defvar carbon-p (and (eq window-system 'mac) emacs22-p))
(defvar mac-p (and (eq window-system 'mac) emacs23-p))
(defvar linux-p (eq system-type 'gnu/linux))
(defvar colinux-p (when linux-p
                    (let ((file \"/proc/modules\"))
                      (and
                       (file-readable-p file)
                       (x->bool
                        (with-temp-buffer
                          (insert-file-contents file)
                          (goto-char (point-min))
                          (re-search-forward \"^cofuse\\.+\" nil t)))))))
(defvar cygwin-p (eq system-type 'cygwin))
(defvar nt-p (eq system-type 'windows-nt))
(defvar meadow-p (featurep 'meadow))
(defvar windows-p (or cygwin-p nt-p meadow-p))

(require 'init-autoinstall)


(when (require 'color-theme nil t)
  (color-theme-initialize)
  (color-theme-hober))

;;(setq face-font-rescale-alist
;;      '((\".*Menlo.*\" . 1.0)
;;	 (\" .*Hiragino_Mincho_ProN.*\" . 1.3)
;;	 (\".*nfmotoyacedar-bold.*\" . 1.3)
;;	 (\".*nfmotoyacedar-medium.*\" . 1.3)
;;	 (\"-cdac$\" . 1.4)))


(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))


(when (require 'color-moccur nil t)
  ;;
  (define-key global-map (kbd \"M-o\") 'occur-by-moccur)
  ;;
  (setq moccur-split-word t)
  ;;
  (add-to-list 'dmoccur-exclusion-mask \"¥¥.DS_Store\")
  (add-to-list 'dmoccur-exclusion-mask \"^#.+#$\")
  (require 'moccur-edit nil t)
  ;;
  (when (and (executable-find \"cmigemo\")
	     (require 'migemo nil t))
    (setq moccur-use-migemo t)))

;; grep-edit
(require 'grep-edit)
 
 (when (and (executable-find \"cmigemo\")
 	   (require 'migemo nil t))
   ;;cmigemoを使う
   (setq migemo-command \"cmigemo\")
   ;; Migemo Command Option
   (setq migemo-options '(\"-q\" \"--emacs\" \"-i\" \"¥a\"))
   ;;
   (setq migemo-dictionary
 	\"/usr/local/share/migemo/utf-8/migemo-dict\")
   ;;
   (setq migemo-user-dictionary nil)
   (setq migemo-regex-dictionary nil)
   ;;
   (setq migemo-use-pattern-alist t)
   (setq migemo-use-frequent-pattern-alist t)
   (setq migemo-pattern-alit-length 1000)
   (setq migemo-coding-system 'utf-8-unix)
   ;; migemo
   (migemo-init))

(require 'init-global)
(require 'init-skk)

;;
(when (require 'undohist nil t)
  (undohist-initialize))
;;
;;(when (require 'undo-tree nil t)
;;  (global-undo-tree-mode))

;; カーソルの位置をundo redoする
;;(when (require 'point-undo nil t)
;;  (define-key global-map [f5] 'point-undo)
;;  (define-key global-map [f6] 'point-redo))


(require 'init-autocomplete)
(require 'init-elscreen)
(require 'init-anything)
;;
;;(require 'init-egg)
(require 'init-ruby)

;; haml-mode
(require 'haml-mode nil 't)
(add-to-list 'auto-mode-alist '(\"¥¥.haml$\" . haml-mode))

;; sass-mode
(require 'sass-mode nil 't)
(add-to-list 'auto-mode-alist '(\"¥¥.sass$\" . sass-mode))

;; 環境依存をロード
;; 環境依存をロード
(cond
 (mac-p (require 'init-mac))
 (linux-p (require 'init-linux))
 )

;;終了時に聞く
(setq confirm-kill-emacs 'y-or-n-p)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name \"~/.emacs.d/elpa/package.el\"))
  (package-initialize))
(put 'set-goal-column 'disabled nil)" 0 3 (fontified t face font-lock-comment-delimiter-face) 3 16 (fontified t face font-lock-comment-face) 16 17 (fontified t) 17 22 (fontified t face font-lock-keyword-face) 22 23 (fontified t) 23 39 (fontified t face font-lock-function-name-face) 39 41 (fontified t) 41 46 (fontified t face font-lock-type-face) 46 57 (fontified t) 57 60 (fontified t face font-lock-keyword-face) 60 73 (fontified t) 73 79 (fontified t face font-lock-keyword-face) 79 106 (fontified t) 106 109 (fontified t face font-lock-keyword-face) 109 232 (fontified t) 232 234 (fontified t face font-lock-keyword-face) 234 343 (fontified t) 343 346 (fontified t face font-lock-comment-delimiter-face) 346 390 (fontified t face font-lock-comment-face) 390 408 (fontified t) 408 415 (fontified t face font-lock-string-face) 415 416 (fontified t) 416 422 (fontified t face font-lock-string-face) 422 425 (fontified t) 425 428 (fontified t face font-lock-comment-delimiter-face) 428 436 (fontified t face font-lock-comment-face) 436 460 (fontified t) 460 476 (fontified t face font-lock-string-face) 476 502 (fontified t) 502 518 (fontified t face font-lock-string-face) 518 520 (fontified t) 520 521 (fontified t) 521 524 (fontified t face font-lock-comment-delimiter-face) 524 554 (fontified t face font-lock-comment-face) 554 557 (fontified t face font-lock-comment-delimiter-face) 557 614 (fontified t face font-lock-comment-face) 614 615 (fontified t) 615 620 (fontified t face font-lock-keyword-face) 620 621 (fontified t) 621 628 (fontified t face font-lock-function-name-face) 628 653 (fontified t) 653 659 (fontified t face font-lock-keyword-face) 659 660 (fontified t) 660 669 (fontified t face font-lock-variable-name-face) 669 703 (fontified t) 703 709 (fontified t face font-lock-keyword-face) 709 710 (fontified t) 710 719 (fontified t face font-lock-variable-name-face) 719 753 (fontified t) 753 759 (fontified t face font-lock-keyword-face) 759 760 (fontified t) 760 768 (fontified t face font-lock-variable-name-face) 768 796 (fontified t) 796 802 (fontified t face font-lock-keyword-face) 802 803 (fontified t) 803 807 (fontified t face font-lock-variable-name-face) 807 809 (fontified t) 809 817 (fontified t face font-lock-keyword-face) 817 819 (fontified t) 819 821 (fontified t face font-lock-constant-face) 821 825 (fontified t) 825 831 (fontified t face font-lock-keyword-face) 831 832 (fontified t) 832 840 (fontified t face font-lock-variable-name-face) 840 883 (fontified t) 883 889 (fontified t face font-lock-keyword-face) 889 890 (fontified t) 890 895 (fontified t face font-lock-variable-name-face) 895 938 (fontified t) 938 944 (fontified t face font-lock-keyword-face) 944 945 (fontified t) 945 952 (fontified t face font-lock-variable-name-face) 952 983 (fontified t) 983 989 (fontified t face font-lock-keyword-face) 989 990 (fontified t) 990 999 (fontified t face font-lock-variable-name-face) 999 1001 (fontified t) 1001 1005 (fontified t face font-lock-keyword-face) 1005 1035 (fontified t) 1035 1038 (fontified t face font-lock-keyword-face) 1038 1046 (fontified t) 1046 1061 (fontified t face font-lock-string-face) 1061 1064 (fontified t) 1064 1194 (fontified t) 1194 1210 (fontified t face font-lock-keyword-face) 1210 1360 (fontified t) 1360 1372 (fontified t face font-lock-string-face) 1372 1387 (fontified t) 1387 1393 (fontified t face font-lock-keyword-face) 1393 1394 (fontified t) 1394 1402 (fontified t face font-lock-variable-name-face) 1402 1430 (fontified t) 1430 1436 (fontified t face font-lock-keyword-face) 1436 1437 (fontified t) 1437 1441 (fontified t face font-lock-variable-name-face) 1441 1473 (fontified t) 1473 1479 (fontified t face font-lock-keyword-face) 1479 1480 (fontified t) 1480 1488 (fontified t face font-lock-variable-name-face) 1488 1490 (fontified t) 1490 1498 (fontified t face font-lock-keyword-face) 1498 1500 (fontified t) 1500 1506 (fontified t face font-lock-constant-face) 1506 1510 (fontified t) 1510 1516 (fontified t face font-lock-keyword-face) 1516 1517 (fontified t) 1517 1526 (fontified t face font-lock-variable-name-face) 1526 1558 (fontified t) 1558 1565 (fontified t face font-lock-keyword-face) 1565 1567 (fontified t) 1567 1583 (fontified t face font-lock-constant-face) 1583 1585 (fontified t) 1585 1588 (fontified t) 1588 1592 (fontified t face font-lock-keyword-face) 1592 1594 (fontified t) 1594 1601 (fontified t face font-lock-keyword-face) 1601 1603 (fontified t) 1603 1614 (fontified t face font-lock-constant-face) 1614 1673 (fontified t) 1673 1675 (fontified t face font-lock-comment-delimiter-face) 1675 1705 (fontified t face font-lock-comment-face) 1705 1713 (fontified t face font-lock-comment-delimiter-face) 1713 1735 (fontified t face font-lock-comment-face) 1735 1737 (fontified t face font-lock-comment-delimiter-face) 1737 1775 (fontified t face font-lock-comment-face) 1775 1777 (fontified t face font-lock-comment-delimiter-face) 1777 1812 (fontified t face font-lock-comment-face) 1812 1814 (fontified t face font-lock-comment-delimiter-face) 1814 1851 (fontified t face font-lock-comment-face) 1851 1853 (fontified t face font-lock-comment-delimiter-face) 1853 1874 (fontified t face font-lock-comment-face) 1874 1962 (fontified t) 1962 1966 (fontified t face font-lock-keyword-face) 1966 1968 (fontified t) 1968 1975 (fontified t face font-lock-keyword-face) 1975 1977 (fontified t) 1977 1989 (fontified t face font-lock-constant-face) 1989 1999 (fontified t) 1999 2001 (fontified t face font-lock-comment-delimiter-face) 2001 2002 (fontified t face font-lock-comment-face) 2002 2032 (fontified t) 2032 2037 (fontified t face font-lock-string-face) 2037 2059 (fontified t) 2059 2061 (fontified t face font-lock-comment-delimiter-face) 2061 2062 (fontified t face font-lock-comment-face) 2062 2091 (fontified t) 2091 2093 (fontified t) 2093 2095 (fontified t face font-lock-comment-delimiter-face) 2095 2096 (fontified t face font-lock-comment-face) 2096 2135 (fontified t) 2135 2148 (fontified t face font-lock-string-face) 2148 2189 (fontified t) 2189 2197 (fontified t face font-lock-string-face) 2197 2202 (fontified t) 2202 2209 (fontified t face font-lock-keyword-face) 2209 2211 (fontified t) 2211 2222 (fontified t face font-lock-constant-face) 2222 2232 (fontified t) 2232 2234 (fontified t face font-lock-comment-delimiter-face) 2234 2235 (fontified t face font-lock-comment-face) 2235 2238 (fontified t) 2238 2242 (fontified t face font-lock-keyword-face) 2242 2265 (fontified t) 2265 2274 (fontified t face font-lock-string-face) 2274 2283 (fontified t) 2283 2290 (fontified t face font-lock-keyword-face) 2290 2292 (fontified t) 2292 2298 (fontified t face font-lock-constant-face) 2298 2341 (fontified t) 2341 2344 (fontified t face font-lock-comment-delimiter-face) 2344 2354 (fontified t face font-lock-comment-face) 2354 2355 (fontified t) 2355 2362 (fontified t face font-lock-keyword-face) 2362 2364 (fontified t) 2364 2373 (fontified t face font-lock-constant-face) 2373 2379 (fontified t) 2379 2383 (fontified t face font-lock-keyword-face) 2383 2406 (fontified t) 2406 2415 (fontified t face font-lock-string-face) 2415 2423 (fontified t) 2423 2430 (fontified t face font-lock-keyword-face) 2430 2432 (fontified t) 2432 2438 (fontified t face font-lock-constant-face) 2438 2450 (fontified t) 2450 2452 (fontified t face font-lock-comment-delimiter-face) 2452 2463 (fontified t face font-lock-comment-face) 2463 2487 (fontified t) 2487 2496 (fontified t face font-lock-string-face) 2496 2501 (fontified t) 2501 2504 (fontified t face font-lock-comment-delimiter-face) 2504 2526 (fontified t face font-lock-comment-face) 2526 2552 (fontified t) 2552 2556 (fontified t face font-lock-string-face) 2556 2557 (fontified t) 2557 2566 (fontified t face font-lock-string-face) 2566 2567 (fontified t) 2567 2571 (fontified t face font-lock-string-face) 2571 2572 (fontified t) 2572 2576 (fontified t face font-lock-string-face) 2576 2582 (fontified t) 2582 2584 (fontified t face font-lock-comment-delimiter-face) 2584 2585 (fontified t face font-lock-comment-face) 2585 2612 (fontified t) 2612 2614 (fontified t) 2614 2657 (fontified t face font-lock-string-face) 2657 2662 (fontified t) 2662 2664 (fontified t face font-lock-comment-delimiter-face) 2664 2665 (fontified t face font-lock-comment-face) 2665 2743 (fontified t) 2743 2745 (fontified t face font-lock-comment-delimiter-face) 2745 2746 (fontified t face font-lock-comment-face) 2746 2917 (fontified t) 2917 2920 (fontified t face font-lock-comment-delimiter-face) 2920 2927 (fontified t face font-lock-comment-face) 2927 2947 (fontified t) 2947 2954 (fontified t face font-lock-keyword-face) 2954 2956 (fontified t) 2956 2967 (fontified t face font-lock-constant-face) 2967 2970 (fontified t) 2970 2977 (fontified t face font-lock-keyword-face) 2977 2979 (fontified t) 2979 2987 (fontified t face font-lock-constant-face) 2987 2990 (fontified t) 2990 2992 (fontified t face font-lock-comment-delimiter-face) 2992 2993 (fontified t face font-lock-comment-face) 2993 2994 (fontified t) 2994 2998 (fontified t face font-lock-keyword-face) 2998 3000 (fontified t) 3000 3007 (fontified t face font-lock-keyword-face) 3007 3009 (fontified t) 3009 3017 (fontified t face font-lock-constant-face) 3017 3050 (fontified t) 3050 3052 (fontified t face font-lock-comment-delimiter-face) 3052 3053 (fontified t face font-lock-comment-face) 3053 3055 (fontified t face font-lock-comment-delimiter-face) 3055 3088 (fontified t face font-lock-comment-face) 3088 3092 (fontified t face font-lock-comment-delimiter-face) 3092 3117 (fontified t face font-lock-comment-face) 3117 3118 (fontified t) 3118 3121 (fontified t face font-lock-comment-delimiter-face) 3121 3141 (fontified t face font-lock-comment-face) 3141 3143 (fontified t face font-lock-comment-delimiter-face) 3143 3177 (fontified t face font-lock-comment-face) 3177 3181 (fontified t face font-lock-comment-delimiter-face) 3181 3222 (fontified t face font-lock-comment-face) 3222 3226 (fontified t face font-lock-comment-delimiter-face) 3226 3268 (fontified t face font-lock-comment-face) 3268 3271 (fontified t) 3271 3278 (fontified t face font-lock-keyword-face) 3278 3280 (fontified t) 3280 3297 (fontified t face font-lock-constant-face) 3297 3300 (fontified t) 3300 3307 (fontified t face font-lock-keyword-face) 3307 3309 (fontified t) 3309 3322 (fontified t face font-lock-constant-face) 3322 3325 (fontified t) 3325 3332 (fontified t face font-lock-keyword-face) 3332 3334 (fontified t) 3334 3347 (fontified t face font-lock-constant-face) 3347 3349 (fontified t) 3349 3351 (fontified t face font-lock-comment-delimiter-face) 3351 3352 (fontified t face font-lock-comment-face) 3352 3354 (fontified t face font-lock-comment-delimiter-face) 3354 3374 (fontified t face font-lock-comment-face) 3374 3375 (fontified t) 3375 3382 (fontified t face font-lock-keyword-face) 3382 3384 (fontified t) 3384 3393 (fontified t face font-lock-constant-face) 3393 3396 (fontified t) 3396 3399 (fontified t face font-lock-comment-delimiter-face) 3399 3409 (fontified t face font-lock-comment-face) 3409 3410 (fontified t) 3410 3417 (fontified t face font-lock-keyword-face) 3417 3419 (fontified t) 3419 3428 (fontified t face font-lock-constant-face) 3428 3469 (fontified t) 3469 3479 (fontified t face font-lock-string-face) 3479 3495 (fontified t) 3495 3498 (fontified t face font-lock-comment-delimiter-face) 3498 3508 (fontified t face font-lock-comment-face) 3508 3509 (fontified t) 3509 3516 (fontified t face font-lock-keyword-face) 3516 3518 (fontified t) 3518 3527 (fontified t face font-lock-constant-face) 3527 3568 (fontified t) 3568 3578 (fontified t face font-lock-string-face) 3578 3594 (fontified t) 3594 3597 (fontified t face font-lock-comment-delimiter-face) 3597 3607 (fontified t face font-lock-comment-face) 3607 3610 (fontified t face font-lock-comment-delimiter-face) 3610 3620 (fontified t face font-lock-comment-face) 3620 3621 (fontified t) 3621 3625 (fontified t face font-lock-keyword-face) 3625 3635 (fontified t) 3635 3642 (fontified t face font-lock-keyword-face) 3642 3644 (fontified t) 3644 3652 (fontified t face font-lock-constant-face) 3652 3666 (fontified t) 3666 3673 (fontified t face font-lock-keyword-face) 3673 3675 (fontified t) 3675 3685 (fontified t face font-lock-constant-face) 3685 3692 (fontified t) 3692 3694 (fontified t face font-lock-comment-delimiter-face) 3694 3701 (fontified t face font-lock-comment-face) 3701 3738 (fontified t) 3738 3742 (fontified t face font-lock-comment-delimiter-face) 3742 3784 (fontified t face font-lock-comment-face) 3784 3788 (fontified t face font-lock-comment-delimiter-face) 3788 3837 (fontified t face font-lock-comment-face) 3837 3841 (fontified t face font-lock-comment-delimiter-face) 3841 3885 (fontified t face font-lock-comment-face) 3885 3889 (fontified t face font-lock-comment-delimiter-face) 3889 3937 (fontified t face font-lock-comment-face) 3937 3941 (fontified t face font-lock-comment-delimiter-face) 3941 3966 (fontified t face font-lock-comment-face) 3966 3967 (fontified t) 3967 3971 (fontified t face font-lock-keyword-face) 3971 4005 (fontified t) 4005 4033 (fontified t face font-lock-string-face) 4033 4096 (fontified t)) . -1) (t 20162 . 17999) ((marker . 1) . -3607) ((marker) . -3655) ((marker) . -3655) ((marker) . -3737) ((marker) . -3737) ((marker) . -3885) ((marker) . -3885) ((marker) . -3738) ((marker) . -3738) ((marker) . -3626) ((marker) . -3626) ((marker) . -3620) ((marker) . -3620) ((marker) . -3691) ((marker) . -3691) ((marker) . -3837) ((marker) . -3837) ((marker) . -3688) ((marker) . -3688) ((marker) . -3692) ((marker) . -3692) ((marker) . -3701) ((marker) . -3701) ((marker) . -3982) ((marker) . -3982) ((marker) . -3937) ((marker) . -3937) ((marker) . -3784) ((marker) . -3784) ((marker) . -4036) ((marker) . -4036) ((marker) . -3607) ((marker) . -3607) ((marker . 1) . -4060) ((marker . 1) . -4060) ((marker) . -3972) ((marker) . -3972) ((marker) . -3966) ((marker) . -3966) ((marker*) . 1) ((marker) . -4096) ((marker*) . 36) ((marker) . -4096) ((marker) . -4096) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . 3375) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . 3375) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . 3325) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . 3325) (t 20162 . 17539) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2928) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2928) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2915) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2915) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2872) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2872) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2830) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2830) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2784) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2784) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2747) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2747) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2741) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2741) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2703) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2703) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2666) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2666) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2660) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2660) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2613) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2613) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2586) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2586) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2580) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2580) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2527) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2527) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2499) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2499) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2464) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2464) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2448) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2448) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2418) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2418) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2378) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2378) nil (3415 . 3417) nil (3363 . 3365) (t 20162 . 17389) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2985) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2985) (t 20162 . 17305) nil (2985 . 2987) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . 3413) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . 3413) (t 20162 . 17265) nil (3413 . 3415) (t 20162 . 17056) nil (#("
" 0 1 (fontified t)) . 1961) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . 2985) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . 2985) nil (2985 . 2987) (2965 . 2967) (2950 . 2952) (2905 . 2907) (2861 . 2863) (2813 . 2815) (2774 . 2776) (2766 . 2768) (2726 . 2728) (2687 . 2689) (2679 . 2681) (2630 . 2632) (2601 . 2603) (2593 . 2595) (2538 . 2540) (2508 . 2510) (2471 . 2473) (2453 . 2455) (2421 . 2423) (2379 . 2381) (t 20162 . 16913) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2929) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2929) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2916) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2916) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2873) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2873) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2831) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2831) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2742) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2742) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2787) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2787) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2750) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2750) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2704) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2704) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2667) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2667) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2661) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2661) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2614) nil (2614 . 2615) nil (2614 . 2615) nil (#(" " 0 1 (fontified t)) . 2614) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2614) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2614) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2587) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2587) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2581) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2581) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2528) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2528) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2500) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2500) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2465) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2465) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2449) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2449) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2419) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2419) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2379) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2379) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2377) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2377) (t 20162 . 14777) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . 3366) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . 3366) (t 20162 . 14630) nil (#("." 0 1 (fontified t)) . -1) nil (1 . 2) (t 20162 . 14200) nil (#(" " 0 1 (fontified t)) . 3341) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . -3341) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . -3342) (t 20162 . 14198) nil (3369 . 3371) (t 20162 . 14073) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2342) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2342) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2309) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2309) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2278) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2278) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2237) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2237) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2232) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2232) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2201) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2201) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2152) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2152) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2098) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2098) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2093) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2093) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2064) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2064) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2059) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2059) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2004) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 2004) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 1999) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 1999) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 1963) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 1963) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 1962) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 1962) (t 20162 . 12701) nil (3371 . 3374) (t 20162 . 12647) nil (4132 . 4169) 1 (t 20162 . 11610) nil (#("
" 0 1 (fontified t)) . 3765) nil (#("
" 0 1 (fontified t)) . 3765) nil (#("
" 0 1 (fontified t)) . 3765) nil (#("
" 0 1 (fontified t)) . 3765) nil (#("
" 0 1 (fontified t)) . 3765) nil (#("
" 0 1 (fontified t)) . 3765) nil (#("
" 0 1 (fontified t)) . 3765) nil (#("
" 0 1 (fontified t)) . 3765) nil (#("
" 0 1 (fontified t)) . 3765) nil (#("
" 0 1 (fontified t)) . 3765) nil (#("
" 0 1 (fontified t)) . 3765) nil (#("
" 0 1 (fontified t)) . 3765) nil (#("
" 0 1 (fontified t)) . 3765) nil (3765 . 3766) nil (3765 . 3766) nil (3765 . 3766) nil (3765 . 3766) nil (3765 . 3766) nil (3765 . 3766) nil (3765 . 3766) nil (3765 . 3766) nil (3765 . 3766) nil (3765 . 3766) nil (3765 . 3766) nil (3765 . 3766) nil (3765 . 3766) nil (#("(when (require 'redo+ nil t)
  ;;
  (global-set-key (kbd \"C-'\") 'redo)) ;C-'にredoをわりあてる。

" 0 1 (fontified t) 1 5 (fontified t face font-lock-keyword-face) 5 7 (fontified t) 7 14 (fontified t face font-lock-keyword-face) 14 16 (fontified t) 16 21 (fontified t face font-lock-constant-face) 21 31 (fontified t) 31 33 (fontified t face font-lock-comment-delimiter-face) 33 34 (fontified t face font-lock-comment-face) 34 57 (fontified t) 57 62 (fontified t face font-lock-string-face) 62 72 (fontified t) 72 73 (fontified t face font-lock-comment-delimiter-face) 73 89 (fontified t face font-lock-comment-face) 89 90 (fontified t)) . -1581) nil (#("
" 0 1 (fontified t)) . 1552) nil (#("
" 0 1 (fontified t)) . 1552) nil (#("
" 0 1 (fontified t)) . 1552) (t 20162 . 11523) nil (2457 . 2459) (2422 . 2424) (2389 . 2391) (2346 . 2348) (2339 . 2341) (2306 . 2308) (2255 . 2257) (2199 . 2201) (2192 . 2194) (2161 . 2163) (2154 . 2156) (2097 . 2099) (2090 . 2092) (2052 . 2054) (t 20162 . 11472) nil (#(";; 色の設定
;; 黒い背景に白い文字
;; http://d.hatena.ne.jp/coro_1729/20100218/1266499474
(set-face-foreground 'default \"white\")
(set-face-background 'default \"black\")
(setq frame-background-mode 'dark)
(frame-update-face-colors (selected-frame))
;; 背景をちょっと透過させる
(set-frame-parameter nil 'alpha 90)

;; スクロール量を変更
(setq scroll-conservatively 35
scroll-margin 0
scroll-step 4)

;; Stop Auto Backup
(setq make-backup-files nil)
(setq auto-save-default nil)

;; UTF-8 and Japanese Setting
(set-language-environment 'Japanese)
(set-terminal-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8-unix)

;; ウィンドウサイズ
(setq initial-frame-alist
      (append
       '((top . 22)    ; フレームの Y 位置(ピクセル数)
     (left . 0)    ; フレームの X 位置(ピクセル数)
   (width . 170)    ; フレーム幅(文字数)
    (height . 45)   ; フレーム高(文字数)
    ) initial-frame-alist))
" 0 3 (fontified t face font-lock-comment-delimiter-face) 3 8 (fontified t face font-lock-comment-face) 8 11 (fontified t face font-lock-comment-delimiter-face) 11 21 (fontified t face font-lock-comment-face) 21 24 (fontified t face font-lock-comment-delimiter-face) 24 76 (fontified t face font-lock-comment-face) 76 106 (fontified t) 106 113 (fontified t face font-lock-string-face) 113 145 (fontified t) 145 152 (fontified t face font-lock-string-face) 152 189 (fontified t) 189 233 (fontified t) 233 236 (fontified t face font-lock-comment-delimiter-face) 236 249 (fontified t face font-lock-comment-face) 249 285 (fontified t) 285 286 (fontified t) 286 289 (fontified t face font-lock-comment-delimiter-face) 289 299 (fontified t face font-lock-comment-face) 299 330 (fontified t) 330 362 (fontified t) 362 365 (fontified t face font-lock-comment-delimiter-face) 365 382 (fontified t face font-lock-comment-face) 382 441 (fontified t) 441 444 (fontified t face font-lock-comment-delimiter-face) 444 471 (fontified t face font-lock-comment-face) 471 508 (fontified t) 508 544 (fontified t) 544 814 (fontified t) 814 817 (fontified t face font-lock-comment-delimiter-face) 817 826 (fontified t face font-lock-comment-face) 826 889 (fontified t) 889 891 (fontified t face font-lock-comment-delimiter-face) 891 909 (fontified t face font-lock-comment-face) 909 928 (fontified t) 928 930 (fontified t face font-lock-comment-delimiter-face) 930 948 (fontified t face font-lock-comment-face) 948 968 (fontified t) 968 970 (fontified t face font-lock-comment-delimiter-face) 970 981 (fontified t face font-lock-comment-face) 981 1001 (fontified t) 1001 1003 (fontified t face font-lock-comment-delimiter-face) 1003 1014 (fontified t face font-lock-comment-face) 1014 1042 (fontified t)) . -1554) (t 20162 . 11432) nil (#(";; 左側に行数表示
;; linum.el
;; show line and column number
(require 'linum)

(setq linum-format \"%5d\")
(global-linum-mode t)      ; デフォルトで linum-mode を有効にする
(setq line-number-mode t)  ; ステータスバーに行数を表示
" 0 3 (fontified t face font-lock-comment-delimiter-face) 3 11 (fontified t face font-lock-comment-face) 11 14 (fontified t face font-lock-comment-delimiter-face) 14 23 (fontified t face font-lock-comment-face) 23 26 (fontified t face font-lock-comment-delimiter-face) 26 54 (fontified t face font-lock-comment-face) 54 55 (fontified t) 55 62 (fontified t face font-lock-keyword-face) 62 64 (fontified t) 64 69 (fontified t face font-lock-constant-face) 69 91 (fontified t) 91 96 (fontified t face font-lock-string-face) 96 125 (fontified t) 125 127 (fontified t face font-lock-comment-delimiter-face) 127 152 (fontified t face font-lock-comment-face) 152 179 (fontified t) 179 181 (fontified t face font-lock-comment-delimiter-face) 181 195 (fontified t face font-lock-comment-face)) . -1553) nil (#(";;タブをスペースに
(setq-default tab-width 2 indent-tabs-mode nil)
" 0 2 (fontified t face font-lock-comment-delimiter-face) 2 11 (fontified t face font-lock-comment-face) 11 59 (fontified t)) . -1552) nil (#(";; スタートアップメッセージを非表示
(setq inhibit-startup-message t)
;; バッテリ残量表示
(display-battery-mode t)
" 0 3 (fontified t face font-lock-comment-delimiter-face) 3 20 (fontified t face font-lock-comment-face) 20 53 (fontified t) 53 56 (fontified t face font-lock-comment-delimiter-face) 56 65 (fontified t face font-lock-comment-face) 65 90 (fontified t)) . -1552) nil (#("
" 0 1 (fontified t)) . -1641) (t 20162 . 11315) nil (4462 . 4463) nil (#(" " 0 1 (fontified t)) . 4463) nil (#("
" 0 1 (fontified t)) . 4487) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . 4463) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . 4463) nil (4488 . 4489) nil (4463 . 4466) (4443 . 4446) (4428 . 4431) (4383 . 4386) (4339 . 4342) (4291 . 4294) (4252 . 4255) (4244 . 4247) (4204 . 4207) (4165 . 4168) (4157 . 4160) (4108 . 4111) (4079 . 4082) (4071 . 4074) (4016 . 4019) (3986 . 3989) (3949 . 3952) (3931 . 3934) (3899 . 3902) (3857 . 3860) (3853 . 3856) nil (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 3853) (3856 . 3872) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 3856) (3881 . 3890) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 3881) (3903 . 3917) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 3903) (3906 . 3922) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 3906) (3926 . 3942) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 3926) (3939 . 3955) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 3939) (3977 . 3981) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 3977) (3980 . 3996) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 3980) (3992 . 4001) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 3992) (4031 . 4035) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 4031) (4034 . 4050) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 4034) (4056 . 4072) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 4056) (4079 . 4083) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 4079) (4082 . 4098) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 4082) (4104 . 4120) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 4104) (4135 . 4151) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 4135) (4162 . 4178) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 4162) (4190 . 4201) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 4190) (4193 . 4209) (#(";;" 0 2 (face font-lock-comment-delimiter-face fontified t)) . 4193) nil (4193 . 4195) (#("  (migemo-init))" 0 16 (fontified t)) . -4193) (4190 . 4192) (#("  ;; migemo" 0 2 (fontified t) 2 5 (face font-lock-comment-delimiter-face fontified t) 5 11 (face font-lock-comment-face fontified t)) . -4190) (4162 . 4164) (#("  (setq migemo-c" 0 16 (fontified t)) . -4162) (4135 . 4137) (#("  (setq migemo-p" 0 16 (fontified t)) . -4135) (4104 . 4106) (#("  (setq migemo-u" 0 16 (fontified t)) . -4104) (4082 . 4084) (#("  (setq migemo-u" 0 16 (fontified t)) . -4082) (4079 . 4081) (#("  ;;" 0 2 (fontified t) 2 4 (face font-lock-comment-delimiter-face fontified t)) . -4079) (4056 . 4058) (#("  (setq migemo-r" 0 16 (fontified t)) . -4056) (4034 . 4036) (#("  (setq migemo-u" 0 16 (fontified t)) . -4034) (4031 . 4033) (#("  ;;" 0 2 (fontified t) 2 4 (face font-lock-comment-delimiter-face fontified t)) . -4031) (3992 . 3994) (#("	\"/usr/lo" 0 1 (fontified t) 1 9 (face font-lock-string-face fontified t)) . -3992) (3980 . 3982) (#("  (setq migemo-d" 0 16 (fontified t)) . -3980) (3977 . 3979) (#("  ;;" 0 2 (fontified t) 2 4 (face font-lock-comment-delimiter-face fontified t)) . -3977) (3939 . 3941) (#("  (setq migemo-o" 0 16 (fontified t)) . -3939) (3926 . 3928) (#("  ;; Migemo Comm" 0 2 (fontified t) 2 5 (face font-lock-comment-delimiter-face fontified t) 5 16 (face font-lock-comment-face fontified t)) . -3926) (3906 . 3908) (#("  (setq migemo-c" 0 16 (fontified t)) . -3906) (3903 . 3905) (#("  ;;cmigemoを使う" 0 2 (fontified t) 2 4 (face font-lock-comment-delimiter-face fontified t) 4 14 (face font-lock-comment-face fontified t)) . -3903) (3881 . 3883) (#("	   (requ" 0 5 (fontified t) 5 9 (face font-lock-keyword-face fontified t)) . -3881) (3856 . 3858) (#("(when (and (exec" 0 1 (fontified t) 1 5 (face font-lock-keyword-face fontified t) 5 16 (fontified t)) . -3856) (3853 . 3855) nil (#("
" 0 1 (fontified t)) . -4402) (t 20162 . 11149) nil (1678 . 1679) nil (#("8" 0 1 (fontified t)) . 1678) nil (1701 . 1702) nil (nil rear-nonsticky nil 1700 . 1701) (nil fontified nil 1643 . 1701) (1643 . 1701) nil (1642 . 1643) (t 20028 . 45009) nil (#("nn" 0 2 (fontified nil)) . -4387) nil (4387 . 4389) (t 20027 . 44186)))
