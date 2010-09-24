;; load-pathの設定
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; elispとconfディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path "elisp" "conf")

;; Pathを設定
(add-to-list 'exec-path "/opt/local/bin")
(add-to-list 'exec-path "/usr/local/bin")

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
                    (let ((file "/proc/modules"))
                      (and
                       (file-readable-p file)
                       (x->bool
                        (with-temp-buffer
                          (insert-file-contents file)
                          (goto-char (point-min))
                          (re-search-forward "^cofuse\.+" nil t)))))))
(defvar cygwin-p (eq system-type 'cygwin))
(defvar nt-p (eq system-type 'windows-nt))
(defvar meadow-p (featurep 'meadow))
(defvar windows-p (or cygwin-p nt-p meadow-p))

(require 'init-autoinstall)

(when (require 'redo+ nil t)
  ;;
  (global-set-key (kbd "C-'") 'redo)) ;C-'にredoをわりあてる。



(when (require 'color-theme nil t)
  (color-theme-initialize)
  (color-theme-hober))

;;(setq face-font-rescale-alist
;;      '((".*Menlo.*" . 1.0)
;;	 (" .*Hiragino_Mincho_ProN.*" . 1.3)
;;	 (".*nfmotoyacedar-bold.*" . 1.3)
;;	 (".*nfmotoyacedar-medium.*" . 1.3)
;;	 ("-cdac$" . 1.4)))


(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))


;;
(when (require 'color-moccur nil t)
  ;;
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  ;;
  (setq moccur-split-word t)
  ;;
  (add-to-list 'dmoccur-exclusion-mask "¥¥.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  (require 'moccur-edit nil t)
  ;;
  (when (and (executable-find "cmigemo")
	     (require 'migemo nil t))
    (setq moccur-use-migemo t)))

;; grep-edit
(require 'grep-edit)

(when (and (executable-find "cmigemo")
	   (require 'migemo nil t))
  ;;cmigemoを使う
  (setq migemo-command "cmigemo")
  ;; Migemo Command Option
  (setq migemo-options '("-q" "--emacs" "-i" "¥a"))
  ;;
  (setq migemo-dictionary
	"/usr/local/share/migemo/utf-8/migemo-dict")
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

(require 'init-egg)

;; 環境依存をロード
;; 環境依存をロード
(cond
 (mac-p (require 'init-mac))
 (linux-p (require 'init-linux))
 )



;;終了時に聞く
(setq confirm-kill-emacs 'y-or-n-p)
