DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.subscription_plan(
    plan_id	INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(30) NOT NULL UNIQUE,
    cost DECIMAL(5,2) NOT NULL);

 INSERT INTO SpotifyClone.subscription_plan (plan_name, cost)
  VALUES
    ('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);


CREATE TABLE SpotifyClone.artists(
    artist_id	INT PRIMARY KEY AUTO_INCREMENT,
    artist_name	VARCHAR(100));

INSERT INTO SpotifyClone.artists (artist_name) VALUES
    ('Baco Exu do Blues'),
    ('Beyoncé'),
    ('Blind Guardian'),
    ('Elis Regina'),
    ('Nina Simone'),
    ('Queen');

CREATE TABLE SpotifyClone.albuns(
    album_id	INT PRIMARY KEY AUTO_INCREMENT,
    album_name	VARCHAR(100),
    artist_id	INT,
    release_year	INT,
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id));

INSERT INTO SpotifyClone.albuns (album_name, artist_id, release_year) VALUES
    ('Renaissance', 2, 2022),
    ('Jazz', 6, 1978),
    ('Hot Space', 6, 1982),
    ('Falso Brilhante', 4, 1998),
    ('Vento de Maio', 4, 2001),
    ('QVVJFA?', 1, 2003),
    ('Somewhere Far Beyond', 3, 2007),
    ('I Put A Spell On You', 5, 2012);

CREATE TABLE SpotifyClone.users(
    user_id	INT PRIMARY KEY AUTO_INCREMENT,
    user_name	VARCHAR(100),
    age  INT,
    subscription_date DATE,
    subscription_plan_id	INT,
    FOREIGN KEY (subscription_plan_id) REFERENCES SpotifyClone.subscription_plan(plan_id));

INSERT INTO SpotifyClone.users (user_name, age, subscription_plan_id, subscription_date) VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');

CREATE TABLE SpotifyClone.musics(
    music_id	INT PRIMARY KEY AUTO_INCREMENT,
    music_name	VARCHAR(100),
    artist_id  INT,
    album_id	INT,
    duration	INT,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(album_id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id));

INSERT INTO SpotifyClone.musics (music_name, artist_id, album_id, duration) VALUES
    ('BREAK MY SOUL', 2, 1, 279),
    ("VIRGO\'S GROOVE", 2, 1, 369),
    ('ALIEN SUPERSTAR', 2, 1, 116),
    ("Don\'t Stop Me Now", 6, 2, 203),
    ('Under Pressure', 6, 3, 152),
    ('Como Nossos Pais', 4, 4, 105),
    ('O Medo de Amar é o Medo de Ser Livre', 4, 5, 207),
    ('Samba em Paris', 1, 6, 267),
    ("The Bard\'s Song", 3, 7, 244),
    ('Feeling Good', 5, 8, 100);

CREATE TABLE SpotifyClone.following(
    following_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    artist_id INT,
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id),
    UNIQUE (user_id, artist_id));

INSERT INTO SpotifyClone.following (user_id, artist_id) VALUES
    (1, 2),
    (1, 6),
    (1, 4),
    (2, 2),
    (2, 4),
    (3, 6),
    (4, 1),
    (5, 3),
    (5, 5),
    (6, 5),
    (6, 2),
    (7, 5),
    (9, 4),
    (10, 6);

CREATE TABLE SpotifyClone.historic(
    historic_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    music_id INT,
    reproduction_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
    FOREIGN KEY (music_id) REFERENCES SpotifyClone.musics(music_id),
    UNIQUE (user_id, music_id));

INSERT INTO SpotifyClone.historic( user_id, music_id, reproduction_date) VALUES
    (1, 8, '2022-02-28 10:45:55'),
	(1, 2, '2020-05-02 05:30:35'),
	(1, 10, '2020-03-06 11:22:33'),
	(2, 10, '2022-08-05 08:05:17'),
	(2, 7, '2020-01-02 07:40:33'),
	(3, 10, '2020-11-13 16:55:13'),
	(3, 2, '2020-12-05 18:38:30'),
	(4, 8, '2021-08-15 17:10:10'),
	(5, 8, '2022-01-09 01:44:33'),
	(5, 5, '2020-08-06 15:23:43'),
	(6, 7, '2017-01-24 00:31:17'),
	(6, 1, '2017-10-12 12:35:20'),
	(7, 4, '2011-12-15 22:30:49'),
	(8, 4, '2012-03-17 14:56:41'),
	(9, 9, '2022-02-24 21:14:22'),
	(10, 3, '2015-12-13 08:30:22');