;;; lackluster-theme.el --- Lackluster color theme for Emacs 24. -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(deftheme lackluster
  "Lackluster color theme for Emacs.")

;; Please, install rainbow-mode.
;; Colors with +x are lighter. Colors with -x are darker.
(let ((lackluster-fg        "#DDDDDD")
      (lackluster-fg+1      "#cccccc")
      (lackluster-fg+2      "#aaaaaa")
      (lackluster-white     "#deeeed")
      (lackluster-black     "#000000")
      (lackluster-bg-1      "#101010")
      (lackluster-bg        "#191919")
      (lackluster-bg+1      "#1A1A1A")
      (lackluster-bg+2      "#242424")
      (lackluster-bg+3      "#505050")
      (lackluster-bg+4      "#3A3A3A")
      (lackluster-red-1     "#D70000")
      (lackluster-red       "#D70000")
      (lackluster-red+1     "#ffaa88")
      (lackluster-green     "#789978")
      (lackluster-yellow    "#abab77")
      (lackluster-brown     "#ffaa88")
      (lackluster-quartz    "#7788AA")
      (lackluster-niagara-2 "#666666")
      (lackluster-niagara-1 "#8E8E8E")
      (lackluster-niagara   "#96a6c8")
      (lackluster-wisteria  "#9e95c7")
      )
  (custom-theme-set-variables
   'lackluster
   '(frame-background-mode (quote dark)))

  (custom-theme-set-faces
   'lackluster

   ;; Basic Coloring (or Uncategorized)
   `(border ((t ,(list :background lackluster-bg
                       :foreground lackluster-bg+2))))
   `(cursor ((t (:background ,lackluster-yellow))))
   `(default ((t ,(list :foreground lackluster-fg
                        :background lackluster-bg-1))))
   `(fringe ((t ,(list :background nil
                       :foreground lackluster-bg+2))))
   `(vertical-border ((t ,(list :foreground lackluster-bg+2))))
   `(link ((t (:foreground ,lackluster-niagara :underline t))))
   `(link-visited ((t (:foreground ,lackluster-wisteria :underline t))))
   `(match ((t (:background ,lackluster-bg+4))))
   `(shadow ((t (:foreground ,lackluster-bg+4))))
   `(minibuffer-prompt ((t (:foreground ,lackluster-niagara))))
   `(region ((t (:background ,lackluster-bg+3 :foreground nil))))
   `(secondary-selection ((t ,(list :background lackluster-bg+3
                                    :foreground nil))))
   `(trailing-whitespace ((t ,(list :foreground lackluster-black
                                    :background lackluster-red))))
   `(tooltip ((t ,(list :background lackluster-bg+4
                        :foreground lackluster-white))))

   ;; Compilation
   `(compilation-info ((t ,(list :foreground lackluster-green
                                 :inherit `unspecified))))
   `(compilation-warning ((t ,(list :foreground lackluster-brown
                                    :bold t
                                    :inherit `unspecified))))
   `(compilation-error ((t (:foreground ,lackluster-red+1))))
   `(compilation-mode-line-fail ((t ,(list :foreground lackluster-red
                                           :weight `bold
                                           :inherit `unspecified))))
   `(compilation-mode-line-exit ((t ,(list :foreground lackluster-green
                                           :weight `bold
                                           :inherit `unspecified))))

   ;; Completion
   `(completions-annotations ((t (:inherit 'shadow))))

   ;; Custom
   `(custom-state ((t (:foreground ,lackluster-green))))

   ;; Diff
   `(diff-removed ((t ,(list :foreground lackluster-red+1
                             :background nil))))
   `(diff-added ((t ,(list :foreground lackluster-green
                           :background nil))))

   ;; Dired
   `(dired-directory ((t (:foreground ,lackluster-niagara :weight bold))))
   `(dired-ignored ((t ,(list :foreground lackluster-quartz
                              :inherit `unspecified))))

   ;; Ebrowse
   `(ebrowse-root-class ((t (:foreground ,lackluster-niagara :weight bold))))
   `(ebrowse-progress ((t (:background ,lackluster-niagara))))

   ;; Egg
   `(egg-branch ((t (:foreground ,lackluster-yellow))))
   `(egg-branch-mono ((t (:foreground ,lackluster-yellow))))
   `(egg-diff-add ((t (:foreground ,lackluster-green))))
   `(egg-diff-del ((t (:foreground ,lackluster-red))))
   `(egg-diff-file-header ((t (:foreground ,lackluster-wisteria))))
   `(egg-help-header-1 ((t (:foreground ,lackluster-yellow))))
   `(egg-help-header-2 ((t (:foreground ,lackluster-niagara))))
   `(egg-log-HEAD-name ((t (:box (:color ,lackluster-fg)))))
   `(egg-reflog-mono ((t (:foreground ,lackluster-niagara-1))))
   `(egg-section-title ((t (:foreground ,lackluster-yellow))))
   `(egg-text-base ((t (:foreground ,lackluster-fg))))
   `(egg-term ((t (:foreground ,lackluster-yellow))))

   ;; ERC
   `(erc-notice-face ((t (:foreground ,lackluster-wisteria))))
   `(erc-timestamp-face ((t (:foreground ,lackluster-green))))
   `(erc-input-face ((t (:foreground ,lackluster-red+1))))
   `(erc-my-nick-face ((t (:foreground ,lackluster-red+1))))

   ;; EShell
   `(eshell-ls-backup ((t (:foreground ,lackluster-quartz))))
   `(eshell-ls-directory ((t (:foreground ,lackluster-niagara))))
   `(eshell-ls-executable ((t (:foreground ,lackluster-green))))
   `(eshell-ls-symlink ((t (:foreground ,lackluster-yellow))))

   ;; Font Lock
   `(font-lock-builtin-face ((t (:foreground ,lackluster-yellow))))
   `(font-lock-comment-face ((t (:foreground ,lackluster-brown))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,lackluster-brown))))
   `(font-lock-constant-face ((t (:foreground ,lackluster-quartz))))
   `(font-lock-doc-face ((t (:foreground ,lackluster-green))))
   `(font-lock-doc-string-face ((t (:foreground ,lackluster-green))))
   `(font-lock-function-name-face ((t (:foreground ,lackluster-niagara))))
   `(font-lock-keyword-face ((t (:foreground ,lackluster-yellow :bold t))))
   `(font-lock-preprocessor-face ((t (:foreground ,lackluster-quartz))))
   `(font-lock-reference-face ((t (:foreground ,lackluster-quartz))))
   `(font-lock-string-face ((t (:foreground ,lackluster-green))))
   `(font-lock-type-face ((t (:foreground ,lackluster-quartz))))
   `(font-lock-variable-name-face ((t (:foreground ,lackluster-fg+1))))
   `(font-lock-warning-face ((t (:foreground ,lackluster-red))))

   ;; Flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,lackluster-red)
                   :foreground unspecified
                   :background unspecified
                   :inherit unspecified))
      (t (:foreground ,lackluster-red :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,lackluster-yellow)
                   :foreground unspecified
                   :background unspecified
                   :inherit unspecified))
      (t (:forground ,lackluster-yellow :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,lackluster-green)
                   :foreground unspecified
                   :background unspecified
                   :inherit unspecified))
      (t (:forground ,lackluster-green :weight bold :underline t))))

   ;; Flyspell
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,lackluster-red) :inherit unspecified))
      (t (:foreground ,lackluster-red :weight bold :underline t))))
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,lackluster-yellow) :inherit unspecified))
      (t (:foreground ,lackluster-yellow :weight bold :underline t))))

   ;; Helm
   `(helm-candidate-number ((t ,(list :background lackluster-bg+2
                                      :foreground lackluster-yellow
                                      :bold t))))
   `(helm-ff-directory ((t ,(list :foreground lackluster-niagara
                                  :background lackluster-bg
                                  :bold t))))
   `(helm-ff-executable ((t (:foreground ,lackluster-green))))
   `(helm-ff-file ((t (:foreground ,lackluster-fg :inherit unspecified))))
   `(helm-ff-invalid-symlink ((t ,(list :foreground lackluster-bg
                                        :background lackluster-red))))
   `(helm-ff-symlink ((t (:foreground ,lackluster-yellow :bold t))))
   `(helm-selection-line ((t (:background ,lackluster-bg+1))))
   `(helm-selection ((t (:background ,lackluster-bg+1 :underline nil))))
   `(helm-source-header ((t ,(list :foreground lackluster-yellow
                                   :background lackluster-bg
                                   :box (list :line-width -1
                                              :style `released-button)))))

   ;; Ido
   `(ido-first-match ((t (:foreground ,lackluster-yellow :bold nil))))
   `(ido-only-match ((t (:foreground ,lackluster-brown :weight bold))))
   `(ido-subdir ((t (:foreground ,lackluster-niagara :weight bold))))

   ;; Info
   `(info-xref ((t (:foreground ,lackluster-niagara))))
   `(info-visited ((t (:foreground ,lackluster-wisteria))))

   ;; Jabber
   `(jabber-chat-prompt-foreign ((t ,(list :foreground lackluster-quartz
                                           :bold nil))))
   `(jabber-chat-prompt-local ((t (:foreground ,lackluster-yellow))))
   `(jabber-chat-prompt-system ((t (:foreground ,lackluster-green))))
   `(jabber-rare-time-face ((t (:foreground ,lackluster-green))))
   `(jabber-roster-user-online ((t (:foreground ,lackluster-green))))
   `(jabber-activity-face ((t (:foreground ,lackluster-red))))
   `(jabber-activity-personal-face ((t (:foreground ,lackluster-yellow :bold t))))

   ;; Line Highlighting
   `(highlight ((t (:background ,lackluster-bg+1 :foreground nil))))
   `(highlight-current-line-face ((t ,(list :background lackluster-bg+1
                                            :foreground nil))))

   ;; line numbers
   `(line-number ((t (:inherit default :foreground ,lackluster-bg+4))))
   `(line-number-current-line ((t (:inherit line-number :foreground ,lackluster-yellow))))

   ;; Linum
   `(linum ((t '(list :foreground lackluster-quartz
                      :background lackluster-bg))))

   ;; Magit
   `(magit-branch ((t (:foreground ,lackluster-niagara))))
   `(magit-diff-hunk-header ((t (:background ,lackluster-bg+2))))
   `(magit-diff-file-header ((t (:background ,lackluster-bg+4))))
   `(magit-log-sha1 ((t (:foreground ,lackluster-red+1))))
   `(magit-log-author ((t (:foreground ,lackluster-brown))))
   `(magit-log-head-label-remote ((t ,(list :foreground lackluster-green
                                            :background lackluster-bg+1))))
   `(magit-log-head-label-local ((t ,(list :foreground lackluster-niagara
                                           :background lackluster-bg+1))))
   `(magit-log-head-label-tags ((t ,(list :foreground lackluster-yellow
                                          :background lackluster-bg+1))))
   `(magit-log-head-label-head ((t ,(list :foreground lackluster-fg
                                          :background lackluster-bg+1))))
   `(magit-item-highlight ((t (:background ,lackluster-bg+1))))
   `(magit-tag ((t ,(list :foreground lackluster-yellow
                          :background lackluster-bg))))
   `(magit-blame-heading ((t ,(list :background lackluster-bg+1
                                    :foreground lackluster-fg))))

   ;; Message
   `(message-header-name ((t (:foreground ,lackluster-green))))

   ;; Mode Line
   `(mode-line ((t ,(list :background lackluster-bg+1
                          :foreground lackluster-white))))
   `(mode-line-buffer-id ((t ,(list :background lackluster-bg+1
                                    :foreground lackluster-white))))
   `(mode-line-inactive ((t ,(list :background lackluster-bg+1
                                   :foreground lackluster-quartz))))

   ;; Neo Dir
   `(neo-dir-link-face ((t (:foreground ,lackluster-niagara))))

   ;; Org Mode
   `(org-agenda-structure ((t (:foreground ,lackluster-niagara))))
   `(org-column ((t (:background ,lackluster-bg-1))))
   `(org-column-title ((t (:background ,lackluster-bg-1 :underline t :weight bold))))
   `(org-done ((t (:foreground ,lackluster-green))))
   `(org-todo ((t (:foreground ,lackluster-red-1))))
   `(org-upcoming-deadline ((t (:foreground ,lackluster-yellow))))

   ;; Search
   `(isearch ((t ,(list :foreground lackluster-black
                        :background lackluster-fg+2))))
   `(isearch-fail ((t ,(list :foreground lackluster-black
                             :background lackluster-red))))
   `(isearch-lazy-highlight-face ((t ,(list
                                       :foreground lackluster-fg+1
                                       :background lackluster-niagara-1))))

   ;; Sh
   `(sh-quoted-exec ((t (:foreground ,lackluster-red+1))))

   ;; Show Paren
   `(show-paren-match-face ((t (:background ,lackluster-bg+4))))
   `(show-paren-mismatch-face ((t (:background ,lackluster-red-1))))

   ;; Slime
   `(slime-repl-inputed-output-face ((t (:foreground ,lackluster-red))))

   ;; Tuareg
   `(tuareg-font-lock-governing-face ((t (:foreground ,lackluster-yellow))))

   ;; Speedbar
   `(speedbar-directory-face ((t ,(list :foreground lackluster-niagara
                                        :weight `bold))))
   `(speedbar-file-face ((t (:foreground ,lackluster-fg))))
   `(speedbar-highlight-face ((t (:background ,lackluster-bg+1))))
   `(speedbar-selected-face ((t (:foreground ,lackluster-red))))
   `(speedbar-tag-face ((t (:foreground ,lackluster-yellow))))

   ;; Which Function
   `(which-func ((t (:foreground ,lackluster-wisteria))))

   ;; Whitespace
   `(whitespace-space ((t ,(list :background lackluster-bg
                                 :foreground lackluster-bg+1))))
   `(whitespace-tab ((t ,(list :background lackluster-bg
                               :foreground lackluster-bg+1))))
   `(whitespace-hspace ((t ,(list :background lackluster-bg
                                  :foreground lackluster-bg+2))))
   `(whitespace-line ((t ,(list :background lackluster-bg+2
                                :foreground lackluster-red+1))))
   `(whitespace-newline ((t ,(list :background lackluster-bg
                                   :foreground lackluster-bg+2))))
   `(whitespace-trailing ((t ,(list :background lackluster-red
                                    :foreground lackluster-red))))
   `(whitespace-empty ((t ,(list :background lackluster-yellow
                                 :foreground lackluster-yellow))))
   `(whitespace-indentation ((t ,(list :background lackluster-yellow
                                       :foreground lackluster-red))))
   `(whitespace-space-after-tab ((t ,(list :background lackluster-yellow
                                           :foreground lackluster-yellow))))
   `(whitespace-space-before-tab ((t ,(list :background lackluster-brown
                                            :foreground lackluster-brown))))

   ;; tab-bar
   `(tab-bar ((t (:background ,lackluster-bg+1 :foreground ,lackluster-bg+4))))
   `(tab-bar-tab ((t (:background nil :foreground ,lackluster-yellow :weight bold))))
   `(tab-bar-tab-inactive ((t (:background nil))))

   ;; vterm / ansi-term
   `(term-color-black ((t (:foreground ,lackluster-bg+3 :background ,lackluster-bg+4))))
   `(term-color-red ((t (:foreground ,lackluster-red-1 :background ,lackluster-red-1))))
   `(term-color-green ((t (:foreground ,lackluster-green :background ,lackluster-green))))
   `(term-color-blue ((t (:foreground ,lackluster-niagara :background ,lackluster-niagara))))
   `(term-color-yellow ((t (:foreground ,lackluster-yellow :background ,lackluster-yellow))))
   `(term-color-magenta ((t (:foreground ,lackluster-wisteria :background ,lackluster-wisteria))))
   `(term-color-cyan ((t (:foreground ,lackluster-quartz :background ,lackluster-quartz))))
   `(term-color-white ((t (:foreground ,lackluster-fg :background ,lackluster-white))))

   ;; company-mode
   `(company-tooltip ((t (:foreground ,lackluster-fg :background ,lackluster-bg+1))))
   `(company-tooltip-annotation ((t (:foreground ,lackluster-brown :background ,lackluster-bg+1))))
   `(company-tooltip-annotation-selection ((t (:foreground ,lackluster-brown :background ,lackluster-bg-1))))
   `(company-tooltip-selection ((t (:foreground ,lackluster-fg :background ,lackluster-bg-1))))
   `(company-tooltip-mouse ((t (:background ,lackluster-bg-1))))
   `(company-tooltip-common ((t (:foreground ,lackluster-green))))
   `(company-tooltip-common-selection ((t (:foreground ,lackluster-green))))
   `(company-scrollbar-fg ((t (:background ,lackluster-bg-1))))
   `(company-scrollbar-bg ((t (:background ,lackluster-bg+2))))
   `(company-preview ((t (:background ,lackluster-green))))
   `(company-preview-common ((t (:foreground ,lackluster-green :background ,lackluster-bg-1))))

   ;; Proof General
   `(proof-locked-face ((t (:background ,lackluster-niagara-2))))

   ;; Orderless
   `(orderless-match-face-0 ((t (:foreground ,lackluster-yellow))))
   `(orderless-match-face-1 ((t (:foreground ,lackluster-green))))
   `(orderless-match-face-2 ((t (:foreground ,lackluster-brown))))
   `(orderless-match-face-3 ((t (:foreground ,lackluster-quartz))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'lackluster)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; lackluster-theme.el ends here.
