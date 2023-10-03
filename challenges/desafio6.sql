SELECT 
  ROUND(MIN(p.cost), 2) AS 'faturamento_minimo',
  ROUND(MAX(p.cost), 2) AS 'faturamento_maximo',
  ROUND(AVG(p.cost), 2) AS 'faturamento_medio',
  ROUND(SUM(p.cost), 2) AS 'faturamento_total'
  FROM SpotifyClone.subscription_plan p
  INNER JOIN SpotifyClone.users u
  ON u.subscription_plan_id = p.plan_id;