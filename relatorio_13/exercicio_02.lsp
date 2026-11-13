(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "Leviata: mantenha distancia")
    (otherwise "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a - ~a - ~a - ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros)) catalogo))

(defparameter *catalogo*
  (list
   (make-criatura :nome "Item A" :bioma "Regiao 1" :profundidade 50 :perigo :inofensiva)
   (make-criatura :nome "Item B" :bioma "Regiao 2" :profundidade 200 :perigo :agressiva)
   (make-criatura :nome "Item C" :bioma "Regiao 3" :profundidade 500 :perigo :leviata)
   (make-criatura :nome "Item D" :bioma "Regiao 4" :profundidade 120 :perigo :inofensiva)))

(defun main ()
  (let ((textos-todos (mapcar #'descreve-criatura *catalogo*))
        (filtradas (abaixo-de 150 *catalogo*)))
    (dolist (txt textos-todos)
      (write-line txt))
    (let ((textos-filtradas (mapcar #'descreve-criatura filtradas)))
      (dolist (txt textos-filtradas)
        (write-line txt))
      (write-line (format nil "~a" (length filtradas)))
      (force-output))))

(main)
