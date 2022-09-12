-- Ejercicio 1
-- 1. Crear una vista para poder organizar los envíos de las facturas. 
-- Indicar número de factura, fecha de la factura y fecha de envío, ambas en formato dd/mm/yyyy, valor del transporte formateado con dos decimales, 
-- y la información del domicilio del destino incluyendo dirección, ciudad, código postal y país, en una columna llamada Destino.

CREATE VIEW enviofacturas as
SELECT Facturas.FacturaID NumeroDeFactura, 
DATE_FORMAT(Facturas.FechaEnvio, "%d %M %Y") FechaEnvio,
DATE_FORMAT(Facturas.FechaFactura, "%d %M %Y") FechaFactura, 
truncate(Transporte, 2),
concat (' Dirección: ', DireccionEnvio,' Ciudad: ', CiudadEnvio, ' Código Postal: ',CodigoPostalEnvio, ' Pais: ', PaisEnvio) Destino
FROM Facturas;
-- Aca creamos la vista
CREATE VIEW v_detalles_envio AS
SELECT FacturaID, 
DATE_FORMAT(FechaFactura,'%d/%m/%Y') AS fechaFactura, 
DATE_FORMAT(FechaEnvio,'%d/%m/%Y') AS MesEnvio, 
FORMAT(Transporte, 2) AS Transporte, 
CONCAT(DireccionEnvio, ' - ', CiudadEnvio, ' (', CodigoPostalEnvio,') ', PaisEnvio) AS Destino 
FROM facturas f;


-- 2. Realizar una consulta con todos los correos y el detalle de las facturas que usaron ese correo. Utilizar la vista creada. 

SELECT * FROM enviofacturas
INNER JOIN Correos ON  Facturas.EnvioVia  = Correos.CorreoID ;

-- y despues la utilizamos de la siguiente forma 

SELECT c.Compania, vd.* FROM correos c
LEFT JOIN facturas f ON f.enviovia = c.correoID
INNER JOIN v_detalles_envio vd ON f.FacturaID = vd.FacturaID;

-- 3. ¿Qué dificultad o problema encontrás en esta consigna? Proponer alguna alternativa o solución.
-- El ejercicio todo

-- Ejercicio 2
-- 1. Crear una vista con un detalle de los productos en stock. Indicar id, nombre del producto, nombre de la categoría y precio unitario. 

CREATE VIEW ProductosStock2 AS 
select ProductoID, ProductoNombre, CategoriaNombre, PrecioUnitario from Productos P
left join Categorias C
ON C.CategoriaID = P.ProductoID
where UnidadesStock > 0;

-- 2. Escribir una consulta que liste el nombre y la categoría de todos los productos vendidos. Utilizar la vista creada.

select ProductoNombre, CategoriaNombre FROM productosstock2
INNER JOIN FacturaDetalle ON FacturaDetalle.ProductoID = productosstock2.ProductoID;

-- 3. ¿Qué dificultad o problema encontrás en esta consigna? Proponer alguna alternativa o solución.
