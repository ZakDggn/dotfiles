;;; -*- lexical-binding: t -*-
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq inhibit-startup-screen t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(defun my/package-install (package)
  (unless (package-installed-p package)
    (package-install package)))

;; Keep directories clean
(setq backup-directory-alist `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory))))
(make-directory (expand-file-name "tmp/auto-saves/" user-emacs-directory) t)
(setq auto-save-list-file-prefix (expand-file-name "tmp/auto-saves/sessions/" user-emacs-directory)
      auto-save-file-name-transforms `((".*" ,(expand-file-name "tmp/auto-saves/" user-emacs-directory) t)))

;; Write customizations to a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

;; Theme
(my/package-install 'doom-themes)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(load-theme 'doom-one t)
(doom-themes-visual-bell-config)
(doom-themes-org-config)

;; Fonts
(set-face-attribute 'default nil :family "Iosevka Fixed" :height 120 :width 'expanded :weight 'semi-bold)
(set-face-attribute 'bold nil :weight 'heavy)
(set-face-attribute 'fixed-pitch nil :family "Iosevka Fixed")
(set-face-attribute 'fixed-pitch-serif nil :family 'unspecified :inherit 'fixed-pitch)
(set-face-attribute 'variable-pitch nil :family "Iosevka Aile")

;; Doom modeline
(my/package-install 'doom-modeline)
(doom-modeline-mode 1)
(set-face-attribute 'doom-modeline nil :weight 'normal)

;; Show trailing whitespace
(dolist (hook '(conf-mode-hook prog-mode-hook text-mode-hook))
  (add-hook hook (lambda () (setq show-trailing-whitespace t))))

;; Add a newline automatically at the end of a file while saving
(setq require-final-newline t)

;; Use spaces, not tabs, for indentation
(setq-default indent-tabs-mode nil)

;; Key bindings
(global-set-key (kbd "M-o") 'other-window)

;; Miscellaneous
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(setq calendar-week-start-day 1)

;; SLIME
(my/package-install 'slime)
(setq inferior-lisp-program "sbcl")

;; Paredit
(my/package-install 'paredit)
(dolist (hook '(emacs-lisp-mode-hook
                eval-expression-minibuffer-setup-hook
                ielm-mode-hook
                lisp-interaction-mode-hook
                lisp-mode-hook
                slime-repl-mode-hook))
  (add-hook hook 'enable-paredit-mode))
(require 'paredit)
(defun override-slime-del-key ()
  (define-key slime-repl-mode-map
              (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-del-key)
(define-key paredit-mode-map (kbd "RET") nil)
