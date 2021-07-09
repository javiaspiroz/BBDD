select profesor.nombre, profesor.apellidos FROM asignatura
JOIN actividad ON actividad.id_asig=asignatura.id_asig
JOIN profesor ON asignatura.id_prof=profesor.id_prof
WHERE actividad.nota<5
UNION 
SELECT profesor.nombre, profesor.apellidos FROM asignatura
JOIN examen ON examen.id_asig=asignatura.id_asig
JOIN profesor ON asignatura.id_prof=profesor.id_prof
WHERE examen.nota<5

SELECT 
	WEEK(actividad.fecha_limite) AS WeekNumber,
	(SELECT COUNT(*) FROM actividad WHERE actividad.nota<5 AND WeekNumber=WEEK(actividad.fecha_limite)) AS suspensas,
	(SELECT COUNT(*) FROM actividad WHERE actividad.nota>=5 AND WeekNumber=WEEK(actividad.fecha_limite)) AS aprobadas
FROM actividad
GROUP BY WeekNumber;

SELECT
	acts.weeknumber, asignatura.nombre,
	(SELECT COUNT(*) FROM actividad WHERE WeekNumber=WEEK(actividad.fecha_limite) AND asignatura.id_asig=actividad.id_asig) AS actividades
FROM asignatura
CROSS JOIN (
	SELECT 
	WEEK(actividad.fecha_limite) AS WeekNumber
FROM asignatura
JOIN actividad ON actividad.id_asig=asignatura.id_asig
GROUP BY WeekNumber
) AS acts
GROUP BY WeekNumber, asignatura.id_asig

SELECT notafinal.nombre FROM notafinal 
WHERE notafinal IS NOt NULL 
ORDER BY notafinal.notafinal ASC LIMIT 1;