;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     pdf-tools
     csv
     html
     octave
     python
     vimscript
     helm
     auto-completion
     emacs-lisp
     git
     markdown
     org
     latex
     bibtex
     elfeed
     syntax-checking
     yaml
     ruby
     ranger
     (mu4e :variables
             mu4e-enable-async-operations t)
     ;; better-defaults
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(evil-mu4e
                                      treemacs
                                      treemacs-evil
                                      treemacs-projectile
                                      sqlite3
                                      (org-roam :location (recipe :fetcher github :repo "jethrokuan/org-roam"))
                                      org-roam-bibtex
                                      org-noter
                                      platformio-mode
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   dotspacemacs-line-numbers '(:relative t
                                :disabled-for-modes dired-mode
                                                    doc-view-mode
                                                    markdown-mode
                                                    org-mode
                                                    pdf-view-mode
                                                    text-mode
                                :size-limit-kb 1000)
   ;; (default nil)
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
;  (add-hook 'pdf-view-mode-hook 'linum-on)
;	(global-linum-mode 1)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (with-eval-after-load 'org
    (setq-default org-default-notes-file "~/Dropbox/org/notes.org")
    (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
    (setq org-refile-allow-creating-parent-nodes 'confirm)
    (setq org-agenda-text-search-extra-files '(agenda-archives))
    (setq org-blank-before-new-entry (quote ((heading) (plain-list-item))))
    (setq org-enforce-todo-dependencies t)
    (setq org-capture-templates
    '(("t" "Task" entry (file+headline "~/Dropbox/org/notes.org" "Daily Log")
       "** TODO %?\n  %u")
      ("n" "Note" entry (file+headline "~/Dropbox/org/notes.org" "Daily Log")
       "** %?\n ")
      ("a" "Article" entry (file+headline "~/Dropbox/org/notes.org" "Articles")
       "** ART %?\n %u\n")
      ("p" "Project" entry (file+headline "~/Dropbox/org/notes.org" "Projects")
       "** PROJECT %?\n ")
      )
    ))

; Keybind functions
(fset 'evil-line-above
  (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([79 escape 106] 0 "%d")) arg)))

(fset 'evil-line-below
  (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([111 escape 107] 0 "%d")) arg)))

(fset 'search-visual
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([121 47 23 return] 0 "%d")) arg)))

;; Custom hooks
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))

;; Custom keybinds
(with-eval-after-load 'evil-maps

; Split navigation
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)

