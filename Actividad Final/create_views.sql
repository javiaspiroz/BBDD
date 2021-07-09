CREATE VIEW PadreNotas AS
SELECT actividad.titulo, actividad.nota, actividad.fecha_limite AS fecha
FROM actividad
WHERE actividad.nota IS not NULL
UNION 
SELECT examen.titulo, examen.nota, examen.fecha AS fecha
FROM examen
WHERE examen.nota IS not NULL
ORDER BY fecha DESC;

CREATE VIEW PadreFaltan AS
SELECT 
	actividad.titulo,
	DATEDIFF(actividad.fecha_limite, NOW()) AS `Dias Restantes`
FROM actividad
WHERE actividad.fecha_entrega IS NULL
ORDER BY `Dias Restantes` ASC;

CREATE VIEW EntregasEnTiempo AS
SELECT
	max(DATEDIFF(actividad.fecha_entrega, actividad.fecha_limite)) AS `Entrega Días Más Tarde`,
	MAX(DATEDIFF(actividad.fecha_limite, actividad.fecha_entrega)) AS `Entrega Días Más Pronto`,
	avg(DATEDIFF(actividad.fecha_limite, actividad.fecha_entrega)) AS `Media Días Adelanto`
FROM actividad
WHERE actividad.fecha_entrega IS not NULL;

CREATE VIEW ActividadesPorAsignatura AS
select NActividades.nombre, actividades, examenes FROM 
(
	SELECT
		asignatura.nombre,
		asignatura.id_asig,
		COUNT(actividad.id_act) AS actividades
	FROM asignatura
	left JOIN actividad on asignatura.id_asig=actividad.id_asig
	GROUP BY asignatura.id_asig
) AS NActividades
JOIN 
(
	SELECT
		asignatura.nombre,
		asignatura.id_asig,
		COUNT(examen.id_exam) AS examenes
	FROM asignatura
	left JOIN examen on asignatura.id_asig=examen.id_asig
	GROUP BY asignatura.id_asig
) AS NExamenes
ON NActividades.id_asig = NExamenes.id_asig

CREATE VIEW ActividadesPorProfesor AS
SELECT 
	acts.nombre, acts.apellidos, acts.NActs, exs.NExams 
	FROM 
(
	SELECT 
	profesor.nombre,
	profesor.id_prof,
	profesor.apellidos,
	COUNT(actividad.id_act) AS NActs
FROM asignatura
JOIN profesor ON asignatura.id_prof=profesor.id_prof
JOIN actividad ON asignatura.id_asig=actividad.id_asig
GROUP BY profesor.id_prof
) AS acts
JOIN 
(
	SELECT 
	profesor.nombre,
	profesor.id_prof,
	profesor.apellidos,
	COUNT(examen.id_exam) AS NExams
FROM asignatura
JOIN profesor ON asignatura.id_prof=profesor.id_prof
JOIN examen ON asignatura.id_asig=examen.id_asig
GROUP BY profesor.id_prof
) AS exs
ON acts.id_prof = exs.id_prof

--6a view, otra opcion con WHERE examen.nota IS NOT NULL y WHERE actividad.nota IS NOT NULL donde no se muestran NULLs--
CREATE VIEW notaFinal AS
select acts.nombre, 
	(acts.Anota+exs.Enota)/(acts.na+exs.ne) AS notaFinal 
	FROM 
(
	SELECT 
	asignatura.nombre,
	asignatura.id_asig,
	SUM(actividad.nota) AS Anota,
	COUNT(*) AS na
FROM asignatura
JOIN actividad ON asignatura.id_asig=actividad.id_asig
GROUP BY asignatura.id_asig
) AS acts
JOIN 
(
	SELECT 
	asignatura.nombre,
	asignatura.id_asig,
	SUM(examen.nota) AS Enota,
	COUNT(*) AS ne
FROM asignatura
left JOIN examen ON asignatura.id_asig=examen.id_asig
GROUP BY asignatura.id_asig
) AS exs
ON acts.id_asig = exs.id_asig