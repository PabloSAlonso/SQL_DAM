	1-CREATE DATABASE IF NOT EXISTS BD2 DEFAULT CHARACTER SET = latin1;
2-CREATE DATABASE IF NOT EXISTS BD3 DEFAULT CHARACTER SET = UTF8;
3-CREATE TABLE juegos (
	IDJUEGO TINYINT PRIMARY KEY AUTO_INCREMENT,
	Nombre CHAR(40) NOT NULL UNIQUE,
	Plataforma SET('PSP','Wii','Playstation','XBOX','Nintendo 		DS','PC') COMMENT 'Plataformas soportadas por el juego',
    PrecioVenta FLOAT(10,2)NULL,
    PrecioAlquiler FLOAT(10,2),
    StockVenta BIGINT DEFAULT (10) NOT NULL,
	StockAlquiler TINYINT ZEROFILL,
    INDEX (PrecioVenta)
	);
4.-	CREATE TABLE juegosNuevos LIKE bd2.juegos;

5.-	RENAME TABLE BD3.juegosNUEVOS TO BD3.Novosxogos;

6.-	RENAME TABLE bd3.novosxogos TO bd2.novosxogos;

7.-	DROP DATABASE if exists bd3;

8.-	INSERT INTO juegos (Nombre,Plataforma,PrecioVenta,PrecioAlquiler,StockVenta,StockAlquiler) 
	VALUES
	('Maniac Mansion',"Nintendo, DS, PC",40.30,5,10,5),
	('Indiana Jones and the Last Crusade',"Playstation, XBOX, PC",50,Null,53,Null),
	('Loom',"Wii, PC", 20, Null, 4,2),
	('Monkey Island II:LeChuck´s Revenge',"WII, PSP, PC",20, Null, 4, 2),
	('Day of the tentacle', "XBOX, PC", 50.50, 4, Null, 1),
	('Sam & Max Hit the Road',"PSP, Wii, PC, Playstation", 37.30, 5.2, 2, 4),
	('Full Throttle',"PSP, Wii, Playstation, XBOX, PC, Nintendo DS", 42.00, 3.50, 4, NULL), 
	('The dig', 'PC', 50.2, Null, 4, 5),
	('La abadía del crimen', 'PC', 25, 5, 4, 3);
	 

9.-	CREATE TABLE socios (
    NúmeroSocios TINYINT PRIMARY KEY AUTO_INCREMENT ,
    Nombre VARCHAR(15) NOT NULL, 
    Apellidos VARCHAR(35) NOT NULL,
    DNI CHAR(9) UNIQUE COMMENT 'El DNI del socio',
    País VARCHAR(20) NULL,
    Sexo ENUM('H','M'),
    Observaciones TEXT,
    INDEX (Apellidos));

10.-	INSERT INTO socios (Nombre, Apellidos, DNI, País, Sexo, Observaciones) VALUES 
	('Paco', 'Menéndez', '1111', 'España', 'H', 'Querido Adso, ¿no confundirás el amor con la lujuria?'),
	('Ron', 'Gilbert', '2222', 'EEUU', 'H', 'Miren ¡Un mono de tres cabezas!'),
	('John', 'Carmarck', '3333', 'EEUU', 'H', ' El padre del shooter'),
	('Shigeru', 'Miyamoto', '4444', 'Japón', 'H', 'Zeruda no Densetsu'),
	('Alekséi', 'Pázhitnov', '5555', 'Rusia', 'H', 'Demasiadas piezas'),
	('Nolan', 'Bushnell', '6666', 'EEUU', 'H', 'Dos raquetas y una pelota'),
	('John', 'Tobias', '7777', 'EEUU', 'H', 'Test your might'),
	('Peter', 'Molyneux', '8888', 'UK', 'H', 'Juega a ser Dios');


11.-	INSERT INTO socios (Nombre, Apellidos, DNI, País, Sexo, Observaciones) VALUES
	('Sid', 'Meier', 9999, 'Canadá', 'V', 'Evoluciona tu civilización');	

12.-	CREATE TABLE alquileres (
    IDalquiler INT PRIMARY KEY AUTO_INCREMENT ,
    NúmeroSocios MEDIUMINT NOT NULL COMMENT 'Referencia a la tabla socios', 
    Juego SMALLINT NOT NULL COMMENT 'Código del juego',
    FechaAlquiler TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FechaDevolución DATETIME,
    FOREIGN KEY (NúmeroSocios) REFERENCES socios(NúmeroSocios)
    	ON DELETE RESTRICT
    	ON UPDATE CASCADE,
    FOREIGN KEY (Juego) REFERENCES juegos(Juego)
    	ON DELETE RESTRICT
		ON UPDATE CASCADE)
	ENGINE = MyISAM;

