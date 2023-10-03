SELECT 
  a.artist_name AS 'artista',
  al.album_name AS 'album',
  COUNT(f.artist_id) AS 'pessoas_seguidoras'
  FROM SpotifyClone.artists a
  INNER JOIN SpotifyClone.albuns al
  ON a.artist_id = al.artist_id
  INNER JOIN SpotifyClone.following f
  ON a.artist_id = f.artist_id
  GROUP BY a.artist_name, al.album_name
  ORDER BY pessoas_seguidoras DESC, artista, album;