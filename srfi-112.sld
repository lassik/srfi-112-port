(define-library (srfi-112)
  (import (scheme base)
          (chibi ast))
  (export implementation-name
          implementation-version
          cpu-architecture
          machine-name
          os-name
          os-version)
  (cond-expand
    (chibi (include-shared "chibi")))
  (begin

    (define (implementation-name)
      "Chibi-Scheme")

    (define (implementation-version)
      chibi-version)

    (define (cpu-architecture)
      (%uname-machine))

    (define (machine-name)
      (%uname-nodename))

    (define (os-name)
      (%uname-sysname))

    (define (os-version)
      (%uname-release))))
