;; ex. 2.11

(define (positive? x) (>= x 0))
(define (negative? x) (< x 0))

(define (make-interval a b) (cons a b))

(define (upper-bound interval) (max ((car interval) (cdr interval))))
(define (lower-bound interval) (min ((car interval) (cdr interval))))

(define (mul-interval x y)
  (let ((xl (lower-bound x))
        (xu (upper-bound x))
        (yl (lower-bound y))
        (yu (upper-bound y)))
    (cond ((and (positive? xl) (positive? yl))
           (make-interval (* xl yl) (* xu yu)))
          ((and (positive? xl) (negative? yl))
           (make-interval (* xu yl) (* (if (negative? yu) xl xu) yu)))
          ((and (negative? xl) (positive? yl))
           (make-interval (* xl yu) (* xu (if (negative? xu) yl yu))))
          ((and (positive? xu) (positive? yu))
           (let ((l (min (* xl yu) (* xu yl)))
                 (u (max (* xl yl) (* xu yu))))
             (make-interval l u)))
          ((and (positive? xu) (negative? yu))
           (make-interval (* xu yl) (* xl yl)))
          ((and (negative? xu) (positive? yu))
           (make-interval (* xl yu) (* xl yl)))
          (else
           (make-interval (* xu yu) (* xl yl))))))
