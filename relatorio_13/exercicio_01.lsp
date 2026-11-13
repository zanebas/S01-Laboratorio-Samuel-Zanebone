(defstruct erva
  nome
  preco-por-grama
  toxicidade)

(defun classifica-erva (erva)
  (cond
    ((>= (erva-toxicidade erva) 7) "veneno")
    ((>= (erva-toxicidade erva) 4) "use com cuidado")
    (t "segura")))

(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))

(defun descreve-erva (erva)
  (format nil "~a - ~,2f - ~a"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))

(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      "Teste previo necessario"
      "Liberada para uso"))

(defun main ()
  (let* ((item1 (make-erva :nome "Item A" :preco-por-grama 12.5 :toxicidade 8))
         (item2 (make-erva :nome "Item B" :preco-por-grama 8.0 :toxicidade 5))
         (item3 (make-erva :nome "Item C" :preco-por-grama 4.25 :toxicidade 2))
         (lista (list item1 item2 item3)))
    (dolist (e lista)
      (format t "~a~%" (descreve-erva e))
      (format t "~a~%" (aviso e)))
    (format t "~,2f~%" (preco-da-dose item1 3))))

(main)
