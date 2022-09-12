-- 1. Reportar los productos (nombre en mayúsculas), stock, unidad de medida y precio (agregar el signo de la moneda). Ordenarlos por nombre de producto.

SELECT UPPER(p.nombre) nombre,p.stock,um.nombre,concat ( "$ " , p.precio) precio  FROM producto p
LEFT JOIN unidad_medida um
ON p.unidad_medida_id = um.id
ORDER BY p.nombre;

-- 2.1 Reportar los productos (nombre en minúsculas), stock y las unidades de medidas sin importar si están o no asignadas a algún producto. Mostrar la
-- leyenda –Sin Asignación- para los productos que figuren como nulos. Ordenarlos por el nombre de la unidad de medida.

SELECT COALESCE(LOWER(p.nombre), '-Sin Asignación-') Producto,p.stock, um.nombre AS 'Unidad_de_medida' 
FROM producto p 
RIGHT JOIN unidad_medida um
ON p.unidad_medida_id = um.id
ORDER BY um.nombre;

-- 2.2 Modificar la consulta (2.1) para que muestre solamente los registros donde las unidades de medida aún no fueron asignadas a algún producto.

SELECT COALESCE(LOWER(p.nombre), '-Sin Asignación-') AS Producto, stock
AS Stock, um.nombre AS 'Unidad_de_medida' 
FROM producto p 
RIGHT JOIN unidad_medida um
ON p.unidad_medida_id = um.id
WHERE P.unidad_medida_id is null
ORDER BY um.nombre;

-- 3.1 Listar todas las ventas mostrando el número de factura, nombre del producto, cantidad, importe y total facturado. Ordenarlo por número de factura.

SELECT f.id,p.nombre, fd.cantidad,fd.importe, f.total facturado FROM factura_detalle fd
INNER JOIN factura f
ON fd.factura_id = f.id
INNER JOIN producto p
ON fd.producto_id = p.id
ORDER BY f.id;

-- 3.2 Modificar la consulta (3.1) para que muestre todas las ventas incluyendo a aquellos productos que aún no han sido vendidos. Finalmente, ordenarlo por
-- número de Factura.

SELECT f.id,p.nombre, fd.cantidad,fd.importe, f.total facturado FROM factura_detalle fd
INNER JOIN factura f
ON fd.factura_id = f.id
RIGHT JOIN producto p
ON fd.producto_id = p.id
ORDER BY f.id;

-- 4.1 Listar todas las ventas mostrando el número de factura, fecha, nombre completo del cliente, nombre del producto, cantidad, unidad de medida,
-- importe y total facturado. Ordenarlo por el número de factura de mayor a menor.

SELECT f.id,f.fecha,CONCAT (c.nombre," ",c.apellido) Cliente, p.nombre Producto, fd.cantidad, um.nombre unidad_de_medida, fd.importe importe, f.total total_facturado FROM factura_detalle fd
RIGHT JOIN factura f ON fd.factura_id = f.id
INNER JOIN cliente c ON f.cliente_id = c.id
LEFT JOIN producto p ON fd.producto_id = p.id
LEFT JOIN unidad_medida um ON p.unidad_medida_id = um.id
ORDER BY f.id DESC;

-- 4.2 Modificar la consulta (4.1) para que muestre todas las ventas incluyendo a aquellos productos que aún no han sido vendidos. Finalmente, ordenarlo por
-- número de factura.

SELECT f.id,f.fecha,CONCAT (c.nombre," ",c.apellido) Cliente, p.nombre Producto, fd.cantidad, um.nombre unidad_de_medida, fd.importe importe, f.total total_facturado FROM factura_detalle fd
RIGHT JOIN factura f ON fd.factura_id = f.id
INNER JOIN cliente c ON f.cliente_id = c.id
RIGHT JOIN producto p ON fd.producto_id = p.id
LEFT JOIN unidad_medida um ON p.unidad_medida_id = um.id
ORDER BY f.id ;

-- 4.3 Modificar la consulta (4.1) para que muestre todas las ventas incluyendo a
-- aquellos clientes que aún no han realizado alguna compra. Finalmente,
-- ordenarlo por número de factura.

SELECT f.id,f.fecha,CONCAT (c.nombre," ",c.apellido) Cliente, p.nombre Producto, fd.cantidad, um.nombre unidad_de_medida, fd.importe importe, f.total total_facturado FROM factura_detalle fd
RIGHT JOIN factura f ON fd.factura_id = f.id
RIGHT JOIN cliente c ON f.cliente_id = c.id
LEFT JOIN producto p ON fd.producto_id = p.id
LEFT JOIN unidad_medida um ON p.unidad_medida_id = um.id
ORDER BY f.id DESC;

-- 4.4 Modificar la consulta (4.1) para que muestre todas las ventas incluyendo a aquellos productos que aún no han sido vendidos y las unidades de medidas
-- que aún no han sido asignadas a algún producto.

SELECT f.id,f.fecha,CONCAT (c.nombre," ",c.apellido) Cliente, p.nombre Producto, fd.cantidad, um.nombre unidad_de_medida, fd.importe importe, f.total total_facturado FROM factura_detalle fd
RIGHT JOIN factura f ON fd.factura_id = f.id
INNER JOIN cliente c ON f.cliente_id = c.id
RIGHT JOIN producto p ON fd.producto_id = p.id
RIGHT JOIN unidad_medida um ON p.unidad_medida_id = um.id
ORDER BY f.id DESC;

-- 5.1 Reportar los productos y cantidades que ha comprado cada cliente (id y nombre completo). Ordenar por cliente en forma descendente
-- y por producto en forma ascendente.
SELECT c.id, CONCAT ( c.nombre," ",c.apellido) Cliente, p.nombre Producto,SUM(fd.cantidad) Cantidad_de_Productos FROM cliente c
INNER JOIN factura f ON c.id = f.cliente_id
INNER JOIN factura_detalle fd ON f.id = fd.factura_id
INNER JOIN producto p ON fd.producto_id = p.id
GROUP BY c.id, cliente, producto
ORDER BY Cliente DESC , Producto;



