SELECT ar.artista AS artista,
	al.album AS album,
    COUNT(s.artista_id) AS seguidores
FROM SpotifyClone.quantidade_artistas AS ar
INNER JOIN SpotifyClone.quantidade_albuns AS al
	ON ar.artista_id = al.artista_id
INNER JOIN SpotifyClone.artistas_seguidos AS s
	ON al.artista_id = s.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista ASC, album ASC;