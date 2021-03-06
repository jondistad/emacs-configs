(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-args-compile (quote ("-c" "--nodejs" "--harmony")))
 '(coffee-args-repl (quote ("-i" "--nodejs" "--harmony")))
 '(custom-safe-themes
   (quote
    ("60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40" "43f70787edac4d896ec8e14579e52501665e61d5dc02de3c237f82fd5d8e0a6a" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(go-fontify-function-calls t)
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "node_modules")))
 '(magit-use-overlays nil)
 '(safe-local-variable-values
   (quote
    ((fill-width . 90)
     (ffip-additional-patterns "*.java")
     (clojure-local-indents
      (->listener defun))
     (clojure-local-indents
      (wrap-interface 1)
      (union-protocols 1)
      (add-protocol-defaults 1))
     (clojure-local-indents
      (->listener 0))
     (clojure-local-indents ->listener defun)
     (clojure-local-indents ->listener 0)
     (clojure-local-backtracking-indents
      (deflistener
        (4
         (2))))
     (clojure-local-backtracking-indents
      (deflistener
        (quote
         (4
          (2)))))
     (clojure-local-indents
      (deflistener defun))
     (scheme-mode
      (indent-tabs-mode)
      (eval put
            (quote pass-if)
            (quote scheme-indent-function)
            1)
      (eval put
            (quote pass-if-exception)
            (quote scheme-indent-function)
            2)
      (eval put
            (quote pass-if-equal)
            (quote scheme-indent-function)
            2)
      (eval put
            (quote with-test-prefix)
            (quote scheme-indent-function)
            1)
      (eval put
            (quote with-code-coverage)
            (quote scheme-indent-function)
            1)
      (eval put
            (quote with-statprof)
            (quote scheme-indent-function)
            1)
      (eval put
            (quote let-gensyms)
            (quote scheme-indent-function)
            1)
      (eval put
            (quote let-fresh)
            (quote scheme-indent-function)
            2)
      (eval put
            (quote with-fresh-name-state)
            (quote scheme-indent-function)
            1)
      (eval put
            (quote with-fresh-name-state-from-dfg)
            (quote scheme-indent-function)
            1)
      (eval put
            (quote build-cps-term)
            (quote scheme-indent-function)
            0)
      (eval put
            (quote build-cps-exp)
            (quote scheme-indent-function)
            0)
      (eval put
            (quote build-cps-cont)
            (quote scheme-indent-function)
            0)
      (eval put
            (quote rewrite-cps-term)
            (quote scheme-indent-function)
            1)
      (eval put
            (quote rewrite-cps-cont)
            (quote scheme-indent-function)
            1)
      (eval put
            (quote rewrite-cps-exp)
            (quote scheme-indent-function)
            1)
      (eval put
            (quote $letk)
            (quote scheme-indent-function)
            1)
      (eval put
            (quote $letk*)
            (quote scheme-indent-function)
            1)
      (eval put
            (quote $letconst)
            (quote scheme-indent-function)
            1)
      (eval put
            (quote $continue)
            (quote scheme-indent-function)
            2)
      (eval put
            (quote $kargs)
            (quote scheme-indent-function)
            2)
      (eval put
            (quote $kfun)
            (quote scheme-indent-function)
            4)
      (eval put
            (quote $letrec)
            (quote scheme-indent-function)
            3)
      (eval put
            (quote $kclause)
            (quote scheme-indent-function)
            1)
      (eval put
            (quote $fun)
            (quote scheme-indent-function)
            1)
      (eval put
            (quote syntax-parameterize)
            (quote scheme-indent-function)
            1))
     (c-mode
      (c-file-style . "gnu"))
     (scheme-program-name . "guile")
     (tab-witdh . 8)
     (scheme-local-indents
      (if* 1)
      (unless 1)
      (unless* 1)
      (if-not 1)
      (if-not* 1)
      (when 1)
      (when* 1)
      (when-not 1)
      (when-not* 1)
      (case-lambda 0)
      (add-inline defun))
     (scheme-local-indents
      (if* 1)
      (unless 1)
      (unless* 1)
      (if-not 1)
      (if-not* 1)
      (when 1)
      (when* 1)
      (when-not 1)
      (when-not* 1)
      (case-lambda 0))
     (scheme-local-indents
      (if* 1)
      (unless 1)
      (unless* 1)
      (if-not 1)
      (if-not* 1)
      (when 1)
      (when* 1)
      (when-not 1)
      (when-not* 1)
      (case-lambda 1))
     (scheme-extra-keywords
      ("(\\_<\\(if\\*\\|unless\\*?\\|if-not\\*?\\|when\\(?:-not\\)?\\*?\\)\\_>" 1 font-lock-keyword-face))
     (scheme-extra-keywords
      ("\\(\\_<\\(if\\*\\|unless\\*?\\|if-not\\*?\\|when\\(?:-not\\)?\\*?\\)\\_>" 1 font-lock-keyword-face))
     (scheme-extra-keywords
      ("\\_<\\(if\\*\\|unless\\*?\\|if-not\\*?\\|when\\(?:-not\\*?\\)?\\)\\_>" 1 font-lock-keyword-face))
     (scheme-extra-keywords
      ("(\\(if\\*\\|unless\\*?\\|if-not\\*?\\|when\\(?:-not\\*?\\)?\\)" 1 font-lock-keyword-face))
     (scheme-local-indents
      (if* 1)
      (unless 1)
      (unless* 1)
      (if-not 1)
      (if-not* 1)
      (when 1)
      (when* 1)
      (when-not 1)
      (when-not* 1))
     (scheme-local-indents
      ("if'" 1)
      (unless 1)
      (if-not 1)
      (when 1)
      (when-not 1))
     (scheme-local-indents
      ("if'" 1))
     (scheme-local-indents
      (if
          (quote 1)))
     (scheme-program-name . "lein trampoline run")
     (clojure-local-indents
      (match 1))
     (clojure-defun-indents wrap-interface)
     (clojure-defun-indents
      (quote wrap-interface))
     (cider-lein-parameters . "repl")
     (scheme-program-name . "./lisp")
     (ffip-additional-patterns "*.c" "*.h")
     (ffip-additional-patterns ".c" ".h")
     (tab-indent-mode . t)
     (ffip-additional-patterns "*.conf" "*.dist" "routes" "*.ejs")
     (ffip-additional-patterns "*.conf" "*.dist" "routes"
                               (\, "*.ejs"))
     (ffip-limit 2048)
     (ffip-exclude-dirs "target" "node_modules" ".mocha" "modules")
     (ffip-additional-patterns "*.conf" "*.dist" "routes")
     (ffip-exclude-dirs "target" "node_modules" ".mocha"))))
 '(tab-width 2)
 '(tooltip-mode nil)
 '(user-mail-address "jon.distad@gmail.com"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "#F8F8F2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "apple" :family "Monaco"))))
 '(font-lock-builtin-face ((t (:foreground "#FD971F" :weight bold))))
 '(italic ((t (:slant normal)))))
