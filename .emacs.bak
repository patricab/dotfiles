(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes
   (quote
    ("5f1bd7f67dc1598977e69c6a0aed3c926f49581fdf395a6246f9bc1df86cb030" default)))
 '(initial-buffer-choice nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Theme settings
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)

; Packages settings
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
 
; Helm configuration
(require 'helm-config)
(helm-mode 1)

; Evil mode configuration
(use-package evil
	:ensure t
	:config
	(evil-mode 1)

    (use-package evil-leader
		:ensure t
		:config
		(global-evil-leader-mode)
	)

	(use-package evil-surround
		:ensure t
		:config
		(global-evil-surround-mode)
	)

	(use-package evil-indent-textobject
		:ensure t
	)
)

; Custom settings
(global-linum-mode 1) ; always show line numbers
(define-key global-map (kbd "RET") 'newline-and-indent) ; Turn on auto-indent
 
; Minimalist settings
;(menu-bar-mode -1)
;(tool-bar-mode -1)
;(scroll-bar-mode -1)
(setq inhibit-startup-message t ; Remove splash screen
inhibit-startup-echo-area-message t) ; Open scratch buffer
