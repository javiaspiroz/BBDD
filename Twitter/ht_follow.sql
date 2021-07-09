create table if not EXISTS ht_follow(
	id_user INTEGER NOT NULL,
	id_tag INTEGER NOT NULL,
	FOREIGN KEY (id_user) REFERENCES usuario(id_user),
	FOREIGN KEY (id_tag) REFERENCES hashtag(id_tag),
	PRIMARY KEY(id_user, id_tag)
);