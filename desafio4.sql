SELECT u.usuario AS usuario,
	IF(MAX(YEAR(e.data_reproducao))>=2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.quantidade_usuarios AS u
INNER JOIN SpotifyClone.musicas_escutadas AS e
	ON u.usuario_id = e.usuario_id
GROUP BY u.usuario
ORDER BY u.usuario ASC;