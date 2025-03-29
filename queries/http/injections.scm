;extends
;Comments
((comment) @injection.content
(#set! injection.language "comment"))

;Body
((json_body) @injection.content
(#set! injection.language "json"))

;xml
((xml_body) @injection.content
(#set! injection.language "xml"))

;graphql
((graphql_data) @injection.content
(#set! injection.language "graphql"))

;Scriptdefaulttojavascript
((#set! injection.language "javascript")
(comment
name: (_) @_name
(#eq? @_name "lang")
value: (_) @injection.language)?
.
(_
(script) @injection.content
(#offset! @injection.content 0 2 0 -2)))

