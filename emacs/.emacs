;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; ============================== MY CONFIG =================================
;; PACKAGES
;; --------------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
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
    material-theme
    py-autopep8
  )
)

;; (mapc #'(lambda (package)
;;     (unless (package-installed-p package)
;;       (package-install package)))
;;       myPackages)

(require 'fill-column-indicator)	

;; BASIC CUSTOMIZATION
;; --------------------------------------
(ido-mode 't)
(setq completion-ignore-case  t)
(setq inhibit-startup-screen t)
(setq-default buffer-file-coding-system 'utf-8-unix)
(global-linum-mode t)
(setq word-wrap t)
(tool-bar-mode -1)
(show-paren-mode t)

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


;; THEME
;; --------------------------------------
(load-theme 'material-light t)


;; KEY CONFIGURATION
;; --------------------------------------
(define-key global-map (kbd "M-j") 'ace-jump-mode)
(global-set-key (kbd "M-;") 'comment-dwim-2)


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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ace-jump-mode better-defaults comment-dwim-2 elpy flycheck magit material-theme py-autopep8 fill-column-indicator))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
