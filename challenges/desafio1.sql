DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans(
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);


CREATE TABLE SpotifyClone.users(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    signature_date DATE NOT NULL,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES plans (plan_id)
);


CREATE TABLE SpotifyClone.artists(
    following_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(50) NOT NULL
);

CREATE TABLE SpotifyClone.albuns(
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(50) NOT NULL,
    following_id INT NOT NULL,
    release_year INT,
    FOREIGN KEY (following_id) REFERENCES artists (following_id)
);


CREATE TABLE SpotifyClone.musics(
    music_id INT AUTO_INCREMENT PRIMARY KEY,
    music_name VARCHAR(50) NOT NULL,
    length_sec INT,
    artist_following INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (following_id) REFERENCES artists (following_id),
    FOREIGN KEY (album_id) REFERENCES albuns (album_id)
);


CREATE TABLE SpotifyClone.history(
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    music_id INT NOT NULL,
    history_date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (music_id) REFERENCES musics (music_id)
);

CREATE TABLE SpotifyClone.following(
  user_id INT,
  following_id INT,
  PRIMARY KEY (user_id, following_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (following_id) REFERENCES artists(following_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (plan_name, price)
VALUES
('Gratuito', 0),
('Universitario', 5.99),
('Pessoal', 6.99),
('Familiar', 7.99);

INSERT INTO SpotifyClone.users (user_name, age, signature_date, plan_id)
VALUES
  ('Barbara Liskov', 82, '2019-10-20', 1),
  ('Robert Cecil Martin', 58, '2017-01-06', 1),
  ('Ada Lovelace', 37, '2017-12-30', 4),
  ('Martin Fowler', 46, '2017-01-17', 4),
  ('Sandi Metz', 58, '2018-04-29', 4),
  ('Paulo Freire', 19, '2018-02-14', 2),
  ('Bell Hooks', 26, '2018-01-05', 2),
  ('Christopher Alexander', 85, '2019-06-05', 3),
  ('Judith Butler', 45, '2020-05-13', 3),
  ('', 58, '2017-02-17', 3);

INSERT INTO SpotifyClone.artists (artist_name)
VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');

INSERT INTO SpotifyClone.albuns (album_name, following_id, release_year)
VALUES
('Renaissance', 1, 2022),
('Jazz', 2, 1978),
('Hot Space', 2, 1982),
('Falso Brilhante', 3, 1998),
('Vento de Maio', 3, 2001),
('QVVJFA?', 4, 2003),
('Somewhere Far Beyond', 5, NULL),
('I Put A Spell On You', 6, NULL);

INSERT INTO SpotifyClone.musics (music_name, length_sec, following_id, album_id)
VALUES
('BREAK MY SOUL', 279, 1, 1),
('VIRGOS GROOVE', 369, 1, 1),
('ALIEN SUPERSTAR', 116, 1, 1),
('Dont Stop Me Now', 203, 2, 2),
('Under Pressure', 152, 2, 3),
('Como Nossos Pais', 105, 3, 4),
('O Medo de Amar é o Medo de Ser Livre', 207, 3, 5),
('Samba em Paris', 267, 4, 6),
('The Bards Song', NULL, 5, 7),
('Feeling Good', NULL, 6, 8);

INSERT INTO SpotifyClone.history (user_id, music_id, history_date)
VALUES
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
(9, 9, '2012-03-17 14:56:41'),
(10, 3, '2015-12-13 08:30:22');

INSERT INTO SpotifyClone.following (user_id, following_id)
VALUES
(1, 1), (1, 2), (1, 3),
(2, 1), (2, 3),
(3, 2),
(4, 4),
(5, 5), (5, 6),
(6, 6), (6, 1),
(7, 6),
(9, 3),
(10, 2);