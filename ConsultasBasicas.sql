
-- 1. Consulta todos los datos de la tabla `usuarios` para ver la lista completa de clientes.

SELECT * FROM usuarios;

-- 2. Muestra los nombres y correos electrónicos de todos los clientes que residen en la ciudad de Madrid.

SELECT nombre,email,ciudad FROM usuarios
WHERE ciudad = 'Madrid';

-- 3. Obtén una lista de productos con un precio mayor a $100.000, mostrando solo el nombre y el precio.

SELECT nombre,precio FROM productos
WHERE precio >100000;