INSERT INTO practica
VALUES(1, 'Juan', 30)

INSERT INTO practica
VALUES(2, 'Javier', 27)

UPDATE practica 
SET columnaB = 28
WHERE columnaA = 'Juan'

DELETE FROM practica 
WHERE columnaA = 'Juan'