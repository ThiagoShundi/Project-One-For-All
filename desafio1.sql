DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE IF NOT EXISTS SpotifyClone.quantidade_planos (
      plano_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
      plano VARCHAR(45) NOT NULL,
      valor_plano DECIMAL(3,2) NOT NULL
  ) engine = InnoDB;
  
  CREATE TABLE IF NOT EXISTS SpotifyClone.quantidade_usuarios (
      usuario_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
      usuario VARCHAR(45) NOT NULL,
      idade INT NOT NULL,
      plano_id INT NOT NULL,
      FOREIGN KEY (plano_id) REFERENCES quantidade_planos (plano_id),
      data_assinatura DATE NOT NULL
  ) engine = InnoDB;
  
  CREATE TABLE IF NOT EXISTS SpotifyClone.quantidade_artistas (
      artista_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
      artista VARCHAR(30) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE IF NOT EXISTS SpotifyClone.quantidade_albuns (
      album_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
      album VARCHAR(45) NOT NULL,
      album_ano INT NOT NULL,
      artista_id INT NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES quantidade_artistas (artista_id)
  ) engine = InnoDB;
  
  CREATE TABLE IF NOT EXISTS SpotifyClone.quantidade_cancoes (
      cancoes_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
      cancoes_duracao INT NOT NULL,
      cancoes VARCHAR(45) NOT NULL,
      album_id INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES quantidade_albuns (album_id)
  ) engine = InnoDB;
  
  CREATE TABLE IF NOT EXISTS SpotifyClone.musicas_escutadas (
      usuario_id INT NOT NULL,
      cancoes_id INT NOT NULL,
      data_reproducao DATETIME NOT NULL,
      CONSTRAINT PRIMARY KEY(cancoes_id, usuario_id),
      FOREIGN KEY (cancoes_id) REFERENCES quantidade_cancoes (cancoes_id),
      FOREIGN KEY (usuario_id) REFERENCES quantidade_usuarios (usuario_id)
  ) engine = InnoDB;

  CREATE TABLE IF NOT EXISTS SpotifyClone.artistas_seguidos (
      artista_id INT NOT NULL,
      usuario_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY(artista_id, usuario_id),
      FOREIGN KEY (artista_id) REFERENCES SpotifyClone.quantidade_artistas (artista_id),
      FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.quantidade_usuarios (usuario_id)
  ) engine = InnoDB;

INSERT INTO SpotifyClone.quantidade_planos (plano, valor_plano)
  VALUES
    ('gratuito', 0.00),
    ('universitário', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

  INSERT INTO SpotifyClone.quantidade_artistas (artista)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.quantidade_albuns (artista_id, album, album_ano)
  VALUES
    (1, 'Renaissance', 2022),
    (2, 'Jazz', 1978),
    (2, 'Hot Space', 2022),
    (3, 'Falso Brilhante', 1998),
    (3, 'Vento de Maio', 2001),
    (4, 'QVVJFA?', 2003),
    (5, 'Somewhere Far Beyond', 2007),
    (6, 'I Put A Spell On You', 2012);

  INSERT INTO SpotifyClone.quantidade_cancoes (cancoes, cancoes_duracao, album_id)
  VALUES
    ('BREAK MY SOUL', 279, 1),
    ('VIRGO’S GROOVE', 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Don’t Stop Me Now', 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Samba em Paris', 267, 6),
    ('The Bard’s Song', 244, 7),
    ('Feeling Good', 100, 8);
  
  INSERT INTO SpotifyClone.quantidade_usuarios (usuario, idade, plano_id, data_assinatura)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 4, '2017-12-30'),
    ('Martin Fowler', 46, 4, '2017-01-17'),
    ('Sandi Metz', 58, 4, '2018-04-29'),
    ('Paulo Freire', 19, 2, '2018-02-14'),
    ('Bell Hooks', 26, 2, '2018-01-05'),
    ('Christopher Alexander', 85, 3, '2019-06-05'),
    ('Judith Butler', 45, 3, '2020-05-13'),
    ('Jorge Amado', 58, 3, '2017-02-17');

  INSERT INTO SpotifyClone.musicas_escutadas (usuario_id, cancoes_id, data_reproducao)
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
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');

  INSERT INTO SpotifyClone.artistas_seguidos (usuario_id, artista_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6,	6),
    (6,	1),
    (7, 6),
    (9, 3),
    (10, 2);