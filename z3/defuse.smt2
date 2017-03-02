; Modification example quoted from 19.1 datalog of Copmiler structure and optimization 2nd by NAKATA Ikuo

; Type
(define-sort vv () (_ BitVec 4))
(define-sort stm () (_ BitVec 8))

; Relation delcaration
(declare-rel reach (vv stm stm))
(declare-rel def (vv stm))
(declare-rel next (stm stm))
(declare-rel exit (stm))
(declare-rel succ (stm stm))
(declare-rel use (vv stm))
(declare-rel defuse (vv stm stm))

; Var declaration
(declare-var x vv)
(declare-var y vv)
(declare-var p stm)
(declare-var q stm)
(declare-var r stm)
(declare-var s stm)

; Rule
(rule (=> (and (def x p) (next p q)) (reach x p q)))
(rule (=> (and (reach x p r) (def y r) (next r q) (not (= x y))) (reach x p q)))
(rule (=> (and (reach x p r) (exit r) (succ r s)) (reach x p s)))
(rule (=> (and (reach x p q) (use x q)) (defuse x p q)))

; Fact
(rule (next #x01 #x02))
(rule (next #x02 #x0b))
(rule (next #x03 #x0c))
(rule (next #x04 #x05))
(rule (next #x05 #x0d))
(rule (next #x06 #x07))
(rule (next #x07 #x0e))
(rule (next #x08 #x0f))
(rule (exit #x0b))
(rule (exit #x0c))
(rule (exit #x0d))
(rule (exit #x0e))
(rule (exit #x0f))
(rule (exit #x10))
(rule (succ #x0b #x03))
(rule (succ #x0c #x04))
(rule (succ #x0d #x03))
(rule (succ #x0d #x06))
(rule (succ #x0e #x08))
(rule (succ #x0e #x10))
(rule (succ #x0f #x10))
(rule (succ #x10 #x04))
(rule (def #x1 #x02))
(rule (def #x1 #x03))
(rule (def #x1 #x08))
(rule (def #x2 #x01))
(rule (def #x2 #x04))
(rule (def #x2 #x06))
(rule (def #x3 #x05))
(rule (def #x3 #x07))
(rule (use #x1 #x03))
(rule (use #x1 #x06))
(rule (use #x1 #x07))
(rule (use #x2 #x04))
(rule (use #x2 #x05))

; Query
(declare-rel qu (vv stm stm))

(rule (=> (defuse x p q) (qu x p q)))
(query qu :print-answer true)








