-- TAREAS CON LA BASE DE DATOS:

-- Se establece base de datos en uso:
USE basedatos2;

-- 2.1 obtener los apellidos de los empleados
SELECT apellido FROM empleados;

-- 2.2 obtener los apellidos de los empleados sin repeticiones.
SELECT DISTINCT apellido FROM empleados;

-- 2.3 obtener los datos de los empleados que se apelliden López.
SELECT * FROM empleados
	WHERE apellido = "López";

-- 2.4 obtener los datos de los empleados que se apelliden López y los que se apelliden Pérez.
SELECT * FROM empleados
	WHERE apellido IN("López", "Pérez");

-- 2.5 Obtener todos los datos de los empleados que trabajen en el departamento 14. 
SELECT * FROM empleados e 
	INNER JOIN departamentos d 
	ON e.codigoDepartamento = d.codigoDepartamento 
	WHERE d.codigoDepartamento = 14;

-- 2.6 Obtener todos los datos de los empleados que trabajen en el departamento 37 y 77.
SELECT * FROM empleados e
	INNER JOIN departamentos d 
	ON e.codigoDepartamento = d.codigoDepartamento 
	WHERE d.codigoDepartamento IN(37, 77);

-- 2.7 Obtener los datos de los empleados cuyo apellido comience con P.
SELECT * FROM empleados
	WHERE apellido LIKE "p%";

-- 2.8 Obtener el presupuesto total de todos los departamentos.
SELECT SUM(presupuestoDepartamento) AS presupuestoTotal
	FROM departamentos;

-- 2.9 Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento. 
SELECT e.*,  d.nombreDepartamento, d.presupuestoDepartamento 
	FROM empleados e 
	INNER JOIN departamentos d 
	ON e.codigoDepartamento = d.codigoDepartamento;


-- 2.10 Obtener un listado completo de empleados, incluyendo el nombre y apellido del empleado junto al nombre y presupuesto de su departamento.
SELECT e.nombre, e.apellido, d.nombreDepartamento, d.presupuestoDepartamento
	FROM empleados e
	INNER JOIN departamentos d 
	ON e.codigoDepartamento = d.codigoDepartamento;

-- 2.11 Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60000.
SELECT e.nombre, e.apellido, d.presupuestoDepartamento
	FROM empleados e
	INNER JOIN departamentos d 
    	ON e.codigoDepartamento = d.codigoDepartamento
	WHERE d.presupuestoDepartamento > 60000;

-- 2.12 Añadir un nuevo departamento: Calidad con un presupuesto de 40000 y código 11, añadir un empleado vinculado al departamento recién creado: Esther Vazquez, DNI 89267109.
INSERT INTO departamentos
	VALUES (NULL, 11, "Calidad", 40000);

INSERT INTO empleados
	VALUES (NULL, 89267109, "Esther", "Vazquez", 11);


-- 2.13 Aplicar un recorte presupuestario del 10% a todos los departamentos.
UPDATE departamentos d 
	SET d.presupuestoDepartamento = d.presupuestoDepartamento * 0.9;


-- 2.14 Reasignar a los empleados del departamento de investigación (código 77) al departamento de informática (código 14).
UPDATE empleados  e 
	SET e.codigoDepartamento = 14 WHERE e.codigoDepartamento = 77;


-- 2.15 Despedir a los empleados del departamento de informática (código 14).
DELETE FROM empleados  
	WHERE codigoDepartamento = 14;

-- 2.16 Despedir a los empleados que trabajen en departamentos con un presupuesto superior a 90000.
DELETE FROM empleados
WHERE codigoDepartamento IN(
    SELECT DISTINCT d.codigoDepartamento FROM departamentos d
	WHERE d.presupuestoDepartamento > 90000);