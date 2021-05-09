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

(defun toggle-org-html-export-on-save ()
  (interactive)
  (if (memq 'org-html-export-to-html after-save-hook)
      (progn
        (remove-hook 'after-save-hook 'org-html-export-to-html t)
        (message "Disabled org html export on save for current buffer..."))
    (add-hook 'after-save-hook 'org-html-export-to-html nil t)
    (message "Enabled org html export on save for current buffer...")))

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(with-eval-after-load 'org

(setq-default org-default-notes-file "~/Dropbox/org/notes.org")

(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
(setq org-refile-allow-creating-parent-nodes 'confirm)
(setq org-agenda-text-search-extra-files '(agenda-archives))
(setq org-blank-before-new-entry (quote ((heading) (plain-list-item))))

(setq org-enforce-todo-dependencies t)

(setq org-capture-templates
'(("t" "Task" entry (file+headline "~/Dropbox/org/notes.org" "Daily Log")
   "** TODO %?\nSCHEDULED: <%<%Y-%m-%d %a>>")
  ("n" "Note" entry (file+headline "~/Dropbox/org/notes.org" "Daily Log")
   "** %?\n")
  ("a" "Article" entry (file+headline "~/Dropbox/org/notes.org" "Articles")
   "** ART %?\nSCHEDULED: <%<%Y-%m-%d %a>>")
  ("b" "Article (Bach)" entry (file+headline "~/Dropbox/ntnu/bach/bach.org" "Artikler")
   "** ART %?\n %u\n")
  ("p" "Project" entry (file+headline "~/Dropbox/org/notes.org" "Projects")
   "** PROJECT %?\n ")
  )
))

(setq org-pomodoro-long-break-length 15) ; [Minutes]

(fset 'evil-line-above
  (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([79 escape 106] 0 "%d")) arg)))

(fset 'evil-line-below
  (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([111 escape 107] 0 "%d")) arg)))

(fset 'search-visual
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([121 47 23 return] 0 "%d")) arg)))

;; Custom hooks
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))

(with-eval-after-load 'evil-maps

(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)

(define-key evil-normal-state-map (kbd "M-i") 'evil-line-below)
(define-key evil-normal-state-map (kbd "M-o") 'evil-line-above)

(define-key evil-normal-state-map (kbd "J") 'evil-scroll-line-down)
(define-key evil-normal-state-map (kbd "K") 'evil-scroll-line-up)

(define-key evil-normal-state-map (kbd "M-j") 'forward-paragraph)
(define-key evil-normal-state-map (kbd "M-k") 'backward-paragraph)

(define-key evil-normal-state-map (kbd "W") 'save-buffer)

(define-key evil-normal-state-map (kbd "C-c b") 'dotspacemacs/sync-configuration-layers)

(define-key evil-normal-state-map (kbd "C-c t") 'toggle-org-html-export-on-save)

(define-key evil-normal-state-map (kbd "&") 'search-visual)

(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)

(define-key evil-normal-state-map (kbd "M-i") 'evil-line-below)
(define-key evil-normal-state-map (kbd "M-o") 'evil-line-above)

(define-key evil-normal-state-map (kbd "J") 'evil-scroll-line-down)
(define-key evil-normal-state-map (kbd "K") 'evil-scroll-line-up)

(define-key evil-normal-state-map (kbd "M-j") 'forward-paragraph)
(define-key evil-normal-state-map (kbd "M-k") 'backward-paragraph)

(define-key evil-normal-state-map (kbd ", r") 'org-refile)
(define-key evil-normal-state-map (kbd ", v") 'org-set-tags-command)

(global-set-key (kbd "C-c n")
(lambda () (interactive) (find-file "~/Dropbox/org/notes.org")))

(global-set-key (kbd "C-c h") 'helm-bibtex))

(setq-default c-default-style "bsd")
(setq-default c-basic-offset 3)
(setq-default tab-width 3)

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-start-server t
)
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(require 'elfeed-org)
(elfeed-org)
(setq rmh-elfeed-org-files (list "~/.elfeed.org"))

(with-eval-after-load 'elfeed-search
  (defalias 'elfeed-toggle-star
    (elfeed-expose #'elfeed-search-toggle-all 'star))
  (define-key elfeed-search-mode-map (kbd "m") 'elfeed-toggle-star))

(setq-default elfeed-search-filter "@1-months-ago +unread ")

(setq org-ref-default-bibliography '("~/Dropbox/ntnu/bach/art.bib"))

(setq org-ref-pdf-directory "~/Dropbox/ntnu/bach/div/pdf")

;; org-ref-bibliography-notes "~/Dropbox/ntnu/bach/art.org"

(setq bibtex-completion-bibliography
  '("~/Dropbox/ntnu/bach/art.bib")
  bibtex-completion-library-path '("~/Dropbox/ntnu/bach/pdf"))
  ;; bibtex-completion-notes-path "/path/to/notes.org")

(require 'org-mu4e)

(setq mu4e-maildir "~/.maildir")

(setq mu4e-trash-folder "/Trash")

(setq mu4e-refile-folder "/Archive")

(setq mu4e-get-mail-command "mbsync -a")

(setq mu4e-compose-signature-auto-include t)

(setq mu4e-view-show-images t)

(setq mu4e-view-show-addresses t)

;; (setq mu4e-sent-messages-behavior 'delete)

(setq mu4e-enable-async-operations t)

(setq mu4e-enable-notifications t)

(setq mu4e-enable-mode-line t)

(setq mu4e-compose-complete-addresses t)

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

(setq org-noter-notes-search-path '("/home/pab/Dropbox/ntnu/bach/div/notes"))

(setq org-noter-notes-window-behavior '(start))

; Shortcut - Helm Bibtex
(global-set-key (kbd "C-c h") 'helm-bibtex)