13.-	INSERT INTO alquileres (NúmeroSocios, Juego, FechaAlquiler, FechaDevolución) VALUES
	('1', '1', DEFAULT, DATE_ADD(FechaAlquiler, INTERVAL 5 DAY)),
 	('2', '2', DEFAULT, DATE_ADD(FechaAlquiler, INTERVAL 3 DAY)),
    	('3', '5', DEFAULT, DATE_ADD(FechaAlquiler, INTERVAL 12 HOUR)),
    	('6', '1', DEFAULT, DATE_ADD(FechaAlquiler, INTERVAL 1 MONTH)),
	('4', '4', DEFAULT, DATE_ADD(FechaAlquiler, INTERVAL 1 WEEK)),
	('2', '7', DEFAULT, DATE_ADD(FechaAlquiler, INTERVAL 5 DAY)),
    	('5', '5', DEFAULT, FechaAlquiler),
    	('7', '3', DEFAULT, DATE_ADD(FechaAlquiler, INTERVAL 1 YEAR));
	

14.-	INSERT INTO alquileres (NúmeroSocios, Juego, FechaAlquiler, FechaDevolución) VALUES
	('11', '1', DEFAULT, DATE_ADD(FechaAlquiler, INTERVAL 5 DAY)),
 	('9', '22', DEFAULT, DATE_ADD(FechaAlquiler, INTERVAL 3 DAY)),
    	('4', '8', DEFAULT, DATE_ADD(FechaAlquiler, INTERVAL 12 HOUR));
Valores 11 y 22 no existen en socios y juegos respectivamente 


15.-	CREATE TABLE ventas (
	IDventa *tiny*INT PRIMARY KEY AUTO_INCREMENT,
	NumSocio INT NOT NULL COMMENT 'Referencia a la tabla socios',
	Juego SMALLINT NOT NULL COMMENT 'Código del juego',
	FechaVenta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	Precio FLOAT (5,2),
	FOREIGN KEY (NumSocio) REFERENCES socios(NumSocio)
		ON DELETE SET NULL
		ON UPDATE CASCADE,
	FOREIGN KEY (Juego) REFERENCES juegos (Juego)
		ON DELETE NO ACTION
		ON UPDATE CASCADE)
	ENGINE = MyISAM;

16.-	INSERT INTO ventas (NumSocio, Juego, FechaVenta) VALUES
	('1', '2', DEFAULT),
 	('4', '5', DEFAULT),
    	('2', '7', DEFAULT),
   	('4', '1', DATE_ADD(NOW(), INTERVAL 1 WEEK)),
 	('5', '2', DEFAULT),
 	('2', '7', DEFAULT);

17.- SHOW INDEX FROM socios;

18.- DESCRIBE socios;
	SHOW FULL COLUMNS FROM socios;

19.-	SHOW CREATE TABLE socios;

20.-	ALTER TABLE ventas ADD nueva INT DEFAULT 0 AFTER juego;

21.-	ALTER TABLE ventas ADD (nueva2 INT, nueva3 INT);

22.-	ALTER TABLE ventas CHANGE nueva2 nova2 VARCHAR(n);
	ALTER TABLE ventas CHANGE nueva3 nova3 VARCHAR(n);

23.-	ALTER TABLE ventas MODIFY nova2 INT;

24.-	ALTER TABLE ventas DROP nova3;

25.-	ALTER TABLE socios DROP INDEX DNI;

26.-	ALTER TABLE socios DROP INDEX Apellidos;

27.-	ALTER TABLE MODIFY numeroSocio INT;

28.-	ALTER TABLE alquileres DROP PRIMARY KEY
	Sucede que no permite borrarla, para solucionarlo 
	tenemos que dar el mismo tipo de dato a las claves forneas
	ALTER TABLE alquileres MODIFY IDalquiler INT;

29.-	ALTER TABLE alquileres ADD PRIMARY KEY (IDalquiler);

30.-	ALTER TABLE socios ADD INDEX(DNI);

31.-	CREATE INDEX indiceSocio ON socios(Nombre);

32.-	ALTER TABLE socios DROP INDEX indiceSocio;

33.-	CREATE UNIQUE INDEX nombrecompleto ON socios (Nombre,apellidos)

34.-	ALTER TABLE socios DROP INDEX nombrecompleto;

35.-	ALTER TABLE ventas DROP FOREING KEY (NumSocio,Juego);

36.-	ALTER TABLE ventas ADD FOREING KEY (NumSocio) REFERENCES socios(NumSocio); 	
	ALTER TABLE ventas ADD FOREING KEY (Juego) REFERENCES juegos(Juego);

37.-	ALTER TABLE ventas ENGINE=MyISAM;