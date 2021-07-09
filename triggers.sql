DELIMITER $$ 
CREATE TRIGGER actualizarPrecioProducto
BEFORE UPDATE ON productos
FOR EACH ROW
BEGIN
	IF NEW.coste  <>  OLD.coste
		THEN
			SET NEW.precio = NEW.coste*2;
	END IF;
END
$$
DELIMITER;

/*con delimiter asignamos un nuevo delimitador (final de sentencia) por el indicado*/

UPDATE productos SET precio = 5 WHERE id =1

