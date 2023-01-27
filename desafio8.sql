SELECT ar.artista AS artista,
	al.album AS album
FROM SpotifyClone.quantidade_artistas AS ar
INNER JOIN SpotifyClone.quantidade_albuns AS al
	ON ar.artista_id = al.artista_id
WHERE ar.artista = 'Elis Regina'
ORDER BY album ASC;
