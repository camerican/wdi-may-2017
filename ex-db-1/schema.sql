-- Users Table
CREATE TABLE users (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name_first VARCHAR(64),
	name_last VARCHAR(64),
	email VARCHAR(256),
	created_at DATETIME
);

-- Posts Table
CREATE TABLE posts (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	user_id INTEGER,
	title VARCHAR(128),
	body TEXT,
	created_at DATETIME,
	updated_at DATETIME,
	FOREIGN KEY (user_id) REFERENCES users(id)
);