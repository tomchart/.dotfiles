; extends

((heredoc_body) @injection.content
        (#set! injection.language "sql")
        (#set! injection.combined))

; (call_expression
;   arguments: (arguments ((string)+ @desc))
;   )
