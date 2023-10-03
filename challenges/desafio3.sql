SELECT 
	u.user_name AS pessoa_usuaria,
    COUNT(h.music_id) AS musicas_ouvidas,
	ROUND(SUM(m.duration) / 60, 2) AS total_minutos
FROM SpotifyClone.users u
JOIN SpotifyClone.historic h
ON u.user_id = h.user_id
JOIN SpotifyClone.musics m
ON h.music_id = m.music_id
GROUP BY u.user_name
ORDER BY u.user_name;