(defstruct garota-magica
  nome
  escuridao
  bruxas)

(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

(defun purifica (g quantidade)
  (let ((nova-escuridao (if (>= quantidade (garota-magica-escuridao g))
                            0
                            (- (garota-magica-escuridao g) quantidade))))
    (make-garota-magica :nome (garota-magica-nome g)
                        :escuridao nova-escuridao
                        :bruxas (garota-magica-bruxas g))))

(defun main ()
  (let ((item1 (make-garota-magica :nome "Item A" :escuridao 40 :bruxas 3))
        (item2 (make-garota-magica :nome "Item B" :escuridao 75 :bruxas 5))
        (item3 (make-garota-magica :nome "Item C" :escuridao 20 :bruxas 1))
        (item4 (make-garota-magica :nome "Item D" :escuridao 10 :bruxas 0)))
    (let ((grupo-inicial (list item1 item2 item3)))
      (write-line (format nil "~a" (escuridao-total grupo-inicial)))
      (write-line (format nil "~a" (total-de-bruxas grupo-inicial)))
      (let ((grupo-novo (cons item4 grupo-inicial)))
        (write-line (format nil "~a" (escuridao-total grupo-inicial)))
        (write-line (format nil "~a" (escuridao-total grupo-novo)))
        (let ((item-purificado (purifica item2 30)))
          (write-line (format nil "~a" (garota-magica-escuridao item2)))
          (write-line (format nil "~a" (garota-magica-escuridao item-purificado))))))))

(main)
