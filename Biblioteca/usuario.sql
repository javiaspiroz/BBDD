CREATE table if not exists usuario(
	NIF INTEGER PRIMARY KEY,
	nombre TEXT NOT NULL,
	direccion TEXT,
	telefono INTEGER NOT NULL
);