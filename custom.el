(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comint-process-echoes t)
 '(flycheck-haskell-liquid-executable "stack exec liquid")
 '(geiser-chez-binary "scheme-akku")
 '(geiser-default-implementation (quote chez))
 '(geiser-implementations-alist
   (quote
    (((regexp "\\.ss$")
      chez)
     ((regexp "\\.sls$")
      chez)
     ((regexp "\\.scm$")
      chez)
     ((regexp "\\.rkt[dl]?$")
      racket)
     ((regexp "\\.release-info$")
      chicken)
     ((regexp "\\.meta$")
      chicken)
     ((regexp "\\.setup$")
      chicken)
     ((regexp "\\.def$")
      chez)
     ((regexp "\\.pkg$")
      mit)
     ((regexp "\\.sld$")
      chibi)
     ((regexp "\\.scm$")
      guile)
     ((regexp "\\.ss$")
      racket)
     ((regexp "\\.scm$")
      chicken)
     ((regexp "\\.ss$")
      chez)
     ((regexp "\\.scm$")
      mit)
     ((regexp "\\.scm$")
      chibi)
     ((regexp "\\.scm$")
      gambit))))
 '(go-fontify-function-calls t)
 '(gofmt-command "goimports")
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "node_modules" "target" ".ensime_cache")))
 '(magit-branch-arguments nil)
 '(magit-use-overlays nil)
 '(package-selected-packages
   (quote
    (web-mode elixir-mode geiser company-lsp lsp-ui lsp-mode sbt-mode scala-mode use-package exwm haskell-emacs yaml-mode wgrep-ag tuareg toml-mode tide solarized-theme racer purescript-mode protobuf-mode noflet nodejs-repl nginx-mode neotree multiple-cursors monokai-theme markdown-mode magit llvm-mode liquid-types less-css-mode jsx-mode js2-mode jdecomp irony idris-mode haml-mode go-guru go-errcheck go-eldoc go-autocomplete gherkin-mode ghc flycheck-mix flycheck-flow flycheck-elixir flycheck-color-mode-line flx-ido flow-minor-mode find-file-in-repository find-file-in-project fill-column-indicator feature-mode espuds dockerfile-mode cql-mode company-coq commander coffee-mode clojurescript-mode clojure-project-mode cider caml ansi alchemist ag)))
 '(rust-format-on-save t)
 '(safe-local-variable-values
   (quote
    ((scheme-local-indents
      (with-output-language defun)
      (nanopass-case defun))
     (scheme-local-indents
      (with-output-language 2)
      (nanopass-case 2))
     (clojure-local-indents
      (match defun)
      (deftype defun)
      (switch defun)
      (select defun)
      (struct defun)
      (interface defun)
      (type-switch defun)
      (if\# defun)
      (for\# defun))
     (clojure-local-indents
      (indent defun)
      (returning defun)
      (run-write defun)
      (run-scrape defun)
      (run-typer defun))
     (clojure-local-indents
      (result-let 1)
      (clj-do! 1)
      (ml-do! 0)))))
 '(tab-width 2)
 '(tooltip-mode nil)
 '(user-mail-address "jon.distad@gmail.com"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "#F8F8F2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal))))
 '(font-lock-builtin-face ((t (:foreground "#FD971F" :weight bold))))
 '(idris-semantic-function-face ((t (:foreground "forest green"))))
 '(idris-semantic-type-face ((t (:foreground "deep sky blue"))))
 '(isearch ((t (:background "light steel blue" :foreground "black"))))
 '(italic ((t (:slant normal))))
 '(show-paren-match ((t (:background "#272822" :foreground "gold1" :inverse-video t :weight normal)))))