; Insert line above/below
(define-key evil-normal-state-map (kbd "M-i") 'evil-line-below)
(define-key evil-normal-state-map (kbd "M-o") 'evil-line-above)

; Scroll line up/down
(define-key evil-normal-state-map (kbd "J") 'evil-scroll-line-down)
(define-key evil-normal-state-map (kbd "K") 'evil-scroll-line-up)

; Jump paragraph
(define-key evil-normal-state-map (kbd "M-j") 'forward-paragraph)
(define-key evil-normal-state-map (kbd "M-k") 'backward-paragraph)

; Save file
(define-key evil-normal-state-map (kbd "W") 'save-buffer)

; Refresh buffer
(define-key evil-normal-state-map (kbd "C-c b") 'dotspacemacs/sync-configuration-layers)

; Treemacs toggle
;; (global-set-key (kbd "C-c o") 'treemacs)

; Search visual selection
(define-key evil-normal-state-map (kbd "&") 'search-visual)

;; Changed to Spacemacs Layers (SPC-l)
;; ; Save desktop file
;; (define-key evil-normal-state-map (kbd "M-w") 'desktop-save)
;; ; Load desktop file
;; (define-key evil-normal-state-map (kbd "M-q") 'desktop-change-dir)
)

(with-eval-after-load 'org

; Split navigation
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)

; Insert line above/below
(define-key evil-normal-state-map (kbd "M-i") 'evil-line-below)
(define-key evil-normal-state-map (kbd "M-o") 'evil-line-above)

; Scroll line up/down
(define-key evil-normal-state-map (kbd "J") 'evil-scroll-line-down)
(define-key evil-normal-state-map (kbd "K") 'evil-scroll-line-up)

; Jump paragraph
(define-key evil-normal-state-map (kbd "M-j") 'forward-paragraph)
(define-key evil-normal-state-map (kbd "M-k") 'backward-paragraph)

; Org refile
(define-key evil-normal-state-map (kbd ", r") 'org-refile)
(define-key evil-normal-state-map (kbd ", v") 'org-set-tags-command)
)

; Default formatting (LaTeX)
(setq-default c-default-style "bsd")
(setq-default c-basic-offset 3)
(setq-default tab-width 3)

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-start-server t
)
(setq TeX-auto-save t)
(setq TeX-parse-self t)


; Elfeed config
(require 'elfeed-org)
(elfeed-org)
(setq rmh-elfeed-org-files (list "~/.elfeed.org"))

(with-eval-after-load 'elfeed-search
  (defalias 'elfeed-toggle-star
    (elfeed-expose #'elfeed-search-toggle-all 'star))
  (define-key elfeed-search-mode-map (kbd "m") 'elfeed-toggle-star))

(setq-default elfeed-search-filter "@1-months-ago +unread ")

; Bibtex config
(setq org-ref-default-bibliography '("~/Dropbox/ntnu/bach/art.bib"))
(setq org-ref-pdf-directory "~/Dropbox/ntnu/bach/pdf")
;; org-ref-bibliography-notes "~/Dropbox/ntnu/bach/art.org"
(setq bibtex-completion-bibliography
  '("~/Dropbox/ntnu/bach/art.bib")
  bibtex-completion-library-path '("~/Dropbox/ntnu/bach/pdf")
  bibtex-completion-notes-path "/path/to/notes.org")

; Org pomodoro
(setq org-pomodoro-long-break-length 15) ; [Minutes]

; Shortcut to notes (org file)
(global-set-key (kbd "C-c n")
(lambda () (interactive) (find-file "~/Dropbox/org/notes.org")))

;; Mu4e config
(require 'org-mu4e)
(setq mu4e-maildir "~/.maildir")
(setq mu4e-trash-folder "/Trash")
(setq mu4e-refile-folder "/Archive")
(setq mu4e-get-mail-command "mbsync -a")
     ;; mu4e-update-interval 300)
(setq mu4e-compose-signature-auto-include t)
(setq mu4e-view-show-images t)
(setq mu4e-view-show-addresses t)
;; (setq mu4e-sent-messages-behavior 'delete)
(setq mu4e-enable-async-operations t)
(setq mu4e-enable-notifications t)
(setq mu4e-enable-mode-line t)
(setq mu4e-compose-complete-addresses t)


; Contact info
(setq
 user-mail-address "patric.berthelsen@vkbb.no"
 user-full-name  "Patric A. Berthelsen"
 mu4e-compose-signature
(concat
  "Mvh, \n\n"
  "Patric A. Berthelsen\n"
  "patric.berthelsen@vkbb.no\n"
  "patricab@stud.ntnu.no\n"
  "+47 41176306\n"
  "https://www.linkedin.com/in/patric-andre-berthelsen/"))

; Mail directory shortcuts
(setq mu4e-maildir-shortcuts
      '(("/vkbb/INBOX" . ?j)
       ("/ntnu/INBOX" . ?n)
))

; Custom contexts
;; (setq mu4e-contexts
;;   `( ,(make-mu4e-context
;;     :name "vkbb"
;;     :enter-func (lambda () (mu4e-message "Switch to the Private context"))
;;     :match-func (lambda (msg)
;;     (when msg
;;       (mu4e-message-contact-field-matches msg
;;         :to "patric.berthelsen@vkbb.no")))
;;         :vars '((user-mail-address . "patric.berthelsen@vkbb.no"  )
;;         (user-full-name . "Patric A. Berthelsen" )
;;         (mu4e-compose-signature .
;;         (concat
;;           "Mvh, \n\n"
;;           "Patric A. Berthelsen\n"
;;           "patric.berthelsen@vkbb.no\n"
;;           "+47 41176306\n"
;;           "https://www.linkedin.com/in/patric-andre-berthelsen/"))))
;;      ,(make-mu4e-context
;;       :name "ntnu"
;;       :enter-func (lambda () (mu4e-message "Switch to the Work context"))
;;       :match-func (lambda (msg)
;;       (when msg
;;       (mu4e-message-contact-field-matches msg
;;         :to "patricab@stud.ntnu.no")))
;;         :vars '((user-mail-address . "patricab@stud.ntnu.no" )
;;         (user-full-name . "Patric A. Berthelsen" )
;;         (mu4e-compose-signature .
;;         (concat
;;           "Mvh, \n\n"
;;           "Patric A. Berthelsen\n"
;;           "patricab@stud.ntnu.no\n"
;;           "+47 41176306\n"
;;           "https://www.linkedin.com/in/patric-andre-berthelsen/")))))
;; )

; Context policy
(setq mu4e-context-policy 'pick-first
      mu4e-compose-context-policy nil)

; Bookmarks
(setq mu4e-bookmarks
      `(("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
        ("date:today..now" "Today's messages" ?t)
        ("date:7d..now" "Last 7 days" ?w)
        ("mime:image/*" "Messages with images" ?p)
        (,(mapconcat 'identity
                     (mapcar
                      (lambda (maildir)
                        (concat "maildir:" (car maildir)))
                      mu4e-maildir-shortcuts) " OR ")
         "All inboxes" ?i)))

; SMTP
(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
  smtpmail-starttls-credentials
  '(("patric.berthelsen@vkbb.no" 587 nil nil))
  smtpmail-default-smtp-server "smtp.altibox.no"
  smtpmail-smtp-server "smtp.altibox.no"
  smtpmail-smtp-service 587
  smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg")
  smtpmail-debug-info t
)

; Desktop notifications
(with-eval-after-load 'mu4e-alert
  (mu4e-alert-set-default-style 'notifications))

; Contact autocompletion
(setq mu4e-org-contacts-file  "~/.emacs.d/contacts")
(add-to-list 'mu4e-headers-actions
             '("org-contact-add" . mu4e-action-add-org-contact) t)
(add-to-list 'mu4e-view-actions
             '("org-contact-add" . mu4e-action-add-org-contact) t)


;; Org-roam
(use-package org-roam
  :after org
  :hook (org-mode . org-roam-mode)
  :custom
  (org-roam-directory "~/Dropbox/org/roam")
  :bind
  ("C-c j j" . org-roam)
  ("C-c j t" . org-roam-today)
  ("C-c j f" . org-roam-find-file)
  ("C-c j i" . org-roam-insert)
  ("C-c j g" . org-roam-show-graph)
)

; Org-roam-bibtex
(use-package org-roam-bibtex
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :bind (:map org-mode-map
  (("C-c j a" . orb-note-actions))))

 ; Org-roam capture
(setq orb-preformat-keywords
      '("citekey" "title" "url" "author-or-editor" "keywords" "file")
      orb-process-file-field t
      orb-file-field-extensions "pdf")

(setq orb-templates
'(("r" "ref" plain (function org-roam-capture--get-point)
    ""
:file-name "${citekey}"
:head "#+TITLE: ${citekey}: ${title}\n#+ROAM_KEY: ${ref}

- tags ::
- keywords :: ${keywords}

* ${title}
:PROPERTIES:
:Custom_ID: ${citekey}
:URL: ${url}
:AUTHOR: ${author-or-editor}
:NOTER_DOCUMENT: ${file}
:NOTER_PAGE:
:END:")))

; Shortcut - Helm Bibtex
(global-set-key (kbd "C-c h") 'helm-bibtex)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Dropbox/org/notes.org")))

 '(package-selected-packages
   (quote
    (evil-mu4e mu4e-maildirs-extension mu4e-alert ht yapfify yaml-mode web-mode vimrc-mode tagedit smeargle slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv ranger rake pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements orgit org-ref pdf-tools key-chord ivy tablist org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mmm-mode minitest markdown-toc markdown-mode magit-gitflow magit-popup live-py-mode hy-mode dash-functional htmlize helm-pydoc helm-gitignore helm-css-scss helm-company helm-c-yasnippet helm-bibtex bibtex-completion parsebib haml-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flycheck-pos-tip pos-tip flycheck evil-magit magit git-commit with-editor transient emmet-mode elfeed-web simple-httpd elfeed-org elfeed-goodies ace-jump-mode noflet elfeed dactyl-mode cython-mode csv-mode company-web web-completion-data company-statistics company-auctex company-anaconda company chruby bundler inf-ruby biblio biblio-core auto-yasnippet yasnippet auctex-latexmk auctex anaconda-mode pythonic ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired f evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)

(setq org-publish-project-alist
      '(("rockandspace"
         ;; Path to org files.
         :base-directory "~/Dropbox/projects/rockandspace/org/"
         :base-extension "org"
         ;; Path to Jekyll Posts
         :publishing-directory "~/Dropbox/projects/rockandspace/_posts/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :html-extension "html"
         :body-only t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds nil)
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/bach.org" "~/Dropbox/org/orbit.org" "~/Dropbox/org/notes.org")))
 '(package-selected-packages
   (quote
    (evil-mu4e mu4e-maildirs-extension mu4e-alert ht yapfify yaml-mode web-mode vimrc-mode tagedit smeargle slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv ranger rake pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements orgit org-ref pdf-tools key-chord ivy tablist org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mmm-mode minitest markdown-toc markdown-mode magit-gitflow magit-popup live-py-mode hy-mode dash-functional htmlize helm-pydoc helm-gitignore helm-css-scss helm-company helm-c-yasnippet helm-bibtex bibtex-completion parsebib haml-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flycheck-pos-tip pos-tip flycheck evil-magit magit git-commit with-editor transient emmet-mode elfeed-web simple-httpd elfeed-org elfeed-goodies ace-jump-mode noflet elfeed dactyl-mode cython-mode csv-mode company-web web-completion-data company-statistics company-auctex company-anaconda company chruby bundler inf-ruby biblio biblio-core auto-yasnippet yasnippet auctex-latexmk auctex anaconda-mode pythonic ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired f evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
