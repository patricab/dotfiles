(defun spacemacs/find-config-file ()
  (interactive)
  (find-file (concat dotspacemacs-directory "/spacemacs.org")))

(spacemacs/set-leader-keys "fec" 'spacemacs/find-config-file)
