# config

## Emacs

```
  ;;;; Evil keybindings
  ;; Custom vim key bindings
  (define-key evil-motion-state-map "j" 'evil-backward-char)
  (define-key evil-motion-state-map "k" 'evil-next-line)
  (define-key evil-motion-state-map "l" 'evil-previous-line)
  (define-key evil-motion-state-map "ö" 'evil-forward-char)
  ;;;; Scroll half page down in evil mode
  (define-key evil-motion-state-map (kbd "C-l") 'evil-scroll-up)
  (define-key evil-motion-state-map (kbd "C-k") 'evil-scroll-down)

  ;; load theme jelly beans
  ;;(load-theme 'jbeans t)

  ;;;;;;;;;;;;;;
  ;; Org Mode ;;
  ;;(setq mytaskpath "/home/fynex/notebook/tasks.org")

  (with-eval-after-load 'org
    (setq org-startup-indented t) ; Enable `org-indent-mode' by default
    (add-hook 'org-mode-hook #'visual-line-mode)

    (add-hook 'org-mode-hook 'turn-on-auto-fill)

    ;; Enable dot evaluation in Org files
    (require 'ob-dot)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((dot . t)))

    (use-package org
      :bind (:map spacemacs-org-mode-map-root-map ("M-RET" . nil)))

    (setq org-todo-keywords
    '((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "WAITING(w)" "APPT(a)" "PROJ(p)" "NOTE(x)" "BESPROCHEN(b)"
                "DAILY(l)" "DELEGATED(g)" "|" "DONE(d)" "ZKTO(z)" "CANCELED(c)")))

    ;; Farben anpassen
    (setq org-todo-keyword-faces
          '(("TODO"  . (:foreground "#b70101" :weight bold))
            ("STARTED"  . (:foreground "#b70101" :weight bold))
            ("NEXT"  . (:foreground "#dc6900" :weight bold))
            ("APPT"  . (:foreground "sienna" :weight bold))
            ("PROJ"  . (:foreground "lightblue" :weight bold))
            ("NOTE"  . (:foreground "yellow" :weight bold))
            ("ZKTO"  . (:foreground "orange" :weight bold))
            ("WAITING"  . (:foreground "orange" :weight bold))
            ("BESPROCHEN"  . (:foreground "darkorange" :weight bold))
            ("DAILY"  . (:foreground "darkorange" :weight bold))
            ("REVIEWED"  . (:foreground "forestgreen" :weight bold))
            ("DONE"  . (:foreground "forestgreen" :weight bold))
            ("DELEGATED"  . (:foreground "forestgreen" :weight bold))
            ("CANCELED"  . shadow)))

    ;; Fast TODO Selection
    (setq org-use-fast-todo-selection t)
  )

  ;; Keinen Splash-Screen
  (setq inhibit-splash-screen t)

  ;; Truncate Lines => Don't wrap
  ;; (setq-default truncate-lines nil) ;; Not working with t, 1 or nil


  ;; Surround Mode aktivieren
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1))

  ;; Start the week on monday
  (setq calendar-week-start-day 1)

  (setq mac-command-modifier 'meta
        mac-option-modifier 'none
        default-input-method "MacOSX")

  (global-auto-complete-mode t)
  (global-set-key (kbd "C-c n")
                  (lambda () (interactive) (find-file "~/notes.org")))
  (setq org-cycle-separator-lines 0)
```

## Autostart

```
setxkbmap -option ctrl:nocaps
xset r rate 200 40
xset m 1/1 4
```
