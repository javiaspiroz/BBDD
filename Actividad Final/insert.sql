INSERT INTO profesor VALUES (1000,'Juan','Ruiz Castaño','jrc@uni.es'),
(1001,'Ana','Serrano Jiménez','asj@uni.es'),
(1002,'Miguel','Pérez Cuesta','mpc@uni.es');

INSERT INTO asignatura VALUES (1000,1000,'Bases de Datos'),
(2000,1000,'Álgebra'),
(3000,1000,'Física'),
(4000,1001,'Fundamentos de Redes'),
(5000,1001,'Programación Concurrente y Distribuida'),
(6000,1001,'Programación con Estructuras Lineales'),
(7000,1002,'Proyecto de Ingeniería'),
(8000,1002,'Técnicas de Programación Avanzadas'),
(9000,1002,'Análisis Matemático'),
(10000,1002,'Eficacia Personal y Profesional');

INSERT INTO year VALUES (2020);

INSERT INTO cursadoen VALUES (1000,2020),
(2000,2020),
(3000,2020),
(4000,2020),
(5000,2020),
(6000,2020),
(7000,2020),
(8000,2020),
(9000,2020),
(10000,2020);

INSERT INTO examen VALUES (1000,1000,NULL,'Examen Creación de Tablas','2020/03/22 15:30:00',NULL),
(2000,2000,false,'Examen Cambio de Base','2020/01/12 10:30:00',7.2),
(4000,4000,NULL,'Examen Creación de Subredes','2020/04/22 15:30:00',6.8),
(5000,5000,true,'Examen Semáforos','2020/04/25 19:30:00',2.8),
(6000,6000,NULL,'Examen Pattern Matching','2020/01/20 15:30:00',NULL),
(8000,8000,NULL,'Examen Árboles AVL','2020/04/16 15:30:00',9.2),
(9000,9000,true,'Examen Integrales','2020/02/01 12:30:00',3.4);

INSERT INTO actividad VALUES (1000,1000,NULL,'Sentencias Airbnb','2020/03/13 23:55:00','2020/03/13 18:36:00',9.2),
(1001,1000,'Falta por añadir la tabla de Hashtag y una mejor definición de las FK','Tablas Twitter','2020/02/29 23:55:00','2020/02/29 11:36:00',2.3),
(1002,1000,'No entregado','Ingeniería Inversa Municipios','2020/02/28 23:55:00',NULL,0);

INSERT INTO actividad VALUES (2000,2000,NULL,'Diagonalización','2020/01/13 23:55:00','2020/01/13 18:36:00',9.2),
(2001,2000,NULL,'Intersección de Conjuntos','2020/02/29 23:55:00','2020/02/29 19:36:00',8.2),
(2002,2000,NULL,'Gauss-seidel','2020/02/06 23:55:00','2020/02/03 15:26:00',6.8);

INSERT INTO actividad VALUES (3000,3000,NULL,'Resumen Cinemática','2020/06/13 23:55:00',NULL,NULL),
(3001,3000,NULL,'Ejercicios Campo Eléctrico','2020/02/15 23:55:00','2020/02/12 10:42:00',9.2),
(3002,3000,NULL,'Ejercicios Campo Magnético','2020/05/06 23:55:00','2020/04/23 17:26:00',5.6);

INSERT INTO actividad VALUES (4000,4000,NULL,'Configuración TCP','2020/06/13 23:55:00',NULL,NULL),
(4001,4000,'Muy buen trabajo','Subredes','2020/02/23 23:55:00','2020/02/17 11:42:00',9.2),
(4002,4000,NULL,'Enrutamiento','2020/04/06 23:55:00',NULL,NULL);

INSERT INTO actividad VALUES (5000,5000,NULL,'Fibonacci','2020/03/13 23:55:00','2020/03/13 23:54:00',1.5),
(5001,5000,NULL,'Sockets','2020/02/23 23:55:00','2020/02/17 11:42:00',3.2),
(5002,5000,NULL,'Mergesort Paralelo','2020/04/06 23:55:00','2020/04/13 23:58:00',5.4);

INSERT INTO actividad VALUES (6000,6000,NULL,'AC Origins','2020/03/13 23:55:00','2020/03/13 23:05:00',1.5),
(6001,6000,NULL,'Group by','2020/02/23 23:55:00','2020/02/17 11:42:00',3.2),
(6002,6000,NULL,'Fortnite','2020/04/06 23:55:00','2020/04/13 23:58:00',9.4);

INSERT INTO actividad VALUES (7000,7000,NULL,'Propuesta Previa','2020/03/17 23:55:00','2020/03/13 23:05:00',1.5),
(7001,7000,NULL,'Entrega Final','2020/05/23 23:55:00',NULL,NULL),
(7002,7000,NULL,'Propuesta Definitiva','2020/04/06 23:55:00','2020/04/02 23:58:00',9.4);

INSERT INTO actividad VALUES (8000,8000,NULL,'Divide y Vencerás','2020/03/18 23:55:00','2020/03/16 23:05:00',1.5),
(8001,8000,NULL,'Cáculo Complejidad','2020/05/23 23:55:00','2020/05/21 20:55:00',3.5),
(8002,8000,NULL,'Grafos','2020/04/06 23:55:00','2020/03/26 23:58:00',9.4);

INSERT INTO actividad VALUES (9000,9000,'Pide una tutoría para resolver las dudas','Integrales','2020/01/18 23:55:00','2020/01/16 23:05:00',1.5),
(9001,9000,NULL,'Derivadas','2020/03/15 23:55:00','2020/03/24 20:55:00',5.5),
(9002,9000,NULL,'Taylor','2020/04/06 23:55:00','2020/03/26 23:58:00',9.4);

INSERT INTO actividad VALUES (10000,10000,NULL,'Trabajo Final','2020/02/18 23:55:00','2020/01/16 23:05:00',8.5),
(10001,10000,NULL,'Misión Profesional','2020/03/15 23:55:00','2020/04/24 20:55:00',5.5),
(10002,10000,NULL,'Diario Personal','2020/01/06 23:55:00','2020/01/04 23:58:00',9.4);