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
     (add-hook 'clojure-mode-hook 'paredit-mode)
     (add-hook 'clojure-mode-hook 'cider-mode)))
(eval-after-load 'cider-mode
  '(progn
     (add-hook 'cider-interaction-mode-hook 'cider-turn-on-eldoc-mode)))

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
