CREATE USER if NOT EXISTS 'bd_jaspiroz_pdr'@'%' IDENTIFIED BY 'bd21957644';

GRANT 
	SELECT
ON bd_jaspiroz.year
TO 'bd_jaspiroz_pdr'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.actividad
TO 'bd_jaspiroz_pdr'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.asignatura
TO 'bd_jaspiroz_pdr'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.cursadoen
TO 'bd_jaspiroz_pdr'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.examen
TO 'bd_jaspiroz_pdr'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.profesor
TO 'bd_jaspiroz_pdr'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.logs_act
TO 'bd_jaspiroz_pdr'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.logs_examen
TO 'bd_jaspiroz_pdr'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.entregasentiempo
TO 'bd_jaspiroz_pdr'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.padrefaltan
TO 'bd_jaspiroz_pdr'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.padrenotas
TO 'bd_jaspiroz_pdr'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.actividadesporasignatura
TO 'bd_jaspiroz_pdr'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.ActividadesPorProfesor
TO 'bd_jaspiroz_pdr'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.notaFinal
TO 'bd_jaspiroz_pdr'@'%';