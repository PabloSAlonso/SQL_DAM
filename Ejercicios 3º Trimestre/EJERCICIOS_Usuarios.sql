2. CREATE USER user1@localhost IDENTIFIED BY 'pass'; 

4. GRANT SELECT ON tema5.empleados TO user1@localhost;
-- Hay que darle permisos de consulta al usuario user1 
-- desde el usuario root 

7. SET PASSWORD FOR user1@localhost = PASSWORD('password');

8. GRANT SELECT(nombre, loc) ON TEMA5.depart TO user1@localhost;

9.  
-- Informa del error de no tener permisos en la columna iddepart.
-- Al consultar solo los permitidos si deja y salen por pantalla.

10. 
CREATE USER user2@localhost IDENTIFIED BY 'pass2';
CREATE USER user3@"192*" IDENTIFIED BY 'pass3';

11.
GRANT ALL ON tema8.* TO user2@localhost WITH GRANT OPTION;
GRANT ALL ON tema5.depart TO user3@"192*";

15.
-- No permite hacerlo en la tabla empleados por los permisos

18.
RENAME USER user2@localhost TO usuario2@localhost IDENTIFIED BY 'pass2'
RENAME USER user3@'192*' TO usuario3@'192*' IDENTIFIED BY 'pass3'

19.
REVOKE SELECT ON *.* TO usuario3@'192*';

20.
DROP USER usuario3@'192*';

22.
GRANT CREATE, DELETE ON tema8.* TO usuario2@localhost;

23.
GRANT UPDATE(jefe), INSERT(comision) ON tema5.empleados 
TO usuario2@localhost

25.
UPDATE empleados.JEFE SET JEFE=2 WHERE JEFE=1;
-- UPDATE comando negado para usuario: 'usuarioo2'@'localhost' para tabla `empleados`.`jefe`

27.
CREATE OR REPLACE // ALTER USER user1@localhost IDENTIFIED BY pass WITH MAX_USER_CONNECTIONS_PER_HOUR 2;

28.
CREATE OR REPLACE // ALTER USER user1@localhost IDENTIFIED BY pass WITH
MAX_QUERIES_PER_HOUR 10;

30.
FLUSH PRIVILEGES;

31.
CREATE OR REPLACE VIEW ed AS SELECT * from tema5.empleados 
JOIN tema5.depart USING (iddepart);

32.
SELECT apellido, oficio, nombre FROM ed

33.
CREATE OR REPLACE VIEW ed (nombre, oficio, departamento) AS SELECT apellido, oficio, nombre
FROM tema5.empleados JOIN tema5.depart USING (IDDEPART);

34.
CREATE OR REPLACE view ed2(nombre_empleado, nombre_departamento) 
AS SELECT nombre, departamento FROM tema5.ed

35.
DROP VIEW IF EXISTS ed;

36.
--* Da error
SELECT * FROM ed2;

39.
CREATE OR REPLACE VIEW notas_asig_alu AS 
SELECT alumno, asignatura, nota, fecha, alumnos.nombre, codigo,  
apellidos, altura, aula, cod, asignaturas.asignaturas.nombre 
FROM asignaturas JOIN alumnos JOIN notas 
on asignaturas.COD = notas.asignatura and alumnos.codigo = notas.alumno;

40.
SELECT * FROM  notas_asig_alu

42.
SHOW CREATE VIEW notas_asig_alu;

43.
CREATE VIEW notasAlu (nombre, materia, calificacion) AS 
SELECT nombre, asignatura, nota FROM notas_asig_alu where nota >= 5;

45.
ALTER VIEW notasAlu AS SELECT nombre, asignatura, nota, apellidos 
FROM notas_asig_alu;

47.
CREATE VIEW salarios (apellido, localizacion) AS 
SELECT apellido, loc FROM empleados JOIN depart USING (IDDEPART) 
WHERE salario > 1200 AND IFNULL(comision, 0) < 100;

49.
--* El nombre coincide con la tabla, puede fallar
CREATE VIEW empleados (nombre, departamento) AS
SELECT apellidos, nombre FROM empleados JOIN depart USING (IDDEPART);

53.
CREATE VIEW led AS SELECT * FROM empleados right JOIN depart 
USING (IDDEPART);
