(import (scheme base) (scheme write) (srfi-112))

(define-syntax show
  (syntax-rules ()
    ((show query)
     (begin (display 'query)
            (display " ")
            (display (query))
            (newline)))))

(show implementation-name)
(show implementation-version)
(show cpu-architecture)
(show machine-name)
(show os-name)
(show os-version)
