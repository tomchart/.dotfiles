; extends

(assignment_expression
  left: (variable_name
    (name) @_name (#match? @_name "SQL"))
  right: (encapsed_string
    (string_value) @sql))
