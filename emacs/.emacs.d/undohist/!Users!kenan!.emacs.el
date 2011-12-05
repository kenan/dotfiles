
((digest . "d41d8cd98f00b204e9800998ecf8427e") (undo-list nil (#(";; スタートアップメッセージを非表示
(setq inhibit-startup-message t)

(add-to-list 'load-path \"~/.emacs.d/\")

;; バッテリ残量表示
;; 
(display-battery-mode t)

;; 左側に行数表示
;; linum.el
(require 'linum)

(setq linum-format \"%5d\")
(global-linum-mode t)      ; デフォルトで linum-mode を有効にする
(setq line-number-mode t)  ; ステータスバーに行数を表示

;; 色の設定
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

(load \"init\")

(require 'rvm)
(rvm-use-default)
" 0 3 (fontified t face font-lock-comment-delimiter-face) 3 19 (fontified t face font-lock-comment-face) 19 20 (fontified t face font-lock-comment-face) 20 53 (fontified t) 53 54 (fontified t) 54 78 (fontified t) 78 91 (fontified t face font-lock-string-face) 91 94 (fontified t) 94 97 (fontified t face font-lock-comment-delimiter-face) 97 106 (fontified t face font-lock-comment-face) 106 109 (fontified t face font-lock-comment-delimiter-face) 109 110 (fontified t face font-lock-comment-face) 110 136 (fontified t) 136 139 (fontified t face font-lock-comment-delimiter-face) 139 147 (fontified t face font-lock-comment-face) 147 150 (fontified t face font-lock-comment-delimiter-face) 150 159 (fontified t face font-lock-comment-face) 159 160 (fontified t) 160 167 (fontified t face font-lock-keyword-face) 167 169 (fontified t) 169 174 (fontified t face font-lock-constant-face) 174 196 (fontified t) 196 201 (fontified t face font-lock-string-face) 201 230 (fontified t) 230 232 (fontified t face font-lock-comment-delimiter-face) 232 257 (fontified t face font-lock-comment-face) 257 284 (fontified t) 284 286 (fontified t face font-lock-comment-delimiter-face) 286 300 (fontified t face font-lock-comment-face) 300 301 (fontified t) 301 304 (fontified t face font-lock-comment-delimiter-face) 304 309 (fontified t face font-lock-comment-face) 309 312 (fontified t face font-lock-comment-delimiter-face) 312 322 (fontified t face font-lock-comment-face) 322 325 (fontified t face font-lock-comment-delimiter-face) 325 377 (fontified t face font-lock-comment-face) 377 407 (fontified t) 407 414 (fontified t face font-lock-string-face) 414 446 (fontified t) 446 453 (fontified t face font-lock-string-face) 453 534 (fontified t) 534 537 (fontified t face font-lock-comment-delimiter-face) 537 550 (fontified t face font-lock-comment-face) 550 586 (fontified t) 586 587 (fontified t) 587 590 (fontified t face font-lock-comment-delimiter-face) 590 600 (fontified t face font-lock-comment-face) 600 663 (fontified t) 663 666 (fontified t face font-lock-comment-delimiter-face) 666 693 (fontified t face font-lock-comment-face) 693 1035 (fontified t) 1035 1042 (fontified t) 1042 1048 (fontified t face font-lock-string-face) 1048 1052 (fontified t) 1052 1059 (fontified t face font-lock-keyword-face) 1059 1061 (fontified t) 1061 1064 (fontified t face font-lock-constant-face) 1064 1084 (fontified t)) . -1) ((marker . 518) . -106) nil (#("
" 0 1 (fontified t face font-lock-comment-face)) . -20) nil (21 . 22) (t 20015 . 49105) nil (nil rear-nonsticky nil 1035 . 1036) (nil fontified nil 694 . 1036) (nil fontified nil 667 . 694) (nil fontified nil 664 . 667) (664 . 1036) nil (663 . 664) (t 20005 . 17850) nil (662 . 663) (#(" " 0 1 (fontified t rear-nonsticky t)) . 662) 663 nil (nil rear-nonsticky nil 662 . 663) (nil fontified nil 588 . 663) (588 . 663) nil (587 . 588) (t 19998 . 31298) nil (nil rear-nonsticky nil 635 . 636) (nil fontified nil 603 . 636) (603 . 636) nil (602 . 603) nil (601 . 602) (t 19998 . 31154)))
