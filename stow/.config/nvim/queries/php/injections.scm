; extends

(assignment_expression
  left: (variable_name
    (name) @_name (#match? @_name "sql"))
  right: (encapsed_string
    (string_value) @sql))

(property_element
  (variable_name
    (name) @_name (#match? @_name "sql"))
  (property_initializer
    (encapsed_string
    (string_value) @sql)))
