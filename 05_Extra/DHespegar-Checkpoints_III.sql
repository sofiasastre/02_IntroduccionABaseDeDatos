-- 1. Listar todas las reservas de hoteles realizadas en la ciudad de Nápoles.
SELECT r.codigoReserva, r.fechaRegistro, h.nombre   FROM hoteles h
INNER JOIN hotelesxreserva hr ON h.idhotel = hr.idHotel
INNER JOIN reservas r ON hr.idreserva = r.idreserva
WHERE ciudad = "Napoles";

-- 2. Listar el número de pago (idpago), el precio, la cantidad de cuotas de todas las reservas realizadas con tarjeta de crédito.
SELECT p.idpago, p.precioTotal, p.cantidadCuotas FROM pagos p
inner join metodospago mp on mp.idMetodosPago = p.idMetodosPago
where mp.nombre = 'Tarjeta de Crédito';

-- 3. Listar la cantidad de reservas realizadas de acuerdo al método de pago.
SELECT p.idpago, p.precioTotal, p.cantidadCuotas FROM pagos p
inner join metodospago mp on mp.idMetodosPago = p.idMetodosPago
where mp.nombre = 'Tarjeta de Crédito';

-- 4. Listar las reservas de los clientes cuyo pago lo hicieron a través de tarjeta de crédito, se pide mostrar el nombre, apellido, país y el método de pago.
SELECT C.nombres, C.apellidos, p.nombre,mp.nombre FROM RESERVAS R
inner join CLIENTES C ON R.idcliente = C.idcliente
inner join paises p on p.idpais = c.idpais
inner join pagos pg on pg.idpago = r.idpago
inner join metodospago mp on mp.idmetodospago = pg.idMetodosPago
where mp.nombre = 'Tarjeta de Crédito';

-- 5. Listar la cantidad de reservas de hoteles por país, se necesita mostrar el nombre del país y la cantidad.
select count(r.idreserva)as 'numero de reservas',p.nombre  from reservas r
inner join sucursales s on s.idSucursal = r.idSucursal
inner join paises p on p.idpais = s.idPais
group by p.nombre;

-- 6. Listar el nombre, apellido, número de pasaporte,ciudad y nombre del país de los clientes de origen Peruano.
SELECT cl.nombres, cl.apellidos,cl.numeroPasaporte, cl.ciudad, p.nombre Pais  FROM clientes cl
INNER JOIN paises p ON cl.idpais = p.idpais
WHERE p.nombre = "peru";

-- 7. Listar la cantidad de reservas realizadas de acuerdo al método de pago y el nombre completo del cliente.
SELECT  CONCAT(cl.nombres," ", cl.apellidos)  nombre_cliente, mp.nombre  metodo_de_pago, COUNT(r.idreserva) FROM reservas r
INNER JOIN clientes cl ON r.idcliente = cl.idcliente
INNER JOIN pagos p ON r.idpago = p.idpago
INNER JOIN metodospago mp ON p.idmetodospago = mp.idmetodospago
GROUP BY nombre_cliente, mp.nombre;

-- 8. Mostrar la cantidad de clientes por país, se necesita visualizar el nombre del país y la cantidad de clientes.
SELECT p.nombre, COUNT(cl.idcliente) cantidad_clientes FROM clientes cl
INNER JOIN paises p ON cl.idpais = p.idpais
GROUP BY p.nombre;

-- 9. Listar todas las reservas de hotel, se pide mostrar el nombre del hotel,dirección, ciudad, el país, el tipo de pensión y que tengan como tipo de hospedaje 'Media pensión'.
SELECT h.nombre Hotel, h.direccion, h.ciudad,p.nombre pais, th.nombre tipo_hospedaje FROM hoteles h
INNER JOIN paises p ON h.idpais = p.idpais
INNER JOIN hotelesxreserva hr ON h.idhotel = hr.idHotel
INNER JOIN tiposhospedaje th ON hr.idTiposHospedaje = th.idtiposhospedaje
WHERE th.nombre = "Media Pension";

-- 10. Mostrar por cada método de pago el monto total obtenido,se pide visualizar el nombre del método de pago y el total.
SELECT mp.nombre metodo_pago, SUM(p.precioTotal) total FROM pagos p
INNER JOIN metodospago mp ON p.idMetodosPago = mp.idmetodospago
GROUP BY mp.nombre;

-- 11. Mostrar la suma de los pagos realizados en la sucursal de Mendoza, llamar al resultado “TOTAL MENDOZA”.
SELECT SUM(precioTotal) TOTAL_MENDOZA FROM pagos p
INNER JOIN reservas r ON p.idpago = r.idPago
INNER JOIN sucursales s ON r.idSucursal = s.idSucursal
WHERE ciudad = "Mendoza";

-- 12. Listar todos los clientes que no han realizado reservas.
SELECT c.idcliente, c.nombres, c.apellidos FROM reservas r
RIGHT JOIN clientes c  ON  r.idCliente = c.idcliente
WHERE idreserva IS NULL
ORDER BY c.idcliente;

