1.-	INSERT INTO depart SET IDDEPART = '42', NOMBRE = 'Desarrollo', LOC = 'Vigo';

2.-	UPDATE depart SET NOMBRE = 'Enseñanza' WHERE IDDEPART = '42';

3.-	UPDATE empleados SET salario=(salario - salario*0.1) WHERE IDDEPART = 10;

4.-	UPDATE empleados SET salario=(salario - salario*0.05);

5.-	UPDATE empleados SET salario=(salario + 50) WHERE salario < 1501;

6.-	INSERT INTO depart SET IDDEPART = '50', NOMBRE = 'Calidad', LOC = 'Noia';

7.-	INSERT INTO empleados SET APELLIDO = 'Iglesias', OFICIO = 'Presidente', JEFE = NULL, FECHA_ALT = NOW(), SALARIO = 6000, COMISION = NULL, IDDEPART = '50';

8.-	UPDATE empleados SET IDDEPART = '50' WHERE IDDEPART = '20';

9.-	UPDATE empleados SET IDDEPART = '20' WHERE IDDEPART = '50' AND OFICIO != 'Presidente';

10.-	DELETE FROM empleados WHERE CODEMP = 15;

11.-	DELETE FROM empleados WHERE IDDEPART = '20' AND SALARIO > 2000;

12.-	DELETE FROM empleados;
	TRUNCATE TABLE empleados;
	Es mejor "TRUNCATE" porque elimina todas las filas a la vez 
	y es más rápida que "DELETE" que elimina de una en una.

13.-	CREATE TABLE IF NOT EXISTS `empleados` (
  	`CODEMP` int(4) NOT NULL AUTO_INCREMENT,
  	`APELLIDO` varchar(15) DEFAULT NULL,
  	`OFICIO` varchar(10) DEFAULT NULL,
  	`JEFE` int(4) DEFAULT NULL,
 	`FECHA_ALT` date DEFAULT NULL,
  	`SALARIO` int(7) DEFAULT NULL,
  	`COMISION` int(7) DEFAULT NULL,
  	`IDDEPART` int(2) NOT NULL,
  	PRIMARY KEY (`CODEMP`)
	) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

	CREATE TABLE empleados2 LIKE empleados;
	

14.-	UPDATE empleados2 SET CODEMP = 	CODEMP + 1000;

15.-	INSERT INTO empleados2 SELECT * FROM empleados WHERE CODEMP > 8;

16.-	INSERT INTO depart (Nombre, IDDEPART, LOC) VALUES
	('Publicidad', 60, 'Ourense'), ('Costes', 70, 'Lugo');

17.-	REPLACE INTO depart VALUES ('Estudios de mercado', 70, 'Pontevedra');

18.-	DELETE FROM empleados2 WHERE SALARIO BETWEEN 2000 AND 3000;

19.-	UPDATE empleados2 SET JEFE = 5 WHERE OFICIO = 'empleado';

20.-	DELETE FROM empleados2 WHERE COMISION > 0; 

21.-	INSERT INTO depart (Nombre, IDDEPART, LOC) VALUES
	('Robótica', 90, 'Ferrol');
	INSERT INTO empleados SET APELLIDO = 'Susan Calvin', OFICIO = 'Presidente', 
	JEFE = NULL, FECHA_ALT = NOW(), SALARIO = 6000, COMISION = NULL, IDDEPART = '90';

22.-	UPDATE depart SET NOMBRE = LOWER(NOMBRE), LOC = LOWER(LOC) WHERE IDDEPART = 40;

23.-	UPDATE depart SET NOMBRE = LOWER(NOMBRE), LOC = LOWER(LOC) LIMIT 2;

24.-	UPDATE empleados2 SET COMISION = IFNULL(COMISION, 0) + 100 WHERE empleados2 ORDER BY FECHA_ALT ASC LIMIT 1;

25.-	UPDATE empleados2 SET COMISION = IFNULL(COMISION, 0) + 40 WHERE empleados2 ORDER BY FECHA_ALT DESC LIMIT 2;

26.-	DELETE FROM empleados2 WHERE empleados2 ORDER BY FECHA_ALT ASC LIMIT 2;

27.-	UPDATE empleados2 SET COMISION = IFNULL(COMISION, 0);

28.-	UPDATE empleados2 SET OFICIO = oficinista WHERE OFICIO = empleado;

29.-	UPDATE empleados2 SET JEFE = 8 WHERE IDDEPART = 10 OR IDDEPART = 20;

