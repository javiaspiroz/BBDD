CREATE TABLE if NOT EXISTS `logs_examen` (
	`id_exam` INTEGER UNIQUE,
	`revision` BOOLEAN,
	`nota` FLOAT,
	PRIMARY KEY (`id_exam`)
);

CREATE TABLE if NOT EXISTS `logs_act` (
	`id_act` INTEGER UNIQUE,	
	`comentarios` TEXT,
	`nota` FLOAT,
	PRIMARY KEY (`id_act`)
);

CREATE TRIGGER crearExamen
AFTER INSERT ON examen
for each row
INSERT INTO logs_examen(id_exam,revision,nota) VALUES (new.id_exam, new.revision, new.nota)

DELIMITER $$
CREATE TRIGGER revision
AFTER UPDATE ON examen
FOR EACH ROW
BEGIN
	IF NEW.revision  <>  OLD.revision  AND EXISTS (SELECT examen.id_exam FROM examen WHERE examen.id_exam=NEW.id_exam)
		THEN
			UPDATE logs_examen SET logs_examen.revision=NEW.revision WHERE logs_examen.id_exam=new.id_exam;
		ELSE 
			INSERT into logs_examen(id_exam,revision) VALUES (NEW.id_exam, NEW.revision);
	END IF;
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER notaExamen
AFTER UPDATE ON examen
FOR EACH ROW
BEGIN
	IF NEW.nota  <>  OLD.nota AND EXISTS (SELECT examen.id_exam FROM examen WHERE examen.id_exam=NEW.id_exam)
		THEN
			UPDATE logs_examen SET logs_examen.nota=NEW.nota WHERE logs_examen.id_exam=new.id_exam;
		ELSE 
			INSERT into logs_examen(id_exam,nota) VALUES (NEW.id_exam,NEW.nota);
	END IF;
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER notaActividad
AFTER UPDATE ON actividad
FOR EACH ROW
BEGIN
	IF NEW.nota  <>  OLD.nota AND EXISTS (SELECT actividad.id_act FROM actividad WHERE actividad.id_act=NEW.id_act)
		THEN
			UPDATE logs_act SET logs_act.nota=NEW.nota WHERE logs_act.id_act=new.id_act;
		ELSE 
			INSERT into logs_act(id_act,nota) VALUES (NEW.id_act, NEW.nota);
	END IF;
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER comentarios
AFTER UPDATE ON actividad
FOR EACH ROW
BEGIN
	IF NEW.comentarios  <>  OLD.comentarios AND EXISTS (SELECT actividad.id_act FROM actividad WHERE actividad.id_act=NEW.id_act)
		THEN
			UPDATE logs_act SET logs_act.comentarios=NEW.comentarios WHERE logs_act.id_act=new.id_act;
		ELSE 
			INSERT into logs_act(id_act,comentarios) VALUES (NEW.id_act, new.comentarios);
	END IF;
END
$$
DELIMITER ;