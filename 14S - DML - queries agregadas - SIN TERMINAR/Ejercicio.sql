-- Clientes
-- 1) ¿Cuántos clientes existen?
SELECT count(*) FROM Clientes;

-- 2) ¿Cuántos clientes hay por ciudad?
SELECT count(*), Ciudad FROM Clientes GROUP BY Ciudad;

-- Facturas
-- 1) ¿Cuál es el total de transporte?

SELECT sum(Transporte) as TotalTransporte
FROM Facturas;

-- 2) ¿Cuál es el total de transporte por EnvioVia (empresa de envío)?
SELECT sum(Transporte), EnvioVia
FROM Facturas
GROUP BY EnvioVia;

-- 3) Calcular la cantidad de facturas por cliente. Ordenar descendentemente por cantidad de facturas.
SELECT ClienteID, count(FacturaID)
FROM Facturas
GROUP BY ClienteID
ORDER BY count(FacturaID) DESC;

-- 4) Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.
SELECT ClienteID, count(FacturaID)
FROM Facturas
GROUP BY ClienteID
ORDER BY count(FacturaID) DESC
LIMIT 5;

-- 5) ¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?
SELECT PaisEnvio, count(FacturaID)
FROM Facturas
GROUP BY PaisEnvio
ORDER BY count(PaisEnvio)
LIMIT 1;

-- 6) Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado realizó más operaciones de ventas?
SELECT EmpleadoID, count(FacturaID)
FROM Facturas
GROUP BY EmpleadoID
ORDER BY count(FacturaID) DESC
LIMIT 1;

-- Factura detalle
-- 1) ¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?
SELECT ProductoID, count(FacturaID)
FROM FacturaDetalle
GROUP BY ProductoID
ORDER BY count(FacturaID) DESC
LIMIT 1;

-- 2) ¿Cuál es el total facturado? Considerar que el total facturado es la suma de cantidad por precio unitario.
SELECT SUM(PrecioUnitario * Cantidad) as 'Total Facturado' 
FROM facturadetalle;

-- 3) ¿Cuál es el total facturado para los productos ID entre 30 y 50?
SELECT SUM(PrecioUnitario * Cantidad) as 'Total Facturado' 
FROM facturadetalle
WHERE ProductoID BETWEEN 30 AND 50;

-- 4) ¿Cuál es el precio unitario promedio de cada producto?
SELECT ProductoID, AVG(PrecioUnitario) 
FROM facturadetalle;

-- 5) ¿Cuál es el precio unitario máximo?
SELECT ProductoID, MAX(PrecioUnitario) 
FROM facturadetalle;