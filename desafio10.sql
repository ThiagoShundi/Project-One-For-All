SELECT c.cancoes AS nome,
	COUNT(e.cancoes_id) AS reproducoes
FROM SpotifyClone.quantidade_cancoes AS c
INNER JOIN SpotifyClone.musicas_escutadas AS e
	ON c.cancoes_id = e.cancoes_id
INNER JOIN SpotifyClone.quantidade_usuarios AS u
	ON u.usuario_id = e.usuario_id    
WHERE plano_id = 1 OR plano_id = 3
GROUP BY nome
ORDER BY nome ASC;