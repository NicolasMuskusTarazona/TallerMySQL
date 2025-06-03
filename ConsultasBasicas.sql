
-- 1. Consulta todos los datos de la tabla `usuarios` para ver la lista completa de clientes.

SELECT * FROM usuarios;

-- 2. Muestra los nombres y correos electrónicos de todos los clientes que residen en la ciudad de Madrid.

SELECT nombre,email,ciudad FROM usuarios
WHERE ciudad = 'Madrid';

-- 3. Obtén una lista de productos con un precio mayor a $100.000, mostrando solo el nombre y el precio.

SELECT nombre,precio FROM productos
WHERE precio >100000;

-- 4. Encuentra todos los empleados que tienen un salario superior a $2.500.000, mostrando su nombre, puesto y salario. 

SELECT usuarios.nombre,empleados.puesto, empleados.salario
FROM usuarios
JOIN empleados ON usuarios.usuario_id = empleados.usuario_id
WHERE empleados.salario > 2500000;

-- 5. Lista los nombres de los productos en la categoría "Electrónica", ordenados alfabéticamente.

SELECT nombre,categoria FROM productos
WHERE categoria = 'Electrónica'
ORDER BY nombre ASC;

-- 6. Muestra los detalles de los pedidos que están en estado "Pendiente", 
--    incluyendo el ID del pedido, el ID del cliente y la fecha del pedido.

SELECT 
    pedidos.cliente_id, 
    pedidos.fecha_pedido, 
    detalles_pedidos.pedido_id
FROM 
    pedidos
JOIN 
    detalles_pedidos 
ON 
    pedidos.pedido_id = detalles_pedidos.pedido_id;
