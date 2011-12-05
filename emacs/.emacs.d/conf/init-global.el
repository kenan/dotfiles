;; Mac
(require 'ucs-normalize)
;;(prefer-coding-system 'utf-8-hfs)
;;(setq file-name-coding-system 'utf-8-hfs)
;;(setq locale-coding-system 'utf-8-hfs)
;; UTF-8 and Japanese Setting
(set-language-environment 'Japanese)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8)

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

;;タブをスペースに
(setq-default tab-width 2 indent-tabs-mode nil)

(setq ns-command-modifier (quote meta))

(setq ns-alternate-modifier (quote super))

;; バッテリー残量の表示
(display-battery-mode 1)

;; 左側に行数表示
;; linum.el
;; show line and column number
(require 'linum)

(setq linum-format "%5d")
(global-linum-mode t)      ; デフォルトで linum-mode を有効にする
(setq line-number-mode t)  ; ステータスバーに行数を表示

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


(when (require 'redo+ nil t)
  ;;
  (global-set-key (kbd "C-'") 'redo)) ;C-'にredoをわりあてる。


;; helpの変更(Control-0)
(global-set-key [?\C-0] 'help-command)
(global-set-key [?\C-0 ?\C-0] 'help-for-help)
;;
;;(global-set-key (kdb "C-x ?") 'help-command)

;; 色の設定
;; 黒い背景に白い文字
;; http://d.hatena.ne.jp/coro_1729/20100218/1266499474
(set-face-foreground 'default "white")
(set-face-background 'default "black")
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


;; ウィンドウサイズ
(setq initial-frame-alist
      (append
       '((top . 22)    ; フレームの Y 位置(ピクセル数)
     (left . 0)    ; フレームの X 位置(ピクセル数)
   (width . 170)    ; フレーム幅(文字数)
    (height . 45)   ; フレーム高(文字数)
    ) initial-frame-alist))


(provide 'init-global)
