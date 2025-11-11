#lang racket

;; 1. contar-pares
(define (contar-pares lst)
  (length (filter even? lst)))

;; 2. sumar-cuadrados
(define (sumar-cuadrados lst)
  (foldl (lambda (x acc) (+ acc (* x x))) 0 lst))

;; 3. procesar-lista
(define (procesar-lista lst f)
  (let* ([transformada (map f lst)]
         [suma (foldl + 0 transformada)])
    (list lst transformada suma)))

;; 4. promedio-positivos
(define (promedio-positivos lst)
  (let* ([positivos (filter positive? lst)]
         [suma (foldl + 0 positivos)])
    (if (null? positivos)
        0
        (/ suma (length positivos)))))

;; 5. maximo-funcional
(define (maximo-funcional lst)
  (foldl (lambda (x acc)
           (if (> x acc) x acc))
         (car lst)
         (cdr lst)))

;; 6. cuadrado en Racket
(define (cuadrado x)
  (* x x))
