;; https://ruivieira.dev/from-scratch-to-emacs-the-adventurous-configurators-handbook.html

(setq inhibit-startup-message t)

(scroll-bar-mode -1) ; Disable visible scrollbar
(tool-bar-mode -1)   ; Disable the toolbar
(menu-bar-mode -1)   ; Disable menu
(tooltip-mode -1)    ; Disable tooltips
(set-fringe-mode 10) ; Give some breathing room

(setq ring-bell-function 'ignore) ; Turn off alarms

(set-face-attribute 'default nil :font "Fira Code Retina" :height 160)

;; Window width and height
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 90))

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; MacOS meta key
(setq mac-command-modifier 'meta
      mac-option-modifier  'alt
      mac-right-option-modifier 'alt)

;; Init package sourses
(require 'package)

(setq package-archives '(("melpa" . "http://melpa.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("elpa" . "http://elpa.gnu.org/packages/")))
;; (unless package-archive-contents
;;   (package-refresh-contents))

;; Init use-package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; doom emacs modeline and theme
(use-package doom-themes
  :ensure t
  :config
  (setq doom-theme 'doom-solarized-light))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(load-theme 'doom-solarized-light :no-confirm)
 
;; evil mode
(setq evil-want-keybinding nil)
(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)

;; projectile
(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(require 'projectile)
(projectile-mode +1)

(setq projectile-switch-project-action 'projectile-dired)
(setq projectile-indexing-method 'alien)
(setq projectile-completion-system 'ivy)

;;; Create a function to display recent projects on startup
(defun display-projectile-list-on-startup ()
  (let ((buf (get-buffer-create "*Projectile Projects*")))
    (with-current-buffer buf
      (erase-buffer)
      (dolist (project (projectile-relevant-known-projects))
        (insert project "\n")))
    (switch-to-buffer buf)))

;; mini-frame
;; (unless (package-installed-p 'mini-frame)
;;   (package-install 'mini-frame))

;; (require 'mini-frame)
;; (mini-frame-mode 1)

;; (setq mini-frame-show-parameters
;;       '((top . 0)
;;         (width . 0.7)
;;         (left . 0.5)))

;; ivy support
(use-package ivy
  :ensure t
  :bind (:map ivy-mode-map
              ("TAB" . ivy-alt-done)
              ("C-j" . ivy-next-line)
              ("C-k" . ivy-previous-line))
  :config (ivy-mode 1))

(unless (package-installed-p 'evil-collection)
  (package-install 'evil-collection))

(require 'evil-collection)

;; (unless (package-installed-p 'ivy)
;;   (package-install 'ivy))

;; (unless (package-installed-p 'ivy-posframe)
;;   (package-install 'ivy-posframe))

;; (require 'ivy)
;; (ivy-mode 1)

;; (require 'ivy-posframe)
;; (setq ivy-display-function #'ivy-posframe-display-at-frame-center)
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
;; (ivy-posframe-mode 1)

;; markdown
(dolist (package '(markdown-mode markdown-toc markdownfmt))
  (unless (package-installed-p package)
    (package-install package)))

(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;; Enable font-lock globally (syntax highlighting for code blocks)
(global-font-lock-mode 1)
(setq markdown-fontify-code-blocks-natively t)
(setq markdown-enable-wiki-links t)

;; scrolling
(setq scroll-conservatively 101)

;; windows numbers
(unless (package-installed-p 'winum)
  (package-install 'winum))
(require 'winum)
(winum-mode)



;; speed bar
(dolist (package '(which-key general))
  (unless (package-installed-p package)
    (package-install package)))

(require 'which-key)
(which-key-mode)

(require 'general)
(general-create-definer my-leader-def
  :states '(normal visual emacs)
  :prefix "SPC"
  :non-normal-prefix "SPC")

(my-leader-def
  "SPC" '(execute-extended-command :which-key "execute command")
  "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
  "1" '(winum-select-window-1 :which-key "select window 1")
  "2" '(winum-select-window-2 :which-key "select window 2")
  "3" '(winum-select-window-3 :which-key "select window 3")
  "4" '(winum-select-window-4 :which-key "select window 4"))

(my-leader-def
  "f"  '(:ignore t :which-key "files")
  "ff" '(find-file :which-key "find file")
  "fs" '(save-buffer :which-key "save file"))

(my-leader-def
  "b"  '(:ignore t :which-key "buffers")
  "bb" '(ivy-switch-buffer :which-key "switch buffer"))

(my-leader-def
  "p"  '(:ignore t :which-key "projects")
  "pf" '(projectile-find-file :which-key "find file"))

(setq which-key-idle-delay 0.4) ;; default 0.5

(defun split-right ()
  "Split current window into two, left and right."
  (interactive)
  (split-window-right)
  (other-window 1))

(defun split-below ()
  "Split current window into two, top and bottom."
  (interactive)
  (split-window-below)
  (other-window 1))

(my-leader-def
  "w"  '(:ignore t :which-key "windows")
  "w/" '(split-right :which-key "split right")
  "w-" '(split-below :which-key "split below")
  "wd" '(delete-window :which-key "delete window")
  "wm" '(delete-other-windows :which-key "maximaze window")
  )

;; magit
(unless (package-installed-p 'magit)
  (package-install 'magit))

;; magit refresh status
(setq my-modes '(rust-mode-hook
                 python-mode-hook
                 go-mode-hook
                 markdown-mode-hook
                 yaml-mode-hook))

(mapc (lambda (mode)
        (add-hook mode (lambda () (add-hook 'after-save-hook 'magit-refresh-status))))
      my-modes)

;; map over knows projects
(setq magit-repo-dirs
      (mapcar
       (lambda (dir)
         (substring dir 0 -1))
       (cl-remove-if-not
        (lambda (project)
          (unless (file-remote-p project)
            (file-directory-p (concat project "/.git/"))))
        (projectile-relevant-known-projects))))

(my-leader-def
 :states '(normal visual emacs)
 :keymaps 'override
 "g"  '(:ignore t :which-key "git")
 ;; "gsq" '(magit-rebase-squash :which-key "squash commits")
 "gs" '(magit-status :which-key "show status")
 "gb" '(magit-branch :which-key "show all branches")
 ;; "gco" '(magit-checkout :which-key "checkout branch")
 "gr" '(magit-rebase :which-key "rebase on a branch")
 "gc" '(magit-commit :which-key "commit")
 "gp" '(magit-push-popup :which-key "push"))

;; unbound suffix :
(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd ":") 'evil-ex))

(defun my-magit-setup ()
  (define-key evil-normal-state-local-map (kbd ":") 'evil-ex))

(add-hook 'magit-status-mode-hook 'my-magit-setup)

;; ignore mouse movement
(defun ignore-mouse (ret)
  (let ((debug-on-message "unbound suffix <mouse movement>"))
    (if (called-interactively-p 'interactive)
        ret
      (ignore-errors (funcall ret)))))

(advice-add 'magit-key-mode-error-message :around 'ignore-mouse)

