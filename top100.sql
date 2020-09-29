--1
CREATE DATABASE peliculas;
--2
CREATE TABLE pelicula (
id INT PRIMARY KEY,
pelicula VARCHAR(250),
estreno INT,
director VARCHAR(50));

CREATE TABLE actores (
id_pelicula INT,
actor VARCHAR(50),
FOREIGN KEY (id_pelicula) REFERENCES pelicula(id));
--3
\copy pelicula FROM 'peliculas.csv' csv header;

\copy actores FROM 'reparto.csv' csv;
--4
SELECT pelicula, estreno, director, actor FROM pelicula INNER JOIN actores ON pelicula.id = actores.id_pelicula WHERE pelicula.pelicula = 'Titanic';
--5
SELECT pelicula FROM pelicula INNER JOIN actores ON pelicula.id = actores.id_pelicula WHERE actor='Harrison Ford';
--6
SELECT COUNT(director) AS contador, director FROM pelicula GROUP BY director ORDER BY contador DESC LIMIT 10;
--7
SELECT COUNT(DISTINCT actor) FROM actores;
--8
SELECT pelicula, estreno FROM pelicula WHERE estreno BETWEEN 1990 AND 1999 ORDER BY estreno ASC;
--9
SELECT pelicula, estreno FROM pelicula INNER JOIN actores ON pelicula.id = actores.id_pelicula WHERE estreno=2001;
--10
SELECT actor, estreno FROM pelicula INNER JOIN actores ON pelicula.id = actores.id_pelicula WHERE estreno IN (SELECT MAX(estreno) FROM pelicula);