30.-	UPDATE empleados2 SET SALARIO = 2000 WHERE SALARIO < 2000 AND IDDEPART = 30;

31.-	UPDATE empleados2 SET FECHA_ALT = CURRENT_DATE() WHERE IDDEPART = 30 AND SALARIO < 2000;

32.-	UPDATE empleados SET OFICIO = LOWER(OFICIO) WHERE SALARIO < (SELECT AVG(SALARIO) FROM empleados2);

33.-	ALTER TABLE empleado2 ADD TIPO SET('A','B','C');

34.-	UPDATE empleados2 SET tipo = CASE WHEN CODEMP % 2 = 0 THEN 'A' ELSE 'C' END

35.-	SELECT nombre FROM depart WHERE IDDEPART NOT IN (SELECT IDDEPART FROM empleados2);

36.-	UPDATE empleados SET APELLIDO = CONCAT(LEFT(APELLIDO, LENGTH(APELLIDO)-2), LOWER(RIGHT(APELLIDO, 2)));	

37.-	DELETE FROM empleados2 WHERE JEFE LIKE "%9";

38.-	UPDATE empleados2 SET IDDEPART = NULL 
	WHERE IDDEPART = (SELECT MAX(IDDEPART) FROM empleados2) 


39.-	UPDATE empleados2 SET COMISION = CASE
		WHEN OFICIO LIKE 'Empleado' THEN COMISION + 50
		WHEN OFICIO LIKE 'Vendedor' THEN COMISION + 60
		WHEN OFICIO LIKE 'Presidente' THEN COMISION + 130
	ELSE COMISION + 70 END;

IMPORTAR Y EXPORTAR

40.-	LOAD DATA LOCAL INFILE 'C:\\Users\\Pablo Santana\\jugadores1.txt'
		INTO TABLE jugadores1
		COLUMNS
			TERMINATED BY '\t'
		LINES
			TERMINATED BY '\n'
		IGNORE 2 LINES

41.-	LOAD DATA LOCAL INFILE 'C:\\Users\\Pablo Santana\\jugadores2.txt'
		INTO TABLE jugadores2
		COLUMNS
			TERMINATED BY '#'
			ECLOSED BY '"'
		LINES
			TERMINATED BY '\n'
		IGNORE 2 LINES;

42.-	LOAD DATA LOCAL INFILE 'C:\\Users\\Pablo Santana\\jugadores3.txt'
		INTO TABLE jugadores3
		COLUMNS
			TERMINATED BY '\t'
		LINES
			TERMINATED BY '\n'
		IGNORE 3 LINES
		(Partidos, Minutos, Puntos, Rebotes, Tapones, Asistencias, Valoracion, NOMBRE);


43.-	LOAD DATA LOCAL INFILE 'C:\\Users\\Pablo Santana\\jugadores4.txt'
		INTO TABLE jugadores4
	COLUMNS
		TERMINATED BY '\t'
	LINES
	STARTING BY '"JUG\t"'
		TERMINATED BY '\n'
	IGNORE 1 LINES
	( NOMBRE, Partidos, Minutos, Puntos, Rebotes, Tapones, Asistencias, Valoracion);

44.-	SELECT * INTO OUTFILE 'C:\\Users\\Pablo Santana\\jugadores11.txt'
	COLUMNS 
		TERMINATED BY '\t'
	LINES 
		TERMINATED BY '\n'
	FROM jugadores1;

45.-	SELECT * INTO OUTFILE 'C:\\Users\\Pablo Santana\\jugadores12.txt'
	COLUMNS	
		TERMINATED BY '\t'
		ENCLOSED BY '#'
	LINES
		TERMINATED BY '\n'
	FROM jugadores2;

46.-	SELECT * INTO OUTFILE 'C:\\Users\\Pablo Santana\\jugadores13.txt'
	COLUMNS	
		TERMINATED BY '|'
	LINES
		TERMINATED BY 'JUG\t'
		TERMINATED BY '\n'
	FROM jugadores3;

47.-	SELECT Valoracion, Partidos, Minutos, Puntos, Rebotes, Tapones, Asistencias,
	NOMBRE INTO OUTFILE 'C:\\Users\\Pablo Santana\\jugadores14.txt'
	COLUMNS	
		TERMINATED BY '\t
		ENCLOSED BY '|'
	LINES
		TERMINATED BY '\n'
	FROM jugadores4;
