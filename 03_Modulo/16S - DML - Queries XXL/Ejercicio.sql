-- Reportes parte I - Repasamos INNER JOIN
-- Realizar una consulta de la facturación de e-market. Incluir la siguiente información:
-- ● Id de la factura
-- ● fecha de la factura
-- ● nombre de la empresa de correo
-- ● nombre del cliente
-- ● categoría del producto vendido
-- ● nombre del producto
-- ● precio unitario
-- ● cantidad

SELECT Facturas.FacturaID,FechaFactura,Correos.Compania, Contacto, Categorias.CategoriaNombre, Productos.ProductoNombre, Productos.PrecioUnitario, Cantidad FROM Facturas
INNER JOIN Correos ON Facturas.EnvioVia = Correos.CorreoID 
INNER JOIN Clientes ON Facturas.ClienteID = Clientes.ClienteID
INNER JOIN FacturaDetalle ON Facturas.FacturaID = FacturaDetalle.FacturaID
INNER JOIN Productos ON FacturaDetalle.ProductoID = Productos.ProductoID
INNER JOIN Categorias ON Categorias.CategoriaID = Productos.CategoriaID;
