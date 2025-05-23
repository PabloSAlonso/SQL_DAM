-- EJEMPLO

CREATE TABLE prueba(id INT) ENGINE=InnoDB;
INSERT INTO prueba (id) VALUES (1),(2);

START TRANSACTION;
INSERT INTO prueba VALUES (3);
SELECT * FROM prueba;
COMMIT;

-- TRANSACCIONES 

58.
START TRANSACTION;
INSERT INTO transacción VALUES (20);
SELECT * FROM transacciones;

59.
ROLLBACK;
SELECT * FROM transacciones;
-- No está agregado el valor 20 por haberse anulado sin realizar COMMIT

60.
START TRANSACTION;
INSERT INTO transacción VALUES (20);
SELECT * FROM transacciones;
-- No se agrega el valor por no haber realizado el COMMIT

62.
START TRANSACTION;
INSERT INTO transacción VALUES (20);
SELECT * FROM transacciones;
-- No se ve el dato introducido en la conexion2

63.
START TRANSACTION;
INSERT INTO transacción VALUES (20);
SELECT * FROM transacciones;
-- En la conexion1 se ve el dato ya que se ha realizado el commit
-- En la segunda tambien se ve ya que los datos de la tabla han sido cambiados

66.
START TRANSACTION;
INSERT INTO transacciones VALUES(100);
SELECT * FROM transacciones;
SAVEPOINT primerCheck;
SELECT * FROM transacciones;
UPDATE transacciones SET valores = 101 WHERE valores = 100;
SELECT * FROM transacciones;
SAVEPOINT segundoCheck;
SELECT * FROM transacciones;
INSERT INTO transacciones VALUES(102);
SELECT * FROM transacciones;
SAVEPOINT tercerCheck;
INSERT INTO transacciones VALUES (103);
SELECT * FROM transacciones;
ROLLBACK TO tercerCheck;
SELECT * FROM transacciones;
ROLLBACK TO segundoCheck;
SELECT * FROM transacciones;
COMMIT;
-- Aqui hemos salido ya de la transaccion 
-- por lo que dará error por no existir ya los savepoints
SELECT * FROM transacciones;
ROLLBACK TO primerCheck;
SELECT * FROM transacciones;

67.
START TRANSACTION;
INSERT INTO transacciones VALUES(110);
SAVEPOINT primerCheck;
INSERT INTO transacciones VALUES (111);
CREATE DATABASE tema9;
-- Crear una base de datos tiene un commit integrado 
-- por lo que el savepoint ya no existe por haberse 
-- realizado la transacción
ROLLBACK TO primerCheck;


68.
BEGIN;
INSERT INTO transacción VALUES(120);
SAVEPOINT punto1;
INSERT INTO transacción VALUES(121);
SAVEPOINT punto1;
ROLLBACK TO punto1;
-- Vuelve al que hemos creado de ultimo porque lo sobreescribe
INSERT INTO transacción VALUES(122);
COMMIT;
-- Aqui hemos salido ya de la transaccion
-- por lo que dará error por no existir ya los savepoints
ROLLBACK TO punto1;

69.
LOCK TABLES transacciones READ;
-- Podemos visualizar en las dos conexiones
-- Al insertar en la 1 da error de que esta bloqueada
-- Al insertar en la dos se queda a la espera
UNLOCK TABLES;

70.
LOCK TABLES transacciones WRITE;
-- En la 1 se puede sin problema hacer todo
-- En la 2 nos deja a la espera cualquier consulta que hagamos
UNLOCK TABLES;

71.
-- El primer bloqueo se hace sin problemas
-- El segundo queda a espera por ser escritura
-- El tercero queda a espera por estar despues del de escritura  