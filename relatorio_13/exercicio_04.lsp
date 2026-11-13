(defstruct dominio
  nome
  elemento
  dificuldade
  mora)

(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro 1.2)
    (otherwise 1)))

(defun recompensa-final (d)
  (* (dominio-mora d) (bonus-elemental (dominio-elemento d))))

(defun rota (lista dificuldade-maxima)
  (let* ((filtrados (remove-if-not (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima)) lista))
         (textos (mapcar (lambda (d) (format nil "~a - ~a" (dominio-nome d) (recompensa-final d))) filtrados)))
    textos))

(defun main ()
  (let ((item1 (make-dominio :nome "Item A" :elemento :pyro :dificuldade 1 :mora 100))
        (item2 (make-dominio :nome "Item B" :elemento :hydro :dificuldade 2 :mora 200))
        (item3 (make-dominio :nome "Item C" :elemento :electro :dificuldade 3 :mora 300))
        (item4 (make-dominio :nome "Item D" :elemento :cryo :dificuldade 4 :mora 400))
        (item5 (make-dominio :nome "Item E" :elemento :anemo :dificuldade 5 :mora 500)))
    (let ((lista (list item1 item2 item3 item4 item5)))
      (dolist (txt (rota lista 3))
        (write-line txt))
      (write-line (format nil "~a" (reduce #'+ (mapcar #'recompensa-final lista))))
      (let ((copia (copy-dominio item1)))
        (setf (dominio-mora copia) 999)
        (write-line (format nil "~a" (dominio-mora copia)))
        (write-line (format nil "~a" (dominio-mora item1)))))))

(main)
