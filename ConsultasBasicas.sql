
-- 1. Consulta todos los datos de la tabla `usuarios` para ver la lista completa de clientes.

SELECT * FROM usuarios;

-- 2. Muestra los nombres y correos electrónicos de todos los clientes que residen en la ciudad de Madrid.

SELECT nombre,email,ciudad FROM usuarios
WHERE ciudad = 'Madrid';