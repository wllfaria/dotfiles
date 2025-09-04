;;; init.el --- my dotfiles -*- lexical-binding: t; -*-

;;; Commentary:

(require 'package)
(require 'use-package)
(require 'which-key)

;;; Code:

(setq package-archives '(
  ("melpa" . "https://melpa.org/packages/")
  ("gnu"   . "https://elpa.gnu.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(load-theme 'lackluster t)

(use-package magit :ensure t)
(use-package rust-mode :ensure t)
(use-package ag :ensure t)
(use-package no-littering :ensure t)
(use-package rainbow-mode :ensure t)

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  :init
  (setq evil-want-keybinding nil))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package company
  :ensure t
  :config
  (global-company-mode 1)
  :init
  (setq company-idle-delay 0.2))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package vertico
  :ensure t
  :init
  (vertico-mode +1))

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
    ("s-p" . projectile-command-map)
    ("C-c p" . projectile-command-map)))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-format-buffer-on-save t)
  :hook
    ((rust-mode . lsp)
    (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-position 'at-point)
  (setq lsp-ui-doc-alignment 'window)
  (setq lsp-ui-doc-delay 150)
  (setq lsp-headerline-breadcrumb-enable nil))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package deadgrep
  :ensure t
  :init
  (global-set-key (kbd "C-g") #'deadgrep))

(use-package dired
  :ensure nil
  :bind (:map evil-normal-state-map
    ("-" . dired-jump)))

(setq help-window-select t)
(setq split-width-threshold 1)
(setq split-height-threshold nil)

(setq initial-buffer-choice
  (lambda ()
    (dired default-directory)))

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(add-to-list 'display-buffer-alist
  '("\\*Help\\*"
    (display-buffer-in-side-window)
    (side . right)))

(with-eval-after-load 'lsp-ui
  (evil-define-key 'normal lsp-mode-map
    "K" #'lsp-describe-thing-at-point))

(setq which-key-idle-delay 0.3
  which-key-separator " → "
  which-key-prefix-prefix "+")

(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq scroll-margin 8)
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)
(setq hscroll-step 1)
(setq hscroll-margin 1)
(setq dired-listing-switches "-alh --group-directories-first")

(evil-define-key 'normal 'global (kbd "<leader>y") (kbd "\"+y"))
(evil-define-key 'visual 'global (kbd "<leader>y") (kbd "\"+y"))

(use-package xclip
  :ensure t
  :config (xclip-mode 1))

(setq make-backup-files nil)
(setq eldoc-idle-delay 0.0)
(make-directory (expand-file-name "tmp/auto-saves/" user-emacs-directory) t)
(setq auto-save-list-file-prefix (expand-file-name "tmp/auto-saves/sessions/" user-emacs-directory)
  auto-save-file-name-transforms `((".*" ,(expand-file-name "tmp/auto-saves/" user-emacs-directory) t)))
(setq create-lockfiles nil)
(setq projectile-known-projects-file (expand-file-name "tmp/projectile-bookmarks.eld" user-emacs-directory)
  lsp-session-file (expand-file-name "tmp/.lsp-session-v1" user-emacs-directory))
(setq user-emacs-directory (expand-file-name "~/.cache/emacs"))

(set-display-table-slot standard-display-table 0 ?\ )
(which-key-setup-side-window-bottom)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d85dd53b264f5d3e47bb48dcb4dfba5fe8453c7b99e19a706345957fab0d6771"
     "38408d940162dc708efd8246d736c02704850605a6d5dab60565415527307bff"
     "a840a177246de2381ea20287fb288e7330346ed6c9b391ee903724e6324510f3"
     "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     "b8bd60a23b9e2f08b0c437231ee84f2dacc70fdc4d5a0fb87229bb9926273fdd"
     default))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
