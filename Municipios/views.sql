/*empezamos a usar views*/
CREATE VIEW muni_extendida as
SELECT 
	municipios.ID_MUN, 
	municipios.Nombre AS Municipio, 
	provincias.Nombre AS Provincia,
	km2.Superficie,
	habitantes.HyM
FROM municipios
JOIN km2 USING (id_mun)
JOIN habitantes USING (id_mun)
JOIN provincias USING (id_prv)

/*ejemplo de uso la view creada anteriormente*/
SELECT * FROM muni_extendida
WHERE provincia LIKE "%pontevedra%"

