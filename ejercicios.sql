SELECT name FROM movies WHERE year = 1992;



SELECT COUNT (*) FROM movies WHERE year=1982;



SELECT * FROM actors WHERE last_name LIKE '%stack%';



SELECT first_name, COUNT (*) as popularidad FROM 
(SELECT first_name FROM actors
UNION ALL 
SELECT first_name FROM directors)
as todas_las_tablas
GROUP BY first_name
ORDER BY popularidad DESC
LIMIT 10;

SELECT last_name, COUNT (*) as popularidad FROM 
(SELECT last_name FROM actors
UNION ALL 
SELECT last_name FROM directors)
as todas_las_tablas
GROUP BY last_name
ORDER BY popularidad DESC
LIMIT 10;

SELECT first_name ||' '||last_name, COUNT (*) as occurrences FROM  actors
GROUP BY full_name
ORDER BY occurrences DESC
LIMIT 10;



PARA VER ID CON CANT DE PELICULAS

SELECT actor_id, COUNT(movie_id) AS cantidad_peliculas
FROM roles
GROUP BY actor_id
ORDER BY cantidad_peliculas DESC;
LIMIT 100


PARA PONER EL NOMBRE Y APELLIDO POR CANTIDAD DE PELICULAS
SELECT actors.first_name,actors.last_name, COUNT(movie_id) AS cantidad_peliculas
FROM roles JOIN actors ON roles.actor_id=actors.id  GROUP BY actor_id ORDER BY cantidad_peliculas DESC LIMIT 100;


movies genres
SELECT genre , COUNT(movie.id) AS cantidad_generos
FROM movies_genres JOIN movies ON movies_id = movies.id 
GROUP BY genre ORDER BY cantidad_generos 

actores de pelicula braveheart
perfecto:
SELECT first_name, last_name
FROM actors
INNER JOIN roles ON actors.id = roles.actor_id
INNER JOIN movies ON roles.movie_id = movies.id
WHERE movies.name = 'Braveheart'
ORDER BY last_name ASC;

los directores que dirigieron una película de género 'Film-Noir' 
en un año bisiesto (hagamos de cuenta que todos los años divisibles por 4 son años bisiestos) NO DA!!!!

SELECT directors.first_name, directors.last_name, movies.name, movies.year FROM movies
INNER JOIN movies_genres ON movies.id = movies_genres.movie_id
INNER JOIN directors_genres ON movies_genres.genre = directors_genres.genre
INNER JOIN directors ON directors_genres.director_id = directors.id
WHERE movies.year % 4  = 0 AND directors_genres.genre = 'Film-Noir'
ORDER BY movies.name ASC ;


SELECT DISTINCT d.first_name, d.last_name
FROM directors d
JOIN directors_genres dg ON d.id = dg.director_ID
JOIN movies m ON m.id_director = d.id_directr
JOIN movies_genres pg ON m.id = pg.movie_id
WHERE pg.genre = 'Film Noir' AND m.year % 4 = 0;