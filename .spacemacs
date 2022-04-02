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
     yaml
     graphviz
     ruby
     javascript
     vimscript
     html
     go
     python
     pandoc
     themes-megapack
     latex
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :disabled-for org spacemacs-org)
     ;; better-defaults
     emacs-lisp
     ;; git
     markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      all-the-icons
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(
     smartparens
     )
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
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
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
   ;; (lt nil) (Emacs 24.4+ only)
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
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
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
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Dired: Reuse the current buffer instead of creation of a new one
  ;;(put 'dired-find-alternate-file 'disabled nil)

  ;;;;;;;;;;;;;;;;;;
  ;; Key Bindings ;;
  ;;;;;;;;;;;;;;;;;;

  ;; Toggle word wrap
  (global-set-key (kbd "<f3>") 'toggle-truncate-lines)

  ;; My Menu
  ;;;; Menu Bar Function
  (defun mmenuentry (name keystroke func)
    (which-key-add-key-based-replacements keystroke name)
    (define-key evil-motion-state-map (kbd keystroke) func)
    )
  ;;;; Entries
  (which-key-add-key-based-replacements "ä f" "file bookmarks")
  (mmenuentry "bookmarks" "ä f b" (lambda () (interactive) (find-file "~/notes/bookmarks.org")))
  (mmenuentry "notes" "ä f n" (lambda () (interactive) (find-file "~/notes/notes.org")))
  (mmenuentry "spacemacs config" "ä f c" (lambda () (interactive) (find-file "~/.spacemacs")))
  (mmenuentry "ideas" "ä f i" (lambda () (interactive) (find-file "~/notes/journal/ideen.org")))
  (mmenuentry "projects" "ä f s" (lambda () (interactive) (find-file "~/notes/projekte")))
  (mmenuentry "pentest ref" "ä f r" (lambda () (interactive) (find-file "~/notes/wiki/pentest_ref.org")))
  (mmenuentry "plans" "ä f p" (lambda () (interactive) (find-file "~/notes/planung.org")))
  (mmenuentry "org-agenda" "ä a" 'org-agenda)

  ;;;; Evil keybindings
  ;; Custom vim key bindings to jklö
  (define-key evil-motion-state-map "j" 'evil-backward-char)
  (define-key evil-motion-state-map "k" 'evil-next-line)
  (define-key evil-motion-state-map "l" 'evil-previous-line)
  (define-key evil-motion-state-map "ö" 'evil-forward-char)
  ;;;; Scroll half page down in evil mode
  (define-key evil-motion-state-map (kbd "C-l") 'evil-scroll-up)
  (define-key evil-motion-state-map (kbd "C-k") 'evil-scroll-down)

  (define-key evil-normal-state-map (kbd "j") 'evil-backward-char)
  (define-key evil-normal-state-map (kbd "k") 'evil-next-line)
  (define-key evil-normal-state-map (kbd "l") 'evil-previous-line)
  (define-key evil-normal-state-map (kbd "ö") 'evil-forward-char)

  ;; Agenda key bindings
  ;; j evil-backward-char   evilified-state
  ;; k org-agenda-next-line
  ;; l org-agenda-previous-line
  ;; ö evil-forward-char
  ;; (define-key evilified-state "j" 'evil-backward-char)
  ;; (define-key evilified-state "k" 'org-agenda-next-line)
  ;; (define-key evilified-state "l" ' org-agenda-previous-line)
  ;; (define-key evilified-state "ö" 'evil-forward-char)


  ;;(evil-define-key 'normal custom-mode-map
  ;;  "j" 'org-agenda-next-line
  ;;  "k" 'org-agenda-previous-line)


  ;;;; TODO
  ;; (define-key evil-motion-state-map (kbd "M-S-j") 'org-promote-subtree)
  ;; (define-key evil-motion-state-map (kbd "M-S-ö") 'org-demote-subtree)

  (define-key evil-motion-state-map (kbd "M-j") 'org-metaleft)
  (define-key evil-motion-state-map (kbd "M-ö") 'org-metaright)
  (define-key evil-motion-state-map (kbd "M-l") 'org-metaup)
  (define-key evil-motion-state-map (kbd "M-k") 'org-metadown)

  ;; (evil-define-key 'normal org-mode-map (kbd "M-j") 'org-metaleft)
  ;; (evil-define-key 'normal org-mode-map (kbd "M-ö") 'org-metaright)
  ;; (evil-define-key 'normal org-mode-map (kbd "M-l") 'org-metaup)
  ;; (evil-define-key 'normal org-mode-map (kbd "M-k") 'org-metadown)

  ;; (define-key evil-org-mode-map (kbd "M-j") 'org-metaleft)
  ;; (define-key evil-org-mode-map (kbd "M-ö") 'org-metaright)
  ;; (define-key evil-org-mode-map (kbd "M-l") 'org-metaup)
  ;; (define-key evil-org-mode-map (kbd "M-k") 'org-metadown)


  ;;;; NeoTree Keybindings
  (with-eval-after-load 'neotree
    (evil-define-key 'evilified neotree-mode-map (kbd "j") 'spacemacs/neotree-collapse-or-up)
    (evil-define-key 'evilified neotree-mode-map (kbd "J") 'neotree-select-previous-sibling-node)
    (evil-define-key 'evilified neotree-mode-map (kbd "K") 'neotree-select-down-node)
    (evil-define-key 'evilified neotree-mode-map (kbd "L") 'neotree-select-up-node)
    (evil-define-key 'evilified neotree-mode-map (kbd "ö") 'spacemacs/neotree-expand-or-open)
    (evil-define-key 'evilified neotree-mode-map (kbd "Ö") 'neotree-select-next-sibling-node)
    (evil-define-key 'evilified neotree-mode-map (kbd "l") 'neotree-previous-line)
    (evil-define-key 'evilified neotree-mode-map (kbd "k") 'neotree-next-line)
    )


  ;; Custom Helm Bindings to jklö
  (require 'helm-mode)
  (require 'helm-config)
  (setq helm-ff-lynx-style-map nil)
  (helm-mode 1)
  (define-key helm-map (kbd "C-k") 'helm-next-line)
  (define-key helm-map (kbd "C-l") 'helm-previous-line)
  (define-key helm-map (kbd "C-j") 'helm-next-source)
  (define-key helm-map (kbd "C-ö") (kbd "RET"))

  (define-key helm-find-files-map (kbd "C-k") 'helm-next-line)
  (define-key helm-find-files-map (kbd "C-l") 'helm-previous-line)
  (define-key helm-find-files-map (kbd "C-j") 'helm-next-source)
  (define-key helm-find-files-map (kbd "C-ö") (kbd "RET"))


  ;;(add-hook 'org-agenda-mode-hook
  ;;          (lambda ()
  ;;            (local-set-key (kbd "k") 'org-agenda-next-item)
  ;;            (local-set-key (kbd "l") 'org-agenda-previous-item)
  ;;          ))

  ;;(define-key org-agenda-mode-map (kbd "k") 'org-agenda-next-item)
  ;;(define-key org-agenda-mode-map (kbd "l") 'org-agenda-previous-item)

  ;; Agenda keys
  ;;(add-hook 'org-agenda-mode-hook
  ;;    (lambda ()
  ;;      (general-define-key
  ;;       :keymaps 'org-agenda-mode-map
  ;;       :states 'motion

  ;;       "k" 'org-agenda-next-item
  ;;       "l" 'org-agenda-previous-item
  ;;       )
  ;;     )
  ;; )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Editor standard behavior ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Masimized window size on startup
  (setq dotspacemacs-maximized-at-startup t)

  ;; Default is no word wrap
  (setq-default truncate-lines 1)

  ;; Save undos after file closing
  (setq undo-tree-auto-save-history t
        undo-tree-history-directory-alist
        `(("." . ,(concat spacemacs-cache-directory "undo"))))
  (unless (file-exists-p (concat spacemacs-cache-directory "undo"))
    (make-directory (concat spacemacs-cache-directory "undo")))

  ;;;;;;;;;;;;;;
  ;; Org Mode ;;
  ;;;;;;;;;;;;;;
  ;;(setq mytaskpath "/home/fynex/notebook/tasks.org")

  ;;(with-eval-after-load 'org-mode
  ;;  (define-key evil-motion-state-map (kbd "M-j") 'org-metaleft)
  ;;  (define-key evil-motion-state-map (kbd "M-ö") 'org-metaright)
  ;;  (define-key evil-motion-state-map (kbd "M-l") 'org-metaup)
  ;;  (define-key evil-motion-state-map (kbd "M-k") 'org-metadown)
  ;;)

  (with-eval-after-load 'org
    (setq org-startup-indented t) ; Enable `org-indent-mode' by default
    (add-hook 'org-mode-hook #'visual-line-mode)

    (add-hook 'org-mode-hook 'turn-on-auto-fill)

    (setq org-archive-location "~/notes/archive/%s::")

    ;; Agenda Settings
    (setq org-agenda-files (list "~/notes/notes.org"
                                 "~/notes/planung.org"))


    ;;(define-key org-agenda-mode-map "l" 'org-agenda-previous-line)
    (add-hook 'org-agenda-mode-hook
              (lambda ()
                (define-key org-agenda-mode-map "k" 'org-agenda-next-line)
                )
              )

    ;; TEST
    (define-key evil-motion-state-map (kbd "M-j") 'org-metaleft)
    (define-key evil-motion-state-map (kbd "M-ö") 'org-metaright)
    (define-key evil-motion-state-map (kbd "M-l") 'org-metaup)
    (define-key evil-motion-state-map (kbd "M-k") 'org-metadown)

    (dolist (state '(normal visual))
      (evil-define-key state org-mode-map (kbd "M-k") 'org-metadown)
      (evil-define-key state org-mode-map (kbd "M-l") 'org-metaup)
      (evil-define-key state org-mode-map (kbd "M-j") 'org-metaleft)
      (evil-define-key state org-mode-map (kbd "M-ö") 'org-metaright)
      ;;(evil-define-key state org-mode-map (kbd "M-J") 'org-shiftmetadown)
      ;;(evil-define-key state org-mode-map (kbd "M-K") 'org-shiftmetaup)
      ;;(evil-define-key state org-mode-map (kbd "M-H") 'org-shiftmetaleft)
      ;;(evil-define-key state org-mode-map (kbd "M-L") 'org-shiftmetaright)
      )
    ;;;;;;;;;;;;;;;;;;;;;


    (setq org-agenda-span 10)
    (setq org-agenda-start-on-weekday nil)
    (setq org-agenda-custom-commands
          '(("ä" agenda "" nil ("~/notes/agenda.html"))
            ("h" . "Horizonte")
            ("hw" tags "woche")
            ("hm" tags "monat")
            ("hq" tags "quartal")
            ("hj" tags "jahr")
            ("h7" tags "7 jahre")
            ("hv" tags "vision")
            ("r" tags "routine")
            ("f" todo "FOCUS")
            ("w" todo "WAITING")
           )
    )

    ;;;; Server Experiments ;;;;
    ;; (require 'server)
    ;; (unless (server-running-p)
    ;;   (server-start));;for emacs client
    ;; (require 'org-protocol)

    ;; Enable autocomplete of <s TAB
    (require 'org-tempo)

    ;; (global-set-key (kbd ", p") 'org-priority)
    ;; (define-key org-mode-map (kbd ", p") nil)

    ;; SETTING KEYS IN NORMAL MODE
    ;; (define-key evil-normal-state-map (kbd "SPC , p") 'org-priority)
    ;; (define-key evil-normal-state-map (kbd "M p") 'org-priority)
    (define-key evil-normal-state-map (kbd ", p") 'org-priority)
    ;;(define-key evil-normal-state-map (kbd ", w") 'widen)
    ;;(mmenuentry "org-priority" ", p" 'org-priority)

    ;; Enable dot evaluation in Org files
    (require 'ob-dot)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((dot . t)))

    (use-package org
      :bind (:map spacemacs-org-mode-map-root-map ("M-RET" . nil)))

    (setq org-todo-keywords
          '((sequence "TODO(t)" "NEXT(n)" "APPT(a)" "STARTED(g)" "WAITING(w)" "FOCUS(f)" "NOTE(x)" "REVIEWED(r)"
                      "DELEGATED(l)" "MUST(m)" "SHOULD(s)" "MAYBE(b)" "|" "DONE(d)" "CANCELED(c)")))

    ;; Farben anpassen
    (setq org-todo-keyword-faces
          '(("TODO"  . (:foreground "#b70101" :weight bold))
            ("STARTED"  . (:foreground "#b70101" :weight bold))
            ("NEXT"  . (:foreground "#dc6900" :weight bold))
            ("FINDING" . (:foreground "#b70101" :weight bold))
            ("APPT"  . (:foreground "sienna" :weight bold))
            ("PROJ"  . (:foreground "lightblue" :weight bold))
            ("NOTE"  . (:foreground "yellow" :weight bold))
            ("MUST"  . (:foreground "#b70101" :weight bold))
            ("SHOULD"  . (:foreground "orange" :weight bold))
            ("MAYBE"  . (:foreground "yellow" :weight bold))
            ("FOCUS"  . (:foreground "yellow" :weight bold))
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

  ;; Icon Theme for neo-tree
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))

  ;; Surround Mode aktivieren
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1))

  ;;;; Agenda mit spacemacs aktivieren!!!
  ;;(setq org-agenda-file-to-front t)

  ;; (add-to-list 'default-frame-alist '(font . "Hack-14" ))
  ; (set-face-attribute 'default t :font "Hack-14" )


  ;; Start the week on monday
  (setq calendar-week-start-day 1)

  (setq mac-command-modifier 'meta
        mac-option-modifier 'none
        default-input-method "MacOSX")

  (global-auto-complete-mode t)


  ;; No blank lines between *
  (setq org-cycle-separator-lines 0)
  ;; No blank lines between items (1. and -)
  (setq org-blank-before-new-entry '((heading) (plain-list-item)))



  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bf390ecb203806cbe351b966a88fc3036f3ff68cd2547db6ee3676e87327b311" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "218bc69ef19fd1f681cdded7b85924e41242fe87a6033df823499822f1397f1a" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "7f9dc0c7bc8e5b4a1b9904359ee449cac91fd89dde6aca7a45e4ed2e4985664c" "fa5fc38a396c2835973e7827dd54d117566f5908b1ebcebdced4f1b39220b706" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files (quote ("~/notes.org")))
 '(package-selected-packages
   (quote
    (auctex-latexmk ox-hugo nord-theme company-auctex auctex zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme alect-themes afternoon-theme multi-term doom-themes solarized-theme naquadah-theme ample-theme jbeans-theme jellybeans-plus-theme memoize yaml-mode org-plus-contrib ox-twbs all-the-icons all-the-icons-ivy org-mind-map toc-org pandoc org-mime graphviz-dot-mode pandoc-mode ox-pandoc ht rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby direx dired-subtree ranger web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode powerline spinner hydra parent-mode projectile pkg-info epl flx evil-unimpaired smartparens iedit anzu evil goto-chg undo-tree highlight diminish bind-map bind-key packed f dash s helm avy helm-core async popup vimrc-mode dactyl-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data go-guru go-eldoc company-go go-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode company-anaconda anaconda-mode pythonic org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download mmm-mode markdown-toc markdown-mode htmlize helm-company helm-c-yasnippet gnuplot gh-md fuzzy company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
