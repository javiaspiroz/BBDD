CREATE TABLE if NOT EXISTS `YEAR` (
	`id_year` SMALLINT NOT NULL,
	PRIMARY KEY(`id_year`)
);

CREATE TABLE if NOT EXISTS `profesor` (
	`id_prof` INTEGER UNIQUE,
	`nombre` TINYTEXT NOT NULL,
	`apellidos` TINYTEXT NOT NULL,
	`email` TINYTEXT NOT NULL,
	PRIMARY KEY(`id_prof`)
);

CREATE TABLE if NOT EXISTS `asignatura` (
	`id_asig` INTEGER UNIQUE,
	`id_prof` INTEGER,
	`nombre` TINYTEXT NOT NULL,
	PRIMARY KEY(`id_asig`),
	INDEX `FK_id_prof` (`id_prof`),
	CONSTRAINT `FK_id_prof` FOREIGN KEY (`id_prof`) REFERENCES `profesor` (`id_prof`)
);

CREATE TABLE if NOT EXISTS `cursadoEn` (
	`id_asig` INTEGER UNIQUE,
	`id_year` SMALLINT,
	PRIMARY KEY(`id_asig`, `id_year`),
	INDEX `FK_id_asig_cur` (`id_asig`),
	CONSTRAINT `FK_id_asig_cur` FOREIGN KEY (`id_asig`) REFERENCES `asignatura` (`id_asig`),
	INDEX `FK_id_year_cur` (`id_year`),
	CONSTRAINT `FK_id_year_cur` FOREIGN KEY (`id_year`) REFERENCES `year` (`id_year`)
);

CREATE TABLE if NOT EXISTS `examen` (
	`id_exam` INTEGER UNIQUE,
	`id_asig` INTEGER,
	`revision` BOOLEAN,
	`titulo` TINYTEXT NOT NULL,
	`fecha` DATETIME NOT NULL,
	`nota` FLOAT,
	PRIMARY KEY (`id_exam`),
	INDEX `FK_id_asig_exam` (`id_asig`),
	CONSTRAINT `FK_id_asig_exam` FOREIGN KEY (`id_asig`) REFERENCES `asignatura` (`id_asig`)
);

CREATE TABLE if NOT EXISTS `actividad` (
	`id_act` INTEGER UNIQUE,
	`id_asig` INTEGER,	
	`comentarios` TEXT,
	`titulo` TINYTEXT NOT NULL,
	`fecha_limite` DATETIME NOT NULL,
	`fecha_entrega` DATETIME,
	`nota` FLOAT,
	PRIMARY KEY (`id_act`),
	INDEX `FK_id_asig_act` (`id_asig`),
	CONSTRAINT `FK_id_asig_act` FOREIGN KEY (`id_asig`) REFERENCES `asignatura` (`id_asig`)
);