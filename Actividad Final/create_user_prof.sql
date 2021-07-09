CREATE USER if NOT EXISTS 'bd_jaspiroz_prf'@'%' IDENTIFIED BY 'bd21957644';

GRANT 
	INSERT
ON bd_jaspiroz.examen
TO 'bd_jaspiroz_prf'@'%';	

GRANT 
	UPDATE (nota)
ON bd_jaspiroz.examen
TO 'bd_jaspiroz_prf'@'%';

GRANT 
	UPDATE (nota, comentarios)
ON bd_jaspiroz.actividad
TO 'bd_jaspiroz_prf'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.logs_act
TO 'bd_jaspiroz_prf'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.logs_examen
TO 'bd_jaspiroz_prf'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.actividad
TO 'bd_jaspiroz_prf'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.examen
TO 'bd_jaspiroz_prf'@'%';

GRANT 
	SELECT
ON bd_jaspiroz.notaFinal
TO 'bd_jaspiroz_prf'@'%';