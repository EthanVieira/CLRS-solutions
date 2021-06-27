;; SICP Ex. 1.20

;;Normal-order evaluation:

  (define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

  (gcd 206 40)

  (if (= 40 0)
      206
      (gcd 40 (remainder 206 40))))

  (if (= (remainder 206 40) 0) ; evaluates this 'if' +1
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

  (if (= (remainder 40 (remainder 206 40)) 0) ; evaluates this 'if' + 2
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))


  (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ; evaluates this 'if' + 4
         (remainder 40 (remainder 206 40))
         (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; evaluates this + 11
              (remainder (remainder 40 (remainder 206 40))
                         (remainder (remainder 206 40)
                                    (remainder 40 (remainder 206 40))))))

;; 1 + 2 + 4 + 11 = 18 remainder procedures

;; Applicative-order evaluation

(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))) ; + 1 evaluation

(gcd 40 6)

(if (= 6 0)
    40
    (gcd 6 (remainder 40 6)))) ; + 1 evaluation

(gcd 6 4)

(if (= 4 0)
    6
    (gcd 4 (remainder 6 4)))) ; + 1 evaluation

(gcd 4 2)

(if (= 2 0)
    4
    (gcd 2 (remainder 4 2)))) ; + 1 evaluation

(gcd 2 0)

(if (= 0 0)
    2
    (gcd 2 (remainder 4 2)))) ; not evaluated

;; 1+1+1+1 = 4 remainder procedures
