-- two ways to load our data:
-- 1) from the command line type in 
--  sqlite3 [db_name] < [sql_file]
--  ex: sqlite3 db/codewars.db < db/schema.sql
--  or 
-- 2a) load sqlite3
--   sqlite3 [db_name]
-- ex: sqlite3 db/codewars.db
-- 2b) from sqlite3
--   .read [sql_file]
-- ex: .read db/schema.sql

-- schema.sql
-- users table
CREATE TABLE users (
	`id` INTEGER PRIMARY KEY AUTOINCREMENT,
	`first_name` VARCHAR(64),
	`last_name` VARCHAR(64),
	`slack_id` VARCHAR(128),
	`created_at` DATETIME,
	`updated_at` DATETIME
);

-- profiles table
CREATE TABLE profiles (
	`id` INTEGER PRIMARY KEY AUTOINCREMENT,
	`user_id` INTEGER,
	`bio` TEXT,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	FOREIGN KEY(user_id) REFERENCES users(id)
);