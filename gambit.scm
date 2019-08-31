(c-declare "#include <sys/utsname.h>")

(define (displayln x)
  (display x)
  (newline))

(define %uname
  (c-lambda () scheme-object #<<c-lambda-end
    struct utsname names;
    ___SCMOBJ v, s;

    uname(&names);
    v = ___make_vector(___PSTATE, 5, ___FAL);
    ___NONNULLCHARSTRING_to_SCMOBJ(___PSTATE, names.sysname, &s,
                                   ___RETURN_POS);
    ___VECTORSET(v, 0, s);
    ___NONNULLCHARSTRING_to_SCMOBJ(___PSTATE, names.nodename, &s,
                                   ___RETURN_POS);
    ___VECTORSET(v, 4, s);
    ___NONNULLCHARSTRING_to_SCMOBJ(___PSTATE, names.release, &s,
                                   ___RETURN_POS);
    ___VECTORSET(v, 8, s);
    ___NONNULLCHARSTRING_to_SCMOBJ(___PSTATE, names.version, &s,
                                   ___RETURN_POS);
    ___VECTORSET(v, 12, s);
    ___NONNULLCHARSTRING_to_SCMOBJ(___PSTATE, names.machine, &s,
                                   ___RETURN_POS);
    ___VECTORSET(v, 16, s);
    ___return(v);
c-lambda-end
))

(define (implementation-name)
  "Gambit Scheme")

(define (implementation-version)
  (system-version-string))

(define (os-name)
  (vector-ref (%uname) 0))

(define (machine-name)
  (vector-ref (%uname) 1)) ; Posix nodename field

(define (os-version)
  (vector-ref (%uname) 2))

(define (cpu-architecture)
  (vector-ref (%uname) 4))

(define-macro (show query)
  `(begin (display ',query)
          (display " ")
          (display (,query))
          (newline)))

(show implementation-name)
(show implementation-version)
(show os-name)
(show os-version)
(show cpu-architecture)
(show machine-name)
