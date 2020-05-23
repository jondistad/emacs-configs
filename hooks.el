;; Org-mode
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

;; Paredit
(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C-<backspace>") 'paredit-backward-kill-word)
     (define-key paredit-mode-map (kbd "C-w") 'paredit-kill-region)
     (define-key paredit-mode-map (kbd "M-[") 'paredit-wrap-square)
     (define-key paredit-mode-map (kbd "M-{") 'paredit-wrap-curly)
     (define-key paredit-mode-map (kbd "{") 'paredit-open-curly)
     (define-key paredit-mode-map (kbd "}") 'paredit-close-curly)))

;; Elisp
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))

;; Clojure
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
     (add-hook 'clojure-mode-hook 'enable-paredit-mode)
     (add-hook 'clojure-mode-hook 'cider-mode)))
(eval-after-load 'cider-mode
  '(progn
     (add-hook 'cider-interaction-mode-hook 'cider-turn-on-eldoc-mode)))

;; Scheme

(add-hook 'geiser-mode-hook 'enable-paredit-mode)
(add-to-list 'auto-mode-alist '("\\.sls\\'" . scheme-mode))

;; Go
(require 'go-guru)
(eval-after-load 'go-mode
  '(progn
     (define-key go-mode-map (kbd "C-c C-w") 'gofmt)
     (define-key go-mode-map (kbd "M-.") 'go-guru-definition)))
(add-hook 'before-save-hook #'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (setq-local tab-width 4)))

;; Java
(setq jdecomp-decompiler-paths '((cfr . "~/.emacs.d/jar/cfr_0_122.jar")))
(add-to-list 'auto-mode-alist '("\\.class\\'" . jdecomp-mode))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Elixir

(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))

;; Javascript
;; (require 'prettier-js)
;; (add-hook 'js2-mode-hook 'prettier-js-mode)
;;(add-hook 'web-mode-hook 'prettier-js-mode)

;; Typescript (TIDE)

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

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; enable typescript-tslint checker
(require 'flycheck)
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; Scala

;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (require 'use-package)

;; (setq use-package-always-defer t
;;       use-package-always-ensure t)

;; (use-package scala-mode
;;   :mode "\\.s\\(cala\\|bt\\)$")

;; (use-package sbt-mode
;;   :commands sbt-start sbt-command
;;   :config
;;   (substitute-key-definition
;;    'minibuffer-complete-word
;;    'self-insert-commend
;;    minibuffer-local-completion-map)

;;   (setq sbt:program-options '("-Dsbt.supershell=false")))

;; (use-package flycheck
;;   :init (global-flycheck-mode))

;; (use-package lsp-mode
;;   :hook (scala-mode . lsp)
;;   :config (setq lsp-prefer-flymake nil))

;; (use-package lsp-ui)

;; ;;(use-package company-lsp)


