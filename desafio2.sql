SELECT COUNT(*) AS cancoes,
(SELECT COUNT(*) FROM SpotifyClone.quantidade_artistas) AS artistas,
(SELECT COUNT(*) FROM SpotifyClone.quantidade_albuns) AS albuns
 FROM SpotifyClone.quantidade_cancoes