-- 13. Listar todas las reservas de vuelos realizadas donde el origen sea Chile y el destino Ecuador, mostrar el id Reserva, id Vuelo, fecha de partida, fecha de llegada, 
-- fecha de la reserva.
SELECT vr.idReserva, v.idVuelo, fechaPartida, fechaLlegada, r.fechaRegistro FROM vuelosxreserva vr
INNER JOIN vuelos v ON vr.idVuelo = v.idvuelo
INNER JOIN reservas r ON r.idreserva = vr.idReserva
WHERE origen = 'CHILE' AND destino = 'ECUADOR';

-- 14. Listar el nombre y cantidad de habitaciones de aquellos hoteles que tengan de 30 a 70 habitaciones pertenecientes al país Argentina.
SELECT h.nombre, h.cantidadHabitaciones, p.nombre FROM hoteles h
INNER JOIN paises p ON p.idpais = h.idPais
WHERE cantidadHabitaciones between 29 and 71 AND p.nombre LIKE "%ina";

-- 15. Listar el top 10 de hoteles más utilizados y la cantidad de reservas en las que ha sido reservado.
SELECT count(h.nombre) cantidadR, h.nombre FROM hotelesxreserva hr
INNER JOIN hoteles h ON hr.idHotel = h.idhotel
GROUP BY h.nombre
ORDER BY cantidadR DESC
LIMIT 10;

-- 16. Listar los clientes (nombre y apellido) y cuáles han sido los medios de pago que han utilizado, esta lista deberá estar ordenada por apellidos de manera ascendente.
SELECT clientes.nombres AS Nombre, clientes.apellidos AS Apellido, metodospago.nombre AS 'Medio de Pago' FROM clientes
LEFT JOIN reservas ON reservas.idCliente = clientes.idcliente
LEFT JOIN pagos ON pagos.idpago = reservas.idPago
LEFT JOIN metodospago ON metodospago.idmetodospago = pagos.idMetodosPago
ORDER BY clientes.apellidos;
-- 17. Listar la cantidad de reservas que se realizaron para los vuelos que el origen ha sido de Argentina o Colombia, en el horario de las 18hs. 
-- Mostrar la cantidad de vuelos, la fecha de partida,número de vuelo, país de origen y de destino.

SELECT COUNT(r.idreserva), COUNT(v.idvuelo), v.fechaPartida, v.nroVuelo, v.origen, v.destino FROM reservas r
INNER JOIN vuelosxreserva vr ON r.idreserva = vr.idReserva
INNER JOIN vuelos v ON v.idvuelo = vr.idVuelo
WHERE (v.origen = "Colombia" OR v.origen = "Argentina") AND EXTRACT(HOUR FROM r.fechaRegistro) = 18
GROUP BY v.origen;

SELECT COUNT(r.idreserva), COUNT(v.idvuelo), v.fechaPartida, v.nroVuelo, v.origen, v.destino FROM reservas r
INNER JOIN vuelosxreserva vr ON r.idreserva = vr.idReserva
INNER JOIN vuelos v ON v.idvuelo = vr.idVuelo
WHERE (v.origen = "Colombia" OR v.origen = "Argentina") AND EXTRACT(HOUR FROM r.fechaRegistro) = 18
GROUP BY v.origen, v.idvuelo;

-- 18. Mostrar los totales de ventas por países y ordenarlas de mayor a menor.
SELECT p.nombre, SUM(pg.precioTotal) AS 'Ventas totales' FROM reservas r
INNER JOIN sucursales s ON s.idSucursal = r.idSucursal
INNER JOIN paises p ON p.idpais = s.idPais
INNER JOIN pagos pg ON pg.idpago = r.idpago
WHERE r.idPago IS NOT NULL
GROUP BY p.nombre
ORDER BY SUM(pg.precioTotal) DESC;

-- 19. Mostrar los países que no tienen clientes asignados ordenados por los que empiezan por Z primero.
SELECT p.nombre FROM paises p
LEFT JOIN clientes c ON p.idPais = c.idPais
WHERE c.idPais IS NULL
ORDER BY p.nombre;
 
-- 20. Generar un listado con los hoteles que no tuvieron reservas realizadas.
SELECT h.nombre FROM hotelesxreserva hr
RIGHT JOIN hoteles h ON hr.idhotel = h.idhotel
WHERE hr.idReserva IS NULL;

-- Se solicita
-- ● Generar una consulta SQL por cada uno de los puntos de la consigna.
-- ● Armar un solo documento (.sql) que contenga todos los puntos de la consigna y las correspondientes consultas SQL. El mismo deberá:
-- ○ Tener como nombre de archivo: CheckPointIII_Numero_Grupo
-- ○ En el inicio de la primera hoja del documento deberá incluir el código de la camada, número de grupo y los nombres y apellidos de todos los integrantes.
-- ○ Debajo de cada consulta SQL, se debe escribir de forma comentada el número de la cantidad de registros que devuelve. 
-- Aclaración: Este checkpoint no es evaluable.