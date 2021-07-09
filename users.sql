CREATE USER 'alumno'@'%' IDENTIFIED BY 'secreta' 
/*@'%' para poder acceder desde cualquier lugar 
o poner ip máscara (o pc) para limitar desde un solo lugar o usar 'localhost'
se pueden duplicar, triplicar,.. usuarios para tener distintas restricciones segun ubicacion*/


drop USER 'alumno';

/*privilegios*/
GRANT SELECT ON *.* TO alumno@'%' WITH GRANT OPTION;
/*  *.* a todas las tablas de todas las bases de datos
nombre_bd.tabla.columna
grant all,... */

GRANT SELECT, INSERT,UPDATE ON municipios.* TO alumno@'192.0.0.0/255.0.0.0';
/*quitar privilegios*/
REVOKE SELECT, INSERT,UPDATE ON municipios.* TO alumno@'192.0.0.0/255.0.0.0';