SELECT u.usuario AS usuario,
	COUNT(e.cancoes_id) AS qt_de_musicas_ouvidas,
    ROUND(SUM(c.cancoes_duracao/60), 2) AS total_minutos
FROM SpotifyClone.quantidade_usuarios AS u
INNER JOIN SpotifyClone.musicas_escutadas AS e
	ON u.usuario_id = e.usuario_id
INNER JOIN SpotifyClone.quantidade_cancoes AS c
	ON e.cancoes_id = c.cancoes_id
GROUP BY usuario
ORDER BY usuario; 