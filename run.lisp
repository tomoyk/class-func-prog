(load "derive.lisp")

(
    defun start-derive(expr)
    (prin1 'expr=)
    (prin1 expr)
    (derive expr 'x)
)

; Atom => 0
(start-derive 1)

; Atom => 1
(start-derive 'x)

; 加算 => 1
(start-derive '(+ x 3))

; 減算 => -1
(start-derive '(- x 3))

; 乗算 => 2x
(start-derive '(* x x))

; 除算 => - 1/(x+2)(x+2)
(start-derive '(/ 1 (+ x 2)))

; 正弦 => cos(3x)
(start-derive '(sin (* 3 x)))

; 余弦 => -2sin(2x)
(start-derive '(cos (* 2 x)))

; 正接 => 1/(cos(x) * cos(x))
(start-derive '(tan (* x 2)))

; 対数 => 1/2x
(start-derive '(log (* 2 x)))
