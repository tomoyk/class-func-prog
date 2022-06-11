(
    defun derive (expr var)
    (if (atom expr)
        ; 1次または定数
        (if (equal expr var)
            1
            0
        )
        (let (
                (operator (first expr))
                (arg1 (second expr))
                (arg2 (third expr))
            )
            (cond
                ((equal operator '+) (derive-add var arg1 arg2))
                ((equal operator '-) (derive-sub var arg1 arg2))
                ((equal operator '*) (derive-mlt var arg1 arg2))
                ((equal operator '/) (derive-div var arg1 arg2))
                ((equal operator 'sin) (derive-sin var arg1))
                ((equal operator 'cos) (derive-cos var arg1))
                ((equal operator 'tan) (derive-tan var arg1))
                ((equal operator 'log) (derive-log var arg1))
                (t (print "Error") (print operator))
            )
        )
    )
)
(
    defun debug-print (var arg1 arg2)
    (print '---start)
    (print var)
    (print arg1)
    (print arg2)
    (print '---end)
)
(
    defun derive-add (var arg1 arg2)
    ; (debug-print var arg1 arg2)
    (list '+ (derive var arg1) (derive var arg2))
)
(
    defun derive-sub (var arg1 arg2)
    ; (debug-print var arg1 arg2)
    (list '- (derive var arg1) (derive var arg2))
)
(
    defun derive-mlt (var arg1 arg2)
    ; (debug-print var arg1 arg2)
    (list '+
        (list (derive arg1 var) arg2)
        (list arg1 (derive arg2 var))
    )
)
(
    defun derive-div (var arg1 arg2)
    ; (debug-print var arg1 arg2)
    (list '/
        (list '-
            (list '* (derive arg1 var) arg2)
            (list '* arg1 (derive arg2 var))
        )
        (list '* arg2 arg2)
    )
)
(
    defun derive-sin (var arg1)
    ; (debug-print var arg1 0)
    (list '*
        (derive arg1 var)
        (list 'cos arg1)
    )
)
(
    defun derive-cos (var arg1)
    (list '*
        (list '*
            -1
            (derive arg1 var)
            (list 'sin arg1)
        )
    )
)
(
    defun derive-tan (var arg1)
    (list '/
        (derive arg1 var)
        (list '* (list 'cos var) (list 'cos var))
    )
)
(
    defun derive-log (var arg1)
    (list '/ (derive arg1 var) arg1)
)
