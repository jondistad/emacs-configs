;; makam.el - syntax highlighting for makam

(setq makam-font-lock-keywords
      (let* ((builtins '("TODO.testcase" "and" "and_many" "append" "args.apply" "args.applyfull"
                         "assume" "assume_many" "assume_many_clauses" "assumemany" "bind"
                         "bindmany.apply" "bindmany.applysome" "bindmany.open" "bindmany.pair"
                         "bindmany.varnames" "bindone.apply" "bindone.open" "bindone.pair"
                         "bindone.varname" "body" "builtin.print_string" "builtin.refl.isnvar"
                         "catenable" "char_latin1" "char_letter" "cheapprint" "clause"
                         "clause.applies" "clause.demand" "clause.demand_and" "clause.demand_case"
                         "clause.demand_or" "clause.get_goal" "clause.get_guard" "clause.premise"
                         "cmd_many" "cmd_newclause" "cmd_newterm" "cmd_none" "cmd_query" "cmd_stage"
                         "concat" "concrete" "concrete.associate_name_and_var" "concrete.bindmany"
                         "concrete.bindmany.bind_c" "concrete.bindone" "concrete.cons"
                         "concrete.handle_unresolved_name" "concrete.lambda" "concrete.name"
                         "concrete.name_of_var" "concrete.names_of" "concrete.names_of_aux"
                         "concrete.nil" "concrete.pattern_mode" "concrete.pick_name"
                         "concrete.pick_name_prefix" "concrete.pick_name_prefix_userdef"
                         "concrete.pick_name_userdef" "concrete.pick_namespace"
                         "concrete.pick_namespace_userdef" "concrete.resolve" "concrete.resolve_"
                         "concrete.resolve_aux" "concrete.resolve_conversion"
                         "concrete.resolve_name_or_var" "concrete.reverse_unresolved_var"
                         "concrete.var" "concrete.var_of_name" "concrete.vars_in_context"
                         "concrete.vbindmany" "cons" "contains" "debug" "debugfull" "debugtypes"
                         "demand.and" "demand.aux_demand" "demand.case" "demand.case_otherwise"
                         "demand.most_recent" "demand.or" "dyn" "dyn.call" "dyn.eq" "dyn.from_args"
                         "dyn.to_args" "either" "eq" "eq_nounif" "eqv" "eqv_args" "eqv_assigned"
                         "eqv_aux" "eqv_unifvars" "expansion" "expansion.isconcrete" "expansion.str"
                         "failure" "false" "filter" "filtermap" "find" "fluid.current_value"
                         "fluid.get" "fluid.inc" "fluid.modify" "fluid.set" "foldl" "foldl_invert"
                         "foldr" "foldr_invert" "for_least_upto" "for_least_upto_aux" "forall.apply"
                         "forall_private.poly" "forall_private.polyargs" "forall_private.polybvar"
                         "freevars" "freevars_aux" "freevars_aux_" "freevars_dontadd"
                         "full_reify.reify" "generic.fold" "guard" "guardmany" "guardmany_aux" "ifte"
                         "infoofvar" "instantiate" "iso.backward" "iso.bidi" "iso.compose"
                         "iso.forward" "iso.inverse" "iso.iso" "iso.run" "isocast" "isocast_def"
                         "isocast_find" "js.eval" "length" "lessthan" "list.last" "locget" "locset"
                         "log.error" "log.info" "log.level" "log.warn" "log_error"
                         "log_error_with_both_locs" "log_info" "log_info_do" "log_warning"
                         "log_warning_do" "makam.antiquote" "makam.apptyp_reified" "makam.baseident"
                         "makam.basetyp_reified" "makam.ident" "makam.ident_" "makam.ident_first"
                         "makam.ident_rest" "makam.int_literal" "makam.int_literal_"
                         "makam.int_literal_char" "makam.lambda" "makam.lambda_depth"
                         "makam.string_literal" "makam.string_literal_" "makam.string_literal_char"
                         "makam.string_literal_char_str" "makam.string_literal_str"
                         "makam.string_of_head" "makam.string_of_var" "makam.tarrow" "makam.tbase"
                         "makam.term" "makam.term_arg" "makam.term_args_str" "makam.term_str"
                         "makam.tunif" "makam.typ_reified" "makam.unifident" "makam.unifident_"
                         "makam.unifident_first" "makam.unifident_rest" "map" "map.add_new"
                         "map.add_or_update" "map.elem" "map.empty" "map.find" "map.from_list"
                         "map.headtail" "map.mapvalues" "map.merge_onto" "map.raw_length" "map.remove"
                         "map.remove_if_member" "map.to_list" "map.union" "mkforall" "mult"
                         "nameofvar" "newfmeta" "newmeta" "newnmeta" "newvar" "nil" "none" "not"
                         "once" "or" "or_many" "pattern_match" "peg.action" "peg.anychar" "peg.apply"
                         "peg.apply_convert" "peg.assume" "peg.bind" "peg.builtin" "peg.captured"
                         "peg.charclass" "peg.choices" "peg.cons" "peg.def_parser_js"
                         "peg.def_toplevel_parser_js" "peg.empty" "peg.eof" "peg.eval"
                         "peg.eval_parser_js" "peg.eval_when" "peg.exact"
                         "peg.expansion_to_stringprop" "peg.extern_def" "peg.external"
                         "peg.gather_used_results" "peg.gather_used_results_aux"
                         "peg.gen_dictionary_js" "peg.gen_dictionary_js_aux" "peg.gen_parse_js"
                         "peg.gen_toplevel_parser_js" "peg.gen_toplevel_parser_js_cached"
                         "peg.generated_toplevel_parser_js" "peg.get_external_peg_definition"
                         "peg.get_peg_definition" "peg.ignore" "peg.inline" "peg.js_builtin"
                         "peg.jsresult" "peg.key_of" "peg.key_of_var" "peg.letrec" "peg.lookahead"
                         "peg.many" "peg.neg" "peg.nil" "peg.once_or_many" "peg.open_end"
                         "peg.open_next" "peg.option" "peg.parse" "peg.parse_opt"
                         "peg.parse_res_counter" "peg.peg_args_change_bodytype"
                         "peg.peg_list.assume_many" "peg.peg_list.mapi" "peg.peg_list.mapi_aux"
                         "peg.peg_list.open" "peg.quote_expansion_js" "peg.quote_paren_term_js"
                         "peg.quote_parse_res_js" "peg.quote_string_js" "peg.quote_term_js"
                         "peg.quote_terms_js" "peg.quote_used_results_js" "peg.quote_var_counter"
                         "peg.quote_var_js" "peg.result" "peg.rule" "peg.seq" "peg.string_transform"
                         "peg.string_transform_gen_vars" "peg.stringappend" "peg.stringmany"
                         "peg.syntax" "peg.transform" "peg.transform_convert" "peg.void" "peg.ws"
                         "peg.ws_char" "peg.ws_opt" "persistent_cache.predicate" "plus" "pmatch_aux"
                         "prefix" "pretty.anychar" "pretty.builtin" "pretty.captured"
                         "pretty.charclass" "pretty.choices" "pretty.cons" "pretty.const"
                         "pretty.empty" "pretty.fresh_args" "pretty.get_pretty_definition"
                         "pretty.many" "pretty.nil" "pretty.pretty" "pretty.pretty_args" "pretty.rule"
                         "pretty.syntax" "pretty.unapply" "pretty.untransform" "pretty.void" "print"
                         "print_current_metalevel" "print_string" "print_tests" "refl.absunif"
                         "refl.allconstants" "refl.assume_get" "refl.assume_get_applicable"
                         "refl.assume_reset" "refl.decomposeunif" "refl.duphead" "refl.fromstring"
                         "refl.getunif" "refl.headargs" "refl.headname" "refl.isbasehead"
                         "refl.isbaseterm" "refl.isbvar" "refl.isconst" "refl.isfun" "refl.isfvar"
                         "refl.islambdaunif" "refl.isnvar" "refl.isunif" "refl.lookup" "refl.monotyp"
                         "refl.open_constraints" "refl.recomposeunif" "refl.rules_get"
                         "refl.rules_get_applicable" "refl.sameunif" "refl.statehash"
                         "refl.temp.dyneq" "refl.typstring" "refl.unifmetalevel"
                         "refl.userdef.absunif" "refl.userdef.absunif_" "refl.userdef.absunif_aux"
                         "refl.userdef.getunif" "refl.userdef.getunif_" "refl.userdef.getunif_aux"
                         "reflect" "reified.bvar" "reified.const" "reified.lambda" "reified.nvar"
                         "reified.term" "reified.unifvar" "reified_args.map" "reified_unif" "reify"
                         "reify1" "reify2" "reify3" "reify4" "reify5" "reify6" "reify_args"
                         "reify_var" "removableguard" "reverse" "reverse_aux" "run_tests" "set.ccons"
                         "set.diff" "set.member" "set.merge" "set.remove" "set.remove_if_member"
                         "set.to_list" "snoc" "some" "string.append" "string.capitalize"
                         "string.concat" "string.concat_backwards" "string.contains" "string.explode"
                         "string.headtail" "string.initlast" "string.lowercase" "string.readcachefile"
                         "string.readfile" "string.repeat" "string.split_at_first"
                         "string.starts_with" "string.uppercase" "string.writecachefile"
                         "string.writefile" "structural" "success" "syntax.anychar" "syntax.apply"
                         "syntax.builtin" "syntax.captured" "syntax.char_once_or_many"
                         "syntax.charclass" "syntax.charcons" "syntax.charmany" "syntax.charsnoc"
                         "syntax.choices" "syntax.cons" "syntax.def_js" "syntax.def_toplevel_js"
                         "syntax.empty" "syntax.exact" "syntax.group" "syntax.inline" "syntax.iso"
                         "syntax.list_sep" "syntax.list_sep_plus" "syntax.many" "syntax.nil"
                         "syntax.once_or_many" "syntax.option" "syntax.optunit" "syntax.parse"
                         "syntax.parse_opt" "syntax.pretty" "syntax.rule" "syntax.run"
                         "syntax.string_join" "syntax.to_peg" "syntax.to_peg_args" "syntax.to_pretty"
                         "syntax.to_pretty_args" "syntax.token" "syntax.token_id" "syntax.transform"
                         "syntax.void" "syntax.ws_empty" "syntax.ws_newline" "syntax.ws_space"
                         "syntax_rules" "syntax_syntax.appl" "syntax_syntax.appl_str"
                         "syntax_syntax.args" "syntax_syntax.args_str" "syntax_syntax.base"
                         "syntax_syntax.base_str" "syntax_syntax.choices" "syntax_syntax.choices_str"
                         "syntax_syntax.choices_str_cached" "syntax_syntax.syndef"
                         "syntax_syntax.syndef_many" "syntax_syntax.syndef_str"
                         "syntax_syntax.syndef_str_cached" "syntax_syntax.syntax_rule_clause"
                         "testcase" "testing_private.handle_failure" "testing_private.handle_result"
                         "testing_private.print_tests_aux" "testing_private.run_test" "tostring"
                         "tostring_qualified" "trace" "true" "tuple" "tuple.dynlist" "tuple.fst"
                         "tuple.map" "tuple.ofdynlist" "tuple.snd" "typ.eq" "typ.isunif"
                         "unif_alpha_eqv" "unifvars" "unifvars_aux" "unifvars_aux_" "unify" "unique"
                         "unit" "unless" "unless_many" "vbindmany.apply" "vbindmany.bind"
                         "vbindmany.body" "vbindmany.open" "vbindmany.pair" "vbindmany.varnames"
                         "vector.assumemany" "vector.map" "verbose_run_tests" "whenclause" "withall"
                         "without_eqv_refl" "zip"))
             (keywords '("type" "fun" "prop"))
             (builtins-re (regexp-opt builtins 'symbols))
             (keywords-re (regexp-opt keywords 'symbols)))
        `((,builtins-re . font-lock-builtin-face)
          (,keywords-re . font-lock-keyword-face))))

(define-derived-mode makam-mode fundamental-mode "Makam"
  "Major mode for editing makam files"

  (setq font-lock-defaults '((makam-font-lock-keywords))))

;; (require 'proof-easy-config)
;; (require 'proof-syntax)

;; (proof-easy-config 'makam "Makam"

;;  proof-prog-name		     "makam"
;;  proof-script-command-end-regexp     "\\.[ \n\r\t]\\|\\?[ \n\r\t]"        ;; end of commands
;;  proof-script-comment-start          "(*"	;; comments
;;  proof-script-comment-end            "*)"	;; comments
;;  proof-shell-annotated-prompt-regexp "# " ;; matches prompts

;;  proof-shell-strip-crs-from-input nil
;;  proof-script-fly-past-comments  t

;;  proof-shell-error-regexp        "^.*Exception:\\|^.*failure\\|^.*Error:\\|^.*Failure:\\|^.*Camlp4:\\|^In .*:\\|Unchaught OCaml-level exception.*\\.\\|^Parsing error at\\|^Error in staged code"
;;  proof-shell-interrupt-regexp        "^.*Interrupted."
;;  proof-shell-result-start            ""
;;  proof-shell-result-end              "#"
;;  proof-shell-restart                 "%%reset.\n"
;;  proof-forget-id-command             "%%forget %s.\n"
;;  proof-shell-handle-output-system-specific
;;     '(lambda (cmd string) (proof-shell-display-output-as-response
;; 			     proof-shell-delayed-output-flags
;; 			     string))
    
;;  ;; next setting is just to prevent warning
;;  proof-save-command-regexp	proof-no-regexp
;;  )

(provide 'makam)
