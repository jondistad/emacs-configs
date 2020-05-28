
;; Packages

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(package-initialize)

(defun melpa-packages-enable ()
  (interactive)
  (unless (boundp 'package-archives-backup)
    (setq package-archives-backup (copy-alist package-archives))
    (setq package-archives (cons '("melpa" . "http://melpa.milkbox.net/packages/") package-archives))))
(defun melpa-packages-disable ()
  (interactive)
  (when (boundp 'package-archives-backup)
    (setq package-archives package-archives-backup)
    (makunbound 'package-archives-backup)))
(defun melpa-packages ()
  (interactive)
  (melpa-packages-enable)
  (package-list-packages))

;; EXWM

(when (getenv "EXWM")
  (require 'exwm)
  (require 'exwm-config)
  (exwm-config-default))

;; Load Customizations

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Visuals

(set-default-font "Fantasque Sans Mono-13")
(load-theme 'monokai t)
(show-paren-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode)

;; General Usability

(ido-mode)
(flx-ido-mode)
(setq-default indent-tabs-mode nil)
(global-auto-revert-mode)
(setq-default require-final-newline 'ask)

;; Autoloads

(add-to-list 'auto-mode-alist '("\\.s\\'" . nasm-mode))

;; Mode Hooks

(load "~/.emacs.d/hooks.el")

;; Additional Keybindings

(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-x M-f") 'find-file-in-repository)
(global-set-key (kbd "C-x M-g") 'ag-regexp)
(global-set-key (kbd "C-M-g") 'magit-status)
(global-set-key (kbd "M-k") 'kill-sexp)

(global-set-key (kbd "C-x C-k") 'ido-kill-buffer)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-c C-w") (lambda ()
                                  (interactive)
                                  (whitespace-cleanup)))

(global-set-key (kbd "s-u") 'revert-buffer)
(global-set-key (kbd "C-x a r") 'align-regexp)

;; Backup file settings

(setq
 backup-by-copying t
 backup-directory-alist '(("." . "~/.emacs_backups"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;; Shell

(cl-flet ((dir (d path) (concat d "/" path)))
  (let* ((home (getenv "HOME"))
         (path (append (list (dir home ".local/bin"))
                       (file-expand-wildcards (dir home ".local/opt/*/bin"))
                       (list (dir home ".cargo/bin")
                             (dir home ".yarn/bin")
                             "/usr/local/sbin"
                             "/usr/local/bin"
                             "/usr/bin"
                             "/usr/bin/site_perl"
                             "/usr/bin/vendor_perl"
                             "/usr/bin/core_perl"))))
    (setq exec-path (delete-dups (copy-sequence (append path exec-path))))
    (setenv "PATH" (mapconcat 'identity path '":"))
    (setenv "GIT_PAGER" "")
    (setenv "PAGER" "")))
