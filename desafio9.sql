SELECT COUNT(es.cancoes_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.quantidade_usuarios AS u
INNER JOIN SpotifyClone.musicas_escutadas AS es
	ON u.usuario_id = es.usuario_id
WHERE u.usuario = 'Barbara Liskov';