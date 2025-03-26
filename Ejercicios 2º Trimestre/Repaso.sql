Ejercicio 1

CREATE or replace DATABASE formula1 CHARACTER SET utf8;
CREATE or replace table formula1.escuderias(
idEscuderia SMALLINT primary key not null AUTO_INCREMENT,
nombre char(25) unique not null,
sede varchar(20) comment "sede de la escuderia",
carreras decimal(6,2) DEFAULT 0.0 not null,
victorias mediumint(3) zerofill not null,
INDEX(carreras, victorias)
)ENGINE=INNODB CHARACTER set utf8;
CREATE or replace TABLE formula1.pilotos(
idpiloto int PRIMARY KEY NOT null AUTO_INCREMENT,
nombre varchar(20) unique not null,
fechaNaci datetime default now() comment "Fecha de nacimiento",
escu SMALLINT,
campeon bigint unsigned DEFAULT 2 COMMENT "Nº veces campeon",
estado set ('titular','retirado','probador') DEFAULT 'titular',
FOREIGN key (escu) REFERENCES escuderias (idEscuderia)
on DELETE RESTRICT
on UPDATE CASCADE
)ENGINE=INNODB CHARACTER set utf8;

Ejercicio 2

INSERT into formula1.pilotos
(idPiloto, nombre, fechaNaci, escu, campeon, estado) values
(1,"Max Verstappen", DEFAULT, 3, 4, 'Titular'),
(44, "Lewis Hamilton", DEFAULT, 2, 7, 'Titular'),
(55, "Carlos Sainz", '1994-09-01', 5, 0, null),
(14, "Fernando Alonso", DATE_ADD(CURRENT_DATE(), INTERVAL -43 YEAR), 4, 2, "Titular,Retirado"),
(11,'Checo Perez',DEFAULT,3,0,'Retirado'),
(77,'Valterri Bottas',NULL,1,DEFAULT,'Probador');

INSERT INTO formula1.escuderias(nombre, sede, carreras, victorias) values
("mercedes", null,248.5,125),
("ferrari", "maranello",1069.2,243),
("red bull", null, default,110),
("aston martin", "silverstone", 52,0),
("williams", "grove",822,114);

Ejercicio 3

A:
alter table pilotos add COLUMN columnaNueva int zerofill not null 
DEFAULT 5 AFTER nombre;
B: 
ALTER table pilotos CHANGE columnaNueva nuevaCol int zerofill 
null DEFAULT 5;
C: 
ALTER table pilotos drop INDEX nombre;
D:
UPDATE pilotos set campeon=campeon+1 WHERE campeon=0; 
update pilotos set estado="retirado" AND escu=null WHERE estado is null ;
E: 
TRUNCATE * from pilotos;

Ejercicio 4

A:
SELECT nombre, YEAR(fechaNaci) as 'año',MONTHNAME(fechaNaci) 
as 'mes' from pilotos WHERE nombre like "%o%" order by nombre DESC LIMIT 2;
B1: 
SELECT floor(carreras) FROM escuderias;
B2: 
SELECT TRUNCATE(carreras,0) FROM escuderias;
C: 
SELECT min(carreras) as carreras, max(victorias) as victorias from escuderias;
D:
SELECT nombre,sede, IFnull(length(nombre),0)+ifnull(length(sede),0) 
as total from escuderias order by total DESC limit 2,1;
E: 
SELECT group_concat(nombre) as 'todos los nombres' FROM pilotos;

Ejercicio 5

A:
SELECT escu, COUNT(*) as 'cantidad de pilotos' FROM pilotos 
GROUP by escu HAVING COUNT(escu)>1;
B: 
SELECT nombre FROM pilotos WHERE campeon >
(SELECT COUNT(*) FROM escuderias);
C:
SELECT nombre FROM pilotos WHERE escu in 
(select idEscuderia FROM escuderias WHERE victorias=0);
D:
SELECT nombre, sede FROM escuderias WHERE idEscuderia IN 
(SELECT escu from pilotos GROUP by escu HAVING COUNT(escu)>1)
order by nombre;
E:
SELECT nombre from escuderias WHERE victorias > any 
(select victorias from escuderias WHERE sede is null);