create table if not EXISTS rt(
	id_user INTEGER NOT NULL,
	id_tw INTEGER NOT NULL,
	FOREIGN KEY (id_user) REFERENCES usuario(id_user),
	FOREIGN KEY (id_tw) REFERENCES tweet(id_tw),
	PRIMARY KEY(id_user, id_tw)
);