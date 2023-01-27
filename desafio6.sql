SELECT MIN(p.valor_plano) AS faturamento_minimo,
	MAX(p.valor_plano) AS faturamento_maximo,
    ROUND(SUM(p.valor_plano)/COUNT(p.valor_plano), 2) AS faturamento_medio,
    SUM(p.valor_plano) AS faturamento_total
FROM SpotifyClone.quantidade_planos AS p
INNER JOIN SpotifyClone.quantidade_usuarios AS u
	ON p.plano_id = u.plano_id