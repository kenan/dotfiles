;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;; http://openlab.ring.gr.jp/skk/skk-manual/skk-manual-ja_2.html#SEC4


;; http://googlewhacks.blogspot.com/2008/01/migemo.html


;; SKK
(add-to-list 'load-path "~/.emacs.d/elisp/skk")
(require 'skk-autoloads)

;; Off AquaSKK
(setq mac-pass-control-to-system nil)


(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)

(setq skk-large-jisyo "~/SKK-JISYO.L")

 	
;; SKK使用時のインクリメント検索用設定
;; http://openlab.jp/skk/skk-manual/skk-manual-ja_3.html#SEC7
(add-hook 'isearch-mode-hook
          #'(lambda ()
              (when (and (boundp 'skk-mode)
                         skk-mode
                         skk-isearch-mode-enable)
                (skk-isearch-mode-setup))))
(add-hook 'isearch-mode-end-hook
          #'(lambda ()
              (when (and (featurep 'skk-isearch)
                         skk-isearch-mode-enable)
                (skk-isearch-mode-cleanup))))

;;
;; C-j の機能を別のキーに割り当て
(global-set-key (kbd "C-m") 'newline-and-indent)
;; C-\ でも SKK に切り替えられるように設定
(setq default-input-method "japanese-skk")
;; 送り仮名が厳密に正しい候補を優先して表示
(setq skk-henkan-strict-okuri-precedence t)
;;漢字登録時、送り仮名が厳密に正しいかをチェック
(setq skk-check-okurigana-on-touroku t)

;; localskksrvと連携
;; macの場合skk serverを見に行く
(setq skk-server-host "localhost")
(setq skk-server-portnum 1178)

;; メッセージは日本語で
(setq skk-japanese-message-and-error t)

;; "「"を入力したら"」"も自動で挿入
(setq skk-auto-insert-paren t)

(provide 'init-skk)
