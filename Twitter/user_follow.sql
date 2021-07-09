create table if not EXISTS user_follow(
	id_user1 INTEGER NOT NULL,
	id_user2 INTEGER NOT NULL,
	FOREIGN KEY (id_user1) REFERENCES usuario(id_user),
	FOREIGN KEY (id_user2) REFERENCES usuario(id_user),
	PRIMARY KEY(id_user1, id_user2)
);