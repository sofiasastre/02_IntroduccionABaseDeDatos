-- Consultas SELECT y GROUP BY
-- Realizar los siguientes informes:
-- 1. Listar las canciones cuya duración sea mayor a 2 minutos.
SELECT * FROM canciones
WHERE milisegundos > 120000;

-- 2. Listar las canciones cuyo nombre comience con una vocal.
SELECT * FROM canciones WHERE nombre LIKE 'a%' 
OR nombre LIKE 'e%'
OR nombre LIKE 'i%'
OR nombre LIKE 'o%'
OR nombre LIKE 'u%';

-- 3. Listar las canciones ordenadas por compositor en forma descendente. Luego, por nombre en forma ascendente. Incluir únicamente aquellas canciones que tengan compositor.;
SELECT * FROM canciones
WHERE compositor IS NOT NULL
ORDER BY compositor DESC, nombre;

-- 4. a) Listar la cantidad de canciones de cada compositor.
SELECT count(*), compositor FROM canciones 
group by compositor;

-- b) Modificar la consulta para incluir únicamente los compositores que tengan más de 10 canciones.
SELECT compositor, count(compositor) as cantidad FROM canciones
GROUP BY compositor
HAVING cantidad > 10;

-- 5. a) Listar el total facturado agrupado por ciudad.
SELECT ciudad_de_facturacion, SUM(total) FROM facturas
GROUP BY ciudad_de_facturacion;

-- b) Modificar el listado del punto (a) mostrando únicamente las ciudades de Canadá.
SELECT ciudad_de_facturacion, SUM(total),pais_de_facturacion FROM facturas
WHERE pais_de_facturacion = 'Canadá'
GROUP BY ciudad_de_facturacion;

-- c) Modificar el listado del punto (a) mostrando únicamente las ciudades con una facturación mayor a 38.
SELECT ciudad_de_facturacion, SUM(total) as Total FROM facturas
GROUP BY ciudad_de_facturacion
HAVING  Total > 38;

-- d) Modificar el listado del punto (a) agrupando la facturación por país, y luego por ciudad.
SELECT ciudad_de_facturacion, SUM(total) as Total, pais_de_facturacion FROM facturas
GROUP BY pais_de_facturacion, ciudad_de_facturacion;

-- 6. a) Listar la duración mínima, máxima y promedio de las canciones.
SELECT MAX(milisegundos), MIN(milisegundos), AVG(milisegundos) FROM canciones;

-- b) Modificar el punto (a) mostrando la información agrupada por género.
SELECT MAX(milisegundos), MIN(milisegundos), AVG(milisegundos), generos.nombre FROM canciones
INNER JOIN generos ON generos.id =  canciones.id_genero
GROUP BY generos.nombre;


