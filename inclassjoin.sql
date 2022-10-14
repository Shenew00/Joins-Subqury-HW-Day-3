SELECT * FROM artist;

SELECT * from favorite_song;



--from clause (left table)
--join clause  (right table)

SELECT *
FROM artist
JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;

SELECT *
FROM favorite_song
JOIN artist
ON favorite_song.artist_id = artist.artist_id;

-- left join
SELECT *
FROM artist
LEFT JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;

-- right join
SELECT *
FROM artist
RIGHT JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;


-- full join (Outer join)
SELECT *
FROM artist
FULL JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;

--EXTRA STUFF TO KNOW ABOUT

SELECT artist_name, song_name, favorite_song.song_name,album,favorite_song
FROM artist
INNER JOIN favorite_song AS F_S
ON favorite_song.artist_id = artist.artist_id;


--ALIAS (USING AS KEYWORD
)
