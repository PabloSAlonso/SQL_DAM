-- 1. Crea una función que calcule el cuadrado de un número.
DELIMITER $$
CREATE FUNCTION cuadrado(num int) RETURNS int
BEGIN
RETURNS num * num;
END $$
DELIMITER ;

-- 2. Crea una función que pasándole una cadena de texto nos devuelva la cadena
-- concatenada con un guion y su longitud (por ejemplo, con la cadena 'hola'
-- devolverá 'hola - 4'). Tendrá que tener el comentario: "Mi primer procedimiento
-- almacenado".
DELIMITER $$
CREATE FUNCTION extensionCadena(cadena VARCHAR(255)) RETURNS VARCHAR(255)
COMMENT "Mi primer procedimiento almacenado"
    BEGIN
        RETURNS CONCAT(cadena ," - ", LENGTH(cadena));
    END $$
DELIMITER ;

-- 4. Crea el procedimiento, sin parámetros, prueba que nos permita listar todos los
-- empleados de la tabla emple.
DELIMITER $
CREATE PROCEDURE prueba()
BEGIN
SELECT * FROM empleados;
END $
DELIMITER ;

-- 5. Muestra todos los procedimientos creados.
SHOW PROCEDURE STATUS --LIKE '%';

-- 9. Muestra el código de creación del procedimiento prueba
SHOW CREATE PROCEDURE prueba;

-- 11. Modifica el procedimiento prueba para que tenga el comentario "Procedimiento
-- de prueba" y que se ejecute con los permisos del usuario que lo crea.
ALTER PROCEDURE prueba SQL SECURITY DEFINER COMMENT 'Procedimiento de prueba';

-- 14. Crear un procedimiento que liste un número (pasado como parámetro ) de filas
-- de la tabla emple. El procedimiento se ha de ejecutar con los permisos del
-- usuario que lo invoca.
DELIMITER $
CREATE PROCEDURE listar(IN numFilas int)
BEGIN
SELECT * FROM empleados LIMIT numFilas;
END $
DELIMITER ;

-- 15. Crea un procedimiento que devuelva, como parámetro, el máximo salario de la
-- tabla emple.

DELIMITER $
CREATE PROCEDURE maxSalario(OUT maximo int)
BEGIN
SELECT salario INTO maximo FROM empleados ORDER BY salario DESC LIMIT 1;
END $
DELIMITER ;

-- 16. Muestra un procedimiento que devuelva, como parámetro, el número de
-- departamentos distintos hay en la tabla emple. El procedimiento se ha de
-- ejecutar con los permisos del usuario que lo crea
DELIMITER $
CREATE PROCEDURE muestraDepart(OUT numDeparts int) SQL SECURITY DEFINER
BEGIN
SELECT Count(DISTINCT iddepart) INTO numDeparts FROM empleados;
END $
DELIMITER ;

-- 17. Crea un procedimiento para insertar un nuevo alumno en la tabla alumnos. El
-- procedimiento se ha de ejecutar con los permisos del usuario que lo invoca.

DELIMITER $
CREATE OR REPLACE PROCEDURE insertAlumno(IN NOM VARCHAR(255),IN APE VARCHAR(255), IN ALT INT, IN AUL INT) SQL SECURITY INVOKER
BEGIN
INSERT INTO alumnos (nombre, apellidos, altura, aula) Values 
(NOM, APE, ALT, AUL);
END $
DELIMITER ;
--Prueba
call insertAlumno(parametros);
SELECT insertAlumno;


-- 18. Crea una función que pasándole un oficio nos devuelva el número de empleados
-- con ese oficio. Se ha de crear el procedimiento para el usuario root conectado
-- desde la maquina local.
DELIMITER $
CREATE OR REPLACE DEFINER = root@localhost PROCEDURE verOficio(IN eligeOficio VARCHAR(255))
BEGIN
SELECT Count(*) FROM empleados WHERE oficio = eligeOficio;
END $
DELIMITER ;

DELIMITER $
CREATE OR REPLACE DEFINER = root@localhost FUNCTION verOficio(IN eligeOficio VARCHAR(255)) RETURNS INT
BEGIN
SELECT Count(*) AS 'recuento' FROM empleados WHERE oficio = eligeOficio;
RETURN 'recuento';
END $
DELIMITER ;

-- 19. Crea un procedimiento, que pasándole un oficio, nos devuelva el número de
-- empleados con ese oficio
DELIMITER $
CREATE OR REPLACE PROCEDURE CONTADOROFICIOS(IN Trabajos VARCHAR(255))
SELECT COUNT(*) AS 'CANTIDAD EMPLEADOS' FROM empleados WHERE OFICIO = TRABAJOS;
END $
DELIMITER ;

-- 20. Vamos a crear una función determinista que califica el salario de los empleados
-- con una cadena de texto: si el salario es superior o igual 5000 Alto, si es mayor
-- o igual que 3000 pero menor 5000 Medio y bajo en los demás casos. Luego de la
-- definición del procedimiento muestra los datos de los empleados con su salario
-- calificado. 
DELIMITER $
CREATE FUNCTION califica(salario int) returns VARCHAR(255) DETERMINISTIC
BEGIN
IF salario >= 5000 THEN RETURN 'ALTO';
ELSEIF salario >= 3000 AND salario < 5000 THEN RETURN 'MEDIO';
ELSE RETURN 'BAJO';
END IF;
END $
DELIMITER ;


