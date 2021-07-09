select *
FROM KM2
order by superficie DESC


select *
from Municipios
where ID_MUN = 22189


select Nombre, HyM, Municipios.ID_MUN
FROM Municipios
join Habitantes on Municipios.ID_MUN=Habitantes.ID_MUN
where HyM BETWEEN 10000 and 15000
ORDER BY Municipios.ID_MUN DESC


select Municipios.Nombre, Provincias.Nombre
FROM Municipios
JOIN Provincias on Provincias.ID_PRV=Municipios.ID_PRV
where Municipios.Nombre like "%pala%"
LIMIT 3, 2


---muns mas pequeños y su ccaa y sup
SELECT Municipios.Nombre, CCAA.Nombre, Km2.Superficie
FROM Municipios
JOIN Km2 ON Municipios.ID_MUN = Km2.ID_MUN
JOIN Provincias ON Municipios.ID_PRV = Provincias.ID_PRV
JOIN CCAA ON Provincias.ID_CCAA = CCAA.ID_CCAA
ORDER by Km2.Superficie ASC 
LIMIT 30


---extension media min max de un municipio por prov y total ccaa y num muns
SELECT 
	Provincias.Nombre as "Nomb.Provincia",
	sum(Km2.Superficie) as "Extension Km2",
	min(Km2.Superficie) as "Extension minima Km2",
	max(Km2.Superficie) as "Extension maxima Km2",
	avg(Km2.Superficie) as "Extension media Km2",
	count(Municipios.ID_MUN) as "Numero Municipios"
FROM Municipios
JOIN Km2 ON Municipios.ID_MUN = Km2.ID_MUN
JOIN Provincias ON Municipios.ID_PRV = Provincias.ID_PRV
---WHERE Provincias.Nombre="Madrid"
GROUP BY Provincias.ID_PRV


---extension media min max de un municipio por ccaa y total ccaa y num muns
SELECT 
	CCAA.Nombre as "Nomb.CCAA",
	sum(Km2.Superficie) as "Extension Km2",
	min(Km2.Superficie) as "Extension minima Km2",
	max(Km2.Superficie) as "Extension maxima Km2",
	avg(Km2.Superficie) as "Extension media Km2",
	count(Municipios.ID_MUN) as "Numero Municipios"
FROM Municipios
JOIN Km2 ON Municipios.ID_MUN = Km2.ID_MUN
JOIN Provincias ON Municipios.ID_PRV = Provincias.ID_PRV
JOIN CCAA ON Provincias.ID_CCAA = CCAA.ID_CCAA
---WHERE Provincias.Nombre="Madrid"
GROUP BY CCAA.ID_CCAA


---mayor dif entre hombres y mujeres por provinicia
SELECT
	Provincias.Nombre as "Provincias",
	sum(Hombres), sum(Mujeres),
	sum(Mujeres)-sum(Hombres) as "diferencia"
FROM Municipios
JOIN Habitantes ON Habitantes.ID_MUN = Municipios.ID_MUN
Join Provincias ON Provincias.ID_PRV = Municipios.ID_PRV
GROUP by Provincias.ID_PRV
ORDER by diferencia DESC


---provincias tiene cada ccaa españa
SELECT
	ccaa.Nombre, count(*) as num
from Provincias
JOIN CCAA ON CCAA.ID_CCAA = Provincias.ID_CCAA
group by ccaa.ID_CCAA
order by num DESC


---prov con mayor igualdal en genero (diferencia entre +5000 y -3000) pista: HAVING
SELECT
	Provincias.Nombre as "Provincias",
	sum(Hombres), sum(Mujeres),
	sum(Mujeres)-sum(Hombres) as "diferencia"
FROM Municipios
JOIN Habitantes ON Habitantes.ID_MUN = Municipios.ID_MUN
Join Provincias ON Provincias.ID_PRV = Municipios.ID_PRV
GROUP by Provincias.ID_PRV
HAVING diferencia < 5000 AND diferencia> -3000
ORDER by diferencia DESC

--1as consultas con HeidiSQL

/*encontrar municipios que no tienen valores asignados en habitantes*/
SELECT * FROM municipios
LEFT JOIN habitantes ON municipios.ID_MUN = habitantes.ID_MUN
WHERE habitantes.ID_MUN IS NULL

/*encontrar municipios que no tienen valores asignados en km2*/
SELECT * FROM municipios
right JOIN km2 ON municipios.ID_MUN = km2.ID_MUN
WHERE km2.ID_MUN IS NULL

/*poblacion total de las provincias que tengan pueblos fantasmas*/
SELECT 
	provincias.Nombre,
	COUNT(municipios.ID_MUN) AS N_Municipios,
	SUM(hym) AS poblacion
FROM municipios
JOIN habitantes ON municipios.ID_MUN = habitantes.ID_MUN
JOIN provincias ON municipios.ID_PRV=provincias.ID_PRV
WHERE provincias.ID_prv IN (
	SELECT distinct municipios.id_prv FROM municipios
	LEFT JOIN habitantes ON municipios.id_mun = habitantes.id_mun
	WHERE habitantes.id_mun IS null)
GROUP BY provincias.ID_PRV