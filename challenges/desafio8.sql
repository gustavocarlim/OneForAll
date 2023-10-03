SELECT
  a.artist_name 'artista',
  al.album_name 'album'
  FROM SpotifyClone.artists a
  INNER JOIN SpotifyClone.albuns al
  ON a.artist_id = al.artist_id
  WHERE a.artist_name = 'Elis Regina'
  ORDER BY album;