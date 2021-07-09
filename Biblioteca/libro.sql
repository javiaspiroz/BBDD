create table if not EXISTS libro(
	ID INTEGER PRIMARY KEY AUTOINCREMENT,
	ISBN TEXT,
	titulo TEXT,
	autor TEXT,
	edicion INT,
	IDEditorial INTEGER,
	FOREIGN KEY(IDEditorial) REFERENCES editorial(ID)/*,
	IDEjemplar INT,
	FOREIGN KEY(IDEjemplar) REFERENCES ejemplar(ID)*/
	/*lo comentado no esta hecho por el profesor*/
);