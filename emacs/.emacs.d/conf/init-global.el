

;; Mac
(set-language-environment "Japanese")
(require 'ucs-normalize)
(prefer-coding-system 'utf-8-hfs)
(setq file-name-coding-system 'utf-8-hfs)
(setq locale-coding-system 'utf-8-hfs)

;;(prefer-coding-system 'utf-8)
;;(setq file-name-coding-system 'utf-8)
;;(setq locale-coding-system 'utf-8)

;; スタートアップページを表示しない
(setq inhibit-startup-screen t)

;; scratch のメッセージを空にする
(setq initial-scratch-message nil)

;; ツールバーを非表示
(tool-bar-mode 0)
;; スクロールバーを非表示
(scroll-bar-mode 0)
;; メニューバーの非表示
(menu-bar-mode 0)

;; 時間を表示
(display-time-mode 1)
;; 行、列の表示
(column-number-mode t)
(line-number-mode t)
(global-linum-mode)

;; バッテリー残量の表示
(display-battery-mode 1)


;;(setq frame-title-format
;;     (format "%%f - Emacs@%s" (system-name)))

;; カレントウィンドウの透明度を変更する (85%)
(set-frame-parameter (selected-frame) 'alpha '(85 50))
;; (set-frame-parameter nil 'alpha 90)

;;対応する括弧を強調して表示する
(setq show-paren-delay 0)
(show-paren-mode t)
;; expressionは括弧内も強調する
(setq show-paren-style 'expression)
;;
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")

;;
;;(keyboard-translate ¥C-h ¥C-?)
(global-set-key "\C-h" 'delete-backward-char)

;; helpの変更(Control-0)
(global-set-key [?\C-0] 'help-command)
(global-set-key [?\C-0 ?\C-0] 'help-for-help)
;;
;;(global-set-key (kdb "C-x ?") 'help-command)

(provide 'init-global)
