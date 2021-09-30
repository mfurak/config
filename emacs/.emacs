;; ============================== MY CONFIG =================================

;; PACKAGES
;; --------------------------------------
(require 'package)

; list the packages you want
(setq package-list
      '(
	 ace-jump-mode
	 better-defaults
	 ;; blacken
	 comment-dwim-2
	 ;; ein
	 elpy
	 fill-column-indicator
	 flycheck
	 ;; jupyter
	 magit
	 ;; material-theme
	 ;; py-autopep8
	 ws-butler
	 ;; RUST
	 racer
	 company
	 rust-mode
       )
      )

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
			))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;; BASIC CUSTOMIZATION
;; --------------------------------------
(require 'fill-column-indicator)
(ido-mode 't)
(setq completion-ignore-case  t)
(setq inhibit-startup-screen t)
(setq-default buffer-file-coding-system 'utf-8-unix)
(global-linum-mode t)
(setq word-wrap t)
(tool-bar-mode -1)
(show-paren-mode t)
;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)
;; (setq indent-line-function 'insert-tab)
;; (setq tab-stop-list (number-sequence 0 200 4))
;; (setq default-tab-width 1)

;; enable recent files menu
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(setq recentf-max-saved-items 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; change location of backup files
(defvar --backup-directory "~/emacs_saves")
(if (not (file-exists-p --backup-directory))
	(make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq backup-by-copying t)

;; remove trailing whitespace on save
;; autoload ws-butler on file open
(add-hook 'find-file-hook #'ws-butler-global-mode)
(setq require-final-newline t)

;; THEME
;; --------------------------------------
;; (load-theme 'material-light t)


;; KEY CONFIGURATION
;; --------------------------------------
(define-key global-map (kbd "M-j") 'ace-jump-mode)
(global-set-key (kbd "M-;") 'comment-dwim-2)


;; RUST CONFIGURATION
;; --------------------------------------
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;; PYTHON CONFIGURATION
;; --------------------------------------
(elpy-enable)

;; Wrap suggestions at the end
(setq company-selection-wrap-around t)

;; add support for fill column bar
(add-hook 'python-mode-hook 'fci-mode)
(setq elpy-rpc-python-command "python3")
(setq elpy-rpc-virtualenv-path (quote current))

;; Use python3 as the shell interpreter
(setq python-shell-interpreter "python3")

;; Other Choices for Python interpreters
;; ;; Interactive Python - Use the Python standard interpreter (default):
;; (setq python-shell-interpreter "python3"
;;       python-shell-interpreter-args "-i")

;; ;; Interactive Python - Use Jupyter console (recommended for interactive Python):
;; (require 'jupyter)
;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;;              "jupyter")

;; ;; Interactive Python - Use IPython:
;; (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "-i --simple-prompt")

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
;; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; (TEMP) Fix for company not cooperating with fci-mode
(defvar-local company-fci-mode-on-p nil)

(defun company-turn-off-fci (&rest ignore)
  (when (boundp 'fci-mode)
    (setq company-fci-mode-on-p fci-mode)
    (when fci-mode (fci-mode -1))))

(defun company-maybe-turn-on-fci (&rest ignore)
  (when company-fci-mode-on-p (fci-mode 1)))

(add-hook 'company-completion-started-hook 'company-turn-off-fci)
(add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
(add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)
;; =============================== END OF MY CONFIG ==========================
