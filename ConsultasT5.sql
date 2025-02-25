* --> IMPORTANTE


3	SELECT COUNT(Distinct valoracion)FROM jugadores ;

10	SELECT DISTINCT COALESCE (NULL, NULL, 3,5) AS 'valor no nulo' FROM jugadores ;

11	SELECT AVG(partidos) AS 'valor medio',COUNT(nombre) AS 'num jugadores' FROM jugadores ;

12	SELECT SUM(partidos) AS 'suma', MAX(partidos) AS máximo, MIN(partidos) AS mínimo FROM jugadores ;

13	SELECT ROUND(GREATEST(Puntos/5,Rebotes/2,Asistencias),2) FROM jugadores;  

14	SELECT UPPER(Nombre), CHAR_LENGTH(Nombre), LEFT(Nombre,5) FROM jugadores;

15	SELECT BIN(LENGTH(Nombre)) FROM jugadores;

16	SELECT CONCAT("El jugador ", Nombre, "jugo en los Lakers") AS unido FROM jugadores;

*17	SELECT REPLACE(REPLACE(Nombre,"a",1),"","_")  AS 'NOMBRE CAMBIADO' FROM jugadores;

*18	SELECT Nombre, substring(Nombre,2,1),substring(nombre,-2,1) FROM jugadores WHERE SUBSTRING(Nombre,2,1) = Substring(nombre,-2,1);

19	SELECT DISTINCT NOW() "Fecha mas hora", CURRENT_DATE AS "Fecha", CURRENT_TIME AS "Hora" FROM jugadores ;

20	SELECT DAYNAME(NOW()), MONTH(NOW()), YEAR(NOW()) FROM jugadores ;

21	SELECT HOUR(NOW()), MINUTE(NOW()), SECOND(NOW()) FROM jugadores ;

22	SELECT DISTINCT(NOW()), DATE_ADD(NOW(),INTERVAL 1 DAY) AS 'tiempo mas un dia' FROM jugadores ;

23	SELECT CONCAT("Hoy es dia",DAYOFMONTH(NOW()),"del mes",MONTH(NOW()),"del año",YEAR(NOW()));

24	SELECT CONCAT("Son las ",HOUR(NOW())," y ",MINUTE(NOW())," con ",SECOND(NOW())," segundos");
	SELECT TIME_FORMAT(NOW(),"Son las %H:%i:%s") AS 'Hora' ;

25	SELECT 'abcdef' = 'abcDEF' AS 'sensible',BINARY('abcdef'='abcDEF') AS 'no sensible'

26	SELECT BENCHMARK(100000000,ENCODE('Hola','Adios')); Indica los segundos que tarda en ejecutar la consulta las veces que le indicamos a la izquierda

27	SELECT CONNECTION_ID() AS 'id', CURRENT_USER() AS 'usuario', FOUND_ROWS();

28	SELECT Nombre ,AES_ENCRYPT(Nombre,12345) AS "Nombre encriptado" FROM jugadores;

29	SELECT Nombre, AES_DECRYPT(AES_ENCRYPT(Nombre,12345),12345) AS "Nombre desencriptado" FROM jugadores;

30	SELECT Nombre, AES_DECRYPT(AES_ENCRYPT(Nombre,12345),123456) AS "Nombre desencriptado" FROM jugadores; Obtienes NULL en los valores

31	SELECT FORMAT(45345234.435, 4) AS "número con formato";
