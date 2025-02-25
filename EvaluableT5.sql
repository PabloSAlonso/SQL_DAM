1	SELECT APELLIDO, OFICIO, CODEMP FROM empleados;

2	SELECT IDDEPART,NOMBRE,LOC FROM depart;

3	SELECT * FROM `empleados` ORDER BY APELLIDO;

4	SELECT * FROM `empleados` ORDER BY IDDEPART DESC;

5	SELECT * FROM empleados ORDER BY IDDEPART DESC, APELLIDO;

6	SELECT * FROM empleados WHERE SALARIO > 2000;

7	SELECT * FROM empleados WHERE OFICIO LIKE 'analista';

8	SELECT APELLIDO, OFICIO FROM empleados WHERE IDDEPART = 20;

9	SELECT * FROM empleados WHERE SALARIO >= 3000 AND IDDEPART != 20 ORDER BY SALARIO,APELLIDO;

10	SELECT * FROM empleados WHERE IDDEPART = 30 AND OFICIO LIKE 'vendedor' ORDER BY apellido;

11	SELECT * FROM empleados WHERE salario BETWEEN 1000 AND 2000;

12	SELECT * FROM empleados WHERE oficio like 'Vendedor' AND comision > 1000;

13	SELECT codemp,apellido FROM empleados WHERE apellido LIKE '%z' AND salario > 1000;

14	SELECT * FROM empleados WHERE oficio LIKE 'empleado' AND salario > 1000 AND iddepart = 10;

15	SELECT apellido FROM empleados WHERE comision IS NULL;

16	SELECT apellido FROM empleados WHERE comision IS NULL AND APELLIDO LIKE 'J%' OR APELLIDO LIKE 'T%';

17	SELECT apellido FROM empleados WHERE OFICIO IN('vendedor', 'analista', 'empleado');

18	SELECT apellido, oficio FROM empleados WHERE OFICIO NOT IN ('analista','empleado') AND salario > 2000;

19	SELECT APELLIDO, salario, iddepart FROM empleados WHERE salario > 2000 AND iddepart IN(10,30);

20	SELECT apellido, codemp FROM empleados WHERE salario < 1000 OR salario > 2000;

21	SELECT apellido, iddepart FROM empleados WHERE FECHA_ALT < "2011-08-01";

22	