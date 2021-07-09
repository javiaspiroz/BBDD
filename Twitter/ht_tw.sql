create table if not EXISTS ht_tw(
	id_tw INTEGER NOT NULL,
	id_tag INTEGER NOT NULL,
	FOREIGN KEY (id_tw) REFERENCES tweet(id_tw),
	FOREIGN KEY (id_tag) REFERENCES hashtag(id_tag),
	PRIMARY KEY(id_tw, id_tag)
);