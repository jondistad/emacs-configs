(add-to-list 'load-path "~/.emacs.d/opt/")
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'cl)
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
             ;; '("marmalade" . "http://marmalade-repo.org/packages/")
             )
;; (setq package-archives '(;("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ))

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

;; (add-hook 'after-init-hook 'global-company-mode)

(defun init-coq ()
  (interactive)
  (load "~/.emacs.d/lisp/PG/generic/proof-site")
  (require 'makam)
  (setq makam-keymap '()))
;; (init-coq)
(add-hook 'coq-mode-hook #'company-coq-mode)

;; (setq requiref-final-newline 'visit-save)

(setq geiser-guile-load-init-file-p t)

(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-x C-k") 'ido-kill-buffer)

;(add-to-list 'load-path "/Users/jon/.emacs.d")
(autoload 'forth-mode "gforth.el")
(autoload 'forth-block-mode "gforth.el")
(add-to-list 'auto-mode-alist '("\\.fs\\'" . forth-mode))

(autoload 'antlr-v4-mode "antlr-mode.el")
(add-to-list 'auto-mode-alist '("\\.g4\\'" . antlr-v4-mode))

(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))

(autoload 'capnp-mode "capnp-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.capnp\\'" . capnp-mode))

(add-to-list 'auto-mode-alist '("\\.class\\'" . jdecomp-mode))

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-c C-w") (lambda ()
                                  (interactive)
                                  (whitespace-cleanup)))

(global-set-key (kbd "s-u") 'revert-buffer)
(global-set-key (kbd "C-x a r") 'align-regexp)

(setq
 backup-by-copying t
 backup-directory-alist '(("." . "~/.emacs_backups"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

(cl-flet ((dir (d path) (concat d "/" path)))
  (let* ((home (getenv "HOME"))
         (goroot "/usr/lib/go-1.10")
         (gopath (dir home ".go"))
         (yarnpath (dir home ".yarn")))
    (let ((path (append (list (dir home ".local/bin"))
                        (file-expand-wildcards (dir home ".local/opt/*/bin"))
                        (list (dir home ".cargo/bin")
                              (dir goroot "bin")
                              (dir gopath "bin")
                              (dir yarnpath "bin")
                              "/usr/local/bin"
                              "/usr/local/sbin"
                              "/usr/bin"
                              "/bin"
                              "/usr/sbin"
                              "/sbin"))))
      (setq exec-path (delete-dups (copy-sequence (append path exec-path))))
      (setenv "PATH" (mapconcat 'identity path '":")))))
(setenv "NIX_PATH" "nixpkgs=/home/jon/.nix-defexpr/channels/nixpkgs")
(setenv "NIX_SSL_CERT_FILE" "/etc/ssl/certs/ca-certificates.crt")
(setenv "NODE_NO_READLINE" "1")
(setenv "GOROOT" "/usr/lib/go-1.10")
(setenv "GOPATH" "/home/jon/.go")
;; (setenv "JAVA_HOME" "/usr/lib/jvm/java-8-openjdk-amd64")
;(setenv "SCHEMEHEAPDIRS" "/Users/jon/local/lib/csv%v/%m")
;(setenv "NODE_PATH" "/Users/jon/local/opt/node/lib/node_modules")
;(setenv "LD_LIBRARY_PATH" "/usr/local/Cellar/llvm/3.5.0/lib") ; Necessary to dynamically load clang/llvm in guile

(load-theme 'monokai t)
;(setq solarized-broken-srgb nil)
;(load-theme 'solarized-dark t)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;(setq ido-use-faces nil)
;(setq flx-ido-use-faces nil)
(global-linum-mode)
(show-paren-mode)
(column-number-mode)
;(setq linum-format "%d ")
(setq-default indent-tabs-mode nil)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; (set-face-attribute 'default nil :font "Fantasque Sans Mono-13")
(set-default-font "Fantasque Sans Mono-13")
(defun fix-font ()
  (interactive)
  (set-default-font "Fantasque Sans Mono-13"))
;(color-theme-molokai)
(global-auto-revert-mode)

(when (eq system-type 'darwin)
  (setq ispell-program-name "/usr/local/bin/aspell"))

(require 'ensime)
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;; (add-hook 'scala-mode-hook #'yas-minor-mode)
(add-hook 'scala-mode-hook (lambda ()
                             (setq-local electric-indent-chars '(?\n ?\}))))
(setq ensime-startup-notification nil)
(setq ensime-startup-snapshot-notification nil)
;; (define-key company-active-map [tab] nil)

(add-hook 'shell-mode-hook (progn 'ansi-color-for-comint-mode-on))

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C-<backspace>") 'paredit-backward-kill-word)
     (define-key paredit-mode-map (kbd "C-w") 'paredit-kill-region)
     (define-key paredit-mode-map (kbd "M-[") 'paredit-wrap-square)
     (define-key paredit-mode-map (kbd "M-{") 'paredit-wrap-curly)
     (define-key paredit-mode-map (kbd "{") 'paredit-open-curly)
     (define-key paredit-mode-map (kbd "}") 'paredit-close-curly)))

(require 'go-guru)
(eval-after-load 'go-mode
  '(progn
     (define-key go-mode-map (kbd "C-c C-w") 'gofmt)
     (define-key go-mode-map (kbd "M-.") 'go-guru-definition)))
(add-hook 'before-save-hook #'gofmt-before-save)

(setq c-default-style "linux"
      c-basic-offset 4)

(require 'clojure-mode-extra-font-locking)

(add-to-list 'auto-mode-alist '("\\.\\(?:boot\\|hl\\)\\'" . clojure-mode))

(add-hook 'hack-local-variables-hook (lambda ()
                                       (mapcar (lambda (x) (put-clojure-indent (car x) (cadr x)))
                                               (if (boundp 'clojure-local-indents)
                                                   clojure-local-indents
                                                 nil))
                                       (mapcar (lambda (x)
                                                 (put (car x) 'scheme-indent-function (cadr x)))
                                               (if (boundp 'scheme-local-indents)
                                                   scheme-local-indents
                                                 nil))
                                       ;; (if (and (boundp 'show-fill-column) show-fill-column)
                                       ;;     (fci-mode +1))
                                       ))

(eval-after-load 'clojure-mode
  '(progn
     (add-hook 'clojure-mode-hook 'paredit-mode)
     (add-hook 'clojure-mode-hook 'cider-mode)))
(eval-after-load 'cider-mode
  '(progn
     (add-hook 'cider-interaction-mode-hook 'cider-turn-on-eldoc-mode)))
;; (eval-after-load 'cider-repl
;;   '(progn
;;      (add-hook 'cider-repl-mode-hook (lambda () (paredit-mode +1)))
;;      (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;;      (define-key cider-repl-mode-map (kbd "RET") (lambda ()
;;                                               (interactive)
;;                                               (if (eobp)
;;                                                   (funcall 'cider-repl-return)
;;                                                 (cl-flet ((cider-repl--input-complete-p (&rest args) nil))
;;                                                   (funcall 'cider-repl-return)))))))

(setq-default cider-repl-history-file "~/.cider-repl-history")

(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook (lambda ()
                               (paredit-mode +1)))
(add-hook 'c-mode-hook (lambda ()
                         (setq comment-start "// "
                               comment-end "")))

(add-hook 'coffee-mode-hook (lambda () (subword-mode +1)))

;; (add-hook 'haskell-mode-hook (lambda ()
;;                                (flycheck-mode)
;;                                (flycheck-select-checker 'haskell-stack-liquid)))
;; (add-hook 'haskell-mode-hook (lambda ()
;;                                (liquid-types-mode)))
(add-hook 'haskell-mode-hook (lambda () (turn-on-haskell-indentation)))

(defun indent-on-return (modes)
  (if modes
      (let* ((mode (car modes))
             (hook-name (intern (concat (symbol-name mode) "-hook"))))
        (add-hook `,hook-name (lambda ()
                                (local-set-key (kbd "RET") 'newline-and-indent)))
        (indent-on-return (cdr modes)))))

(indent-on-return '(c-mode-common
                    clojure-mode
                    emacs-lisp-mode
                    scheme-mode
                    scala-mode
                    ruby-mode
                    js2-mode
                    python-mode))

(mapc (lambda (s) (put s 'scheme-indent-function 'defun))
      (list 'run* 'run 'fresh 'conde 'module 'if))
;; (setq scheme-program-name "petite")
;; (setq scheme-program-name "csi")
(setq scheme-program-name "guile")

(defun run-local-scheme ()
  (interactive)
  (let ((scheme-program-name (if (boundp 'scheme-local-program-name)
                                 scheme-local-program-name
                               scheme-program-name)))
    (run-scheme)))

(setq org-todo-keywords '((sequence "TODO" "INPROGRESS" "COMPLETED" "FAILED")))
(setq org-todo-keyword-faces '(("INPROGRESS" . "yellow") ("COMPLETED" . "green") ("FAILED" . "red")))
(setq org-startup-folded 'showeverything)
(setq org-special-ctrl-a/e t)
(setq org-hide-leading-stars t)

(add-hook 'org-mode-hook
          (lambda ()
            (define-key org-mode-map (kbd "M-p") 'org-move-subtree-up)
            (define-key org-mode-map (kbd "M-n") 'org-move-subtree-down)
            (flyspell-mode)))

(add-to-list 'auto-mode-alist '("\\.js\\'" . jsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(require 'flycheck-flow)
(add-hook 'jsx-mode-hook
          (lambda ()
            (setq jsx-indent-level 2)
            ;; (flycheck-mode)
            ))

(with-eval-after-load 'flycheck
  (flycheck-add-mode 'javascript-flow 'flow-minor-mode)
  (flycheck-add-mode 'javascript-eslint 'flow-minor-mode)
  (flycheck-add-next-checker 'javascript-flow 'javascript-eslint))

(eval-after-load 'nginx-mode
  '(setq nginx-indent-level 2))
(eval-after-load 'coffee-mode
  '(setq coffee-tab-width 2))
(eval-after-load 'css-mode
  '(setq css-indent-offset 2))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(setq company-tooltip-align-annotations t)
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(defun slashify (name)
  (interactive
   (list (if (consp current-prefix-arg)
             (read-string "Slashify: ")
           (thing-at-point 'word))))
  (save-excursion
    (move-beginning-of-line nil)
    (open-line 1)
    (let* ((pre "/// ")
           (post (make-string (- 80 1 (string-width pre) (string-width name)) ?/)))
      (insert (concat pre name " " post)))))

(add-hook 'ponylang-mode-hook
          (lambda ()
            (define-key ponylang-mode-map (kbd "C-c /") 'slashify)
            (define-key ponylang-mode-map (kbd "C-c C-/") 'slashify)))

;; (require 'find-file-in-project)
;; (setq ffip-patterns (delete-dups
;;                      (append (list "*.scala" "*.coffee" "*.c" "*.cpp" "*.cc" "*.h" "*.hh" "*.hpp" "*.java" "*.hs")
;;                              ffip-patterns)))
;; (setq ffip-limit 5000)
;; (setq ffip-prefer-ido-mode t)

;; (defun find-file-in-project-with-options ()
;;   (interactive)
;;   (let ((ffip-find-options (if (boundp 'ffip-exclude-dirs)
;;                                (format "\\( %s \\)"
;;                                        (mapconcat (lambda (dir)
;;                                                     (format "-not -regex \".*/%s/.*\""
;;                                                             (replace-regexp-in-string "\\." "\\\\." dir)))
;;                                                   ffip-exclude-dirs
;;                                                   " -and "))
;;                              ffip-find-options))
;;         (ffip-patterns (if (boundp 'ffip-additional-patterns)
;;                            (append ffip-additional-patterns ffip-patterns)
;;                          ffip-patterns)))
;;     (find-file-in-project)))

(global-set-key (kbd "C-x M-f") 'find-file-in-repository)
(global-set-key (kbd "C-x M-g") 'ag-regexp)
(global-set-key (kbd "C-M-g") 'magit-status)
(global-set-key (kbd "M-k") 'kill-sexp)
;; (global-set-key (kbd "M-/") 'hippie-expand)


(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x C-<up>") 'windmove-up)
(global-set-key (kbd "C-x C-<down>") 'windmove-down)
(global-set-key (kbd "C-x C-<right>") 'windmove-right)
(global-set-key (kbd "C-x C-<left>") 'windmove-left)

(setq jdecomp-decompiler-paths '((cfr . "~/.emacs.d/jar/cfr_0_122.jar")))

(server-start)
