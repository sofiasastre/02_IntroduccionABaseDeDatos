-- Listar las canciones que poseen la letra “z” en su título.
SELECT * FROM cancion WHERE titulo LIKE "%z%";

-- Listar las canciones que poseen como segundo carácter la letra “a” y como último, la letra “s”.
SELECT * FROM cancion WHERE titulo LIKE "_a%s";

-- Mostrar la playlist que tiene más canciones, renombrando las columnas poniendo mayúsculas en la primera letra, 
-- los tildes correspondientes y agregar los espacios entre palabras.
SELECT idPlaylist AS 'Id Playlist', idusuario AS 'Id Usuario', titulo AS 'Título', cantcanciones AS 'Cantidad de Canciónes' 
FROM playlist ORDER BY cantcanciones DESC LIMIT 1;

-- En otro momento se obtuvo un listado con los 5 usuarios más jóvenes, obtener un listado de los 10 siguientes.
SELECT * FROM usuario 
ORDER BY fecha_nac 
LIMIT 10
OFFSET 5;

-- Listar las 5 canciones con más reproducciones, ordenadas descendentemente.
SELECT * FROM cancion
ORDER BY cantreproduccion DESC
LIMIT 5;

-- Generar un reporte de todos los álbumes ordenados alfabéticamente.
SELECT * FROM album
ORDER BY titulo;

-- Listar todos los álbumes que no tengan imagen, ordenados alfabéticamente.
SELECT * FROM album
WHERE imagenportada IS NULL
ORDER BY titulo;

-- Insertar un usuario nuevo con los siguientes datos (tener en cuenta las relaciones):
-- a) nombreusuario: nuevousuariodespotify@gmail.com
-- b) Nombre y apellido: Elmer Gomez
-- c) password: S4321m
-- d) Fecha de nacimiento: 15/11/1991
-- e) Sexo: Masculino
-- f) Código Postal: B4129ATF
-- g) País: Colombia
SELECT * FROM usuario;
Select * FROM pais WHERE Pais = "Colombia";
INSERT INTO usuario (idUsuario, nombreusuario, nyap, fecha_nac, sexo, CP, Pais_idPais)
VALUES (DEFAULT, 'nuevousuariodespotify@gmail.com', 'Elmer Gomez', '1991-11-15' ,'M', 'B4129ATF', '2');

-- Editar todos los artistas que no tengan una imagen cargada y cargarles el texto “Imagen faltante” en la columna de imagen.
UPDATE artista SET imagen = 'imagen faltante' 
WHERE imagen IS NULL;

SELECT * FROM artista