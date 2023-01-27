SELECT c.cancoes AS cancao,
    COUNT(e.cancoes_id) AS reproducoes
FROM SpotifyClone.quantidade_cancoes AS c
INNER JOIN SpotifyClone.musicas_escutadas AS e
	ON c.cancoes_id = e.cancoes_id
GROUP BY e.cancoes_id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;