-- 21. Crea un procedimiento que busque en la tabla empleados todos los empleados
-- en que sus apellidos cumpla con un patrón.
DELIMITER $
CREATE PROCEDURE buscaEmpleados(IN patron VARCHAR(255))
BEGIN
SELECT * FROM empleados WHERE apellidos LIKE patron;
END $
DELIMITER ;

CALL buscaEmpleados('%z');
SELECT buscaEmpleados;


-- 22. Crea un procedimiento que indicado un empleado le aumente la comisión en un
-- cifra determinada.
DELIMITER $
CREATE PROCEDURE AUMENTOCOMISION(IN codigo INT, IN aumento INT)
BEGIN
UPDATE empleados SET comision = ifnull(comision,0) + aumento WHERE codigo = CODEMP;
END $
DELIMITER ; 

-- 23. Crea un función que dado un empleado calcule el número de años que lleva en la
-- empresa.
DELIMITER $
CREATE OR REPLACE FUNCTION numeroAños(TRABAJADOR VARCHAR(255)) RETURNS int
BEGIN
DECLARE A int;
SELECT TIMESTAMPDIFF(YEAR, CURRENT_DATE, FECHA_ALT) INTO A FROM empleados WHERE APELLIDO = TRABAJADOR;
RETURN A;
END $
DELIMITER ;

-- 24. Crea un procedimiento que busque en la tabla empleados todos los empleados
-- en que sus apellidos cumpla con un patrón. Además deberá mostrar el número
-- de empleados que cumple el patrón. Ha de tener el comentario de "busca
-- procedimiento".
DELIMITER $
CREATE PROCEDURE buscaEmpleados(IN patron VARCHAR(255)) COMMENT 'busca procedimiento'
BEGIN
SELECT COUNT(*) as 'numEmpleados' FROM empleados WHERE apellidos = patron;
SELECT * FROM empleados WHERE apellido = PATRON;
END $
DELIMITER ;

-- 25. Crea un procedimiento que busque en la tabla empleados todos los empleados
-- en que su apellidos cumpla con dos patrones. Si uno de ellos es nulo no se ha de
-- tener en cuenta.
DELIMITER $
CREATE PROCEDURE buscaEmpleados2patrones(IN PATRON1 VARCHAR(255),IN PATRON2 VARCHAR(255)) COMMENT 'busca procedimiento'
BEGIN
SELECT * FROM empleados WHERE apellido LIKE ifnull(PATRON1,'%') AND apellido LIKE ifnull(PATRON2,'%');
END $
DELIMITER ;

-- 26. Crea un procedimiento que indicándole un código de empleado nos 
-- devuelva el tipo de salario: El cual puede ser bajo si cobra menos de 
-- 2000, medio si cobra 2000 o más pero menos de 4000 y alto el resto. 
-- El procedimiento se ha de ejecutar con los permisos del usuario que 
-- lo invoca y se debe crear para el usuario user desde la maquina local.
DELIMITER $
CREATE OR REPLACE DEFINER=user@localhost PROCEDURE tipoSalario(IN codigo int) SQL SECURITY INVOKER
BEGIN
DECLARE tipoDeSalario VARCHAR(255);
DECLARE salarioo int;
SET salarioo = (SELECT salario FROM empleados WHERE CODEMP = CODIGO); *paréntesis obligatorio
IF salarioo < 2000 THEN set tipoDeSalario = 'bajo';

ELSEIF salarioo > 2000 AND salarioo < 4000 THEN set tipoDeSalario = 'medio';

ELSE set tipoDeSalario = 'alto';

END IF;

SELECT CODEMP, tipoDeSalario FROM empleados;

END $
DELIMITER ;

--  27. Crea una función con dos parámetros: El primero será un número entero que
--  representara un salario, el segundo será 0, 1 o -1. Si el segundo parámetro 
--  es 0 nos devolverá el número de empleado con un salario igual al primer 
--  parámetro. Si vale 1 el número de empleados con un salario mayor y si vale 
-- -1 el número de empleados con un salario menor.
DELIMITER $
CREATE OR REPLACE FUNCTION opciones(salarios int, compara int) RETURNS int 
BEGIN
DECLARE numeroEmpleados int;
IF compara = 0 THEN SET numeroEmpleados = Select COUNT(*) FROM empleados WHERE empleados.salario = salarios ;
ELSEIF compara = 1 THEN SET numEmpleados = Select COUNT(*) FROM empleados WHERE empleados.salario > salarios  ;
ELSEIF compara = -1 THEN SET numEmpleados = Select COUNT(*) FROM empleados WHERE empleados.salario < salarios ;
ELSE SELECT 'Parametro incorrecto' FROM empleados;
END IF;
return numEmpleados;
END $
DELIMITER ;

