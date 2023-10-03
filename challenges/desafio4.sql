  SELECT
    u.user_name AS pessoa_usuaria,
    IF(MAX(reproduction_date) >= '2021-01-01','Ativa','Inativa' 
      ) AS status_pessoa_usuaria
FROM
    SpotifyClone.users u
JOIN
    SpotifyClone.historic h ON u.user_id = h.user_id
GROUP BY
    u.user_name
ORDER BY
    u.user_name;

    