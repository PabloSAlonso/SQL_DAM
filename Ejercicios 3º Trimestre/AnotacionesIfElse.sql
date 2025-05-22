IF condición THEN instrucción;

En Funciones:
IF num >= 9 THEN RETURN 'Sobresaliente';
ELSEIF num >= 7 AND num <=9 THEN return 'Notable';
ELSEIF num >= 5 AND num <= 7 THEN return 'Bien';
ELSE RETURN 'Suspenso';
END IF;

EJEMPLO:

DELIMITER $
CREATE FUNCTION califica(salario int) returns VARCHAR(255) DETERMINISTIC
BEGIN
IF salario >= 5000 THEN RETURN 'ALTO';
ELSEIF salario >= 3000 AND salario < 5000 THEN RETURN 'MEDIO';
ELSE RETURN 'BAJO';
END IF;
END $
DELIMITER ;

