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

SELECT f.FacturaID, f.FechaFactura, c.Compania, cl.Contacto, ca.CategoriaNombre AS Nombre, p.ProductoNombre AS Producto, fd.PrecioUnitario, fd.Cantidad FROM facturas f
INNER JOIN correos c ON f.EnvioVia = c.CorreoID
INNER JOIN clientes cl ON f.ClienteID = cl.ClienteID
INNER JOIN facturadetalle fd ON f.FacturaID = fd.FacturaID
INNER JOIN productos p ON fd.ProductoID = p.ProductoID
INNER JOIN categorias ca ON p.CategoriaID = ca.CategoriaID;
