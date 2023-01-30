; extends

(assignment_expression
  left: (variable_name
    (name) @_name (#match? @_name "sql"))
  right: (encapsed_string
    (string_value) @sql))
