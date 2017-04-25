# config

## Emacs

```
;; Custom vim key bindings
(define-key evil-motion-state-map "j" 'evil-backward-char)
(define-key evil-motion-state-map "k" 'evil-next-line)
(define-key evil-motion-state-map "l" 'evil-previous-line)
(define-key evil-motion-state-map "ö" 'evil-forward-char)

;; load theme jelly beans
;;(load-theme 'jbeans t)

;;;;;;;;;;;;;;
;; Org Mode ;;
(setq mytaskpath "/home/fynex/notebook/tasks.org")

(with-eval-after-load 'org       
  (setq org-startup-indented t) ; Enable `org-indent-mode' by default
  (add-hook 'org-mode-hook #'visual-line-mode))


(setq org-todo-keywords
 '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "APPT(a)" "PROJ(p)" "NOTIZ(n)" "BESPROCHEN(b)"
             "DELEGATED(g)" "|" "DONE(d)" "ZKTO(z)" "CANCELED(c)")))

;; Farben anpassen
(setq org-todo-keyword-faces
      '(("TODO"  . (:foreground "#b70101" :weight bold))
        ("STARTED"  . (:foreground "#b70101" :weight bold))
        ("APPT"  . (:foreground "sienna" :weight bold))
        ("PROJ"  . (:foreground "lightblue" :weight bold))
        ("NOTIZ"  . (:foreground "yellow" :weight bold))
        ("ZKTO"  . (:foreground "orange" :weight bold))
        ("WAITING"  . (:foreground "orange" :weight bold))
        ("BESPROCHEN"  . (:foreground "darkorange" :weight bold))
        ("REVIEWED"  . (:foreground "forestgreen" :weight bold))
        ("DONE"  . (:foreground "forestgreen" :weight bold))
        ("DELEGATED"  . (:foreground "forestgreen" :weight bold))
        ("CANCELED"  . shadow)))

;; Fast TODO Selection
(setq org-use-fast-todo-selection t)

;; Keinen Splash-Screen
(setq inhibit-splash-screen t)

(find-file mytaskpath)

(setq org-capture-templates
      '(("t" "Aufgabe in tasks.org" entry (file+headline mytaskpath "Inbox")
         "* TODO %?")
        ("z" "Zeiteintrag in tasks.org" entry (file+headline mytaskpath "Inbox")
         "* ZKTO %? \n  %i" :clock-in t :clock-resume t)))
```
