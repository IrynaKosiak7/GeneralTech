CREATE TABLE comments (
	id int primary key auto_increment,
	videos_id int,
	users_id int,
	videos_comments varchar(300),
	created_at timestamp
);

CREATE TABLE reactions (
id int primary key auto_increment,
videos_id int,
users_id int,
dislike bool,
created_at timestamp
);
