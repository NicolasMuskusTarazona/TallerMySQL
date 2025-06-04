-- Active: 1749069445371@@127.0.0.1@3307@taller
-- 1. Encuentra los nombres de los clientes y los detalles de sus pedidos.

SELECT DISTINCT usuarios.nombre, detalles_pedidos.pedido_id, detalles_pedidos.cantidad, detalles_pedidos.precio_unitario
FROM usuarios
JOIN pedidos ON pedidos.cliente_id = usuarios.usuario_id
JOIN detalles_pedidos ON detalles_pedidos.pedido_id = pedidos.pedido_id;

-- 2. Lista todos los productos pedidos junto con el 
-- precio unitario de cada pedido

SELECT p.pedido_id, GROUP_CONCAT(CONCAT(po.nombre,  ',',po.categoria)) AS productos, SUM(dp.cantidad * dp.precio_unitario) as Total
FROM pedidos AS p
INNER JOIN detalles_pedidos AS dp ON p.pedido_id = dp.pedido_id
INNER JOIN productos AS po ON dp.producto_id = po.producto_id
GROUP BY p.pedido_id;()
-- 3. Encuentra los nombres de los clientes y 
-- los nombres de los empleados que gestionaron sus pedidos

SELECT clientes.nombre AS cliente, empleados.nombre AS empleado, pedidos.fecha_pedido
FROM pedidos
JOIN usuarios AS clientes ON pedidos.cliente_id = clientes.usuario_id
JOIN usuarios AS empleados ON pedidos.empleado_id = empleados.usuario_id;

-- 4. Muestra todos los pedidos y, si existen, los productos en cada pedido, 
-- incluyendo los pedidos sin productos usando `LEFT JOIN`

SELECT 
    productos.nombre AS Producto,
    pedidos.cliente_id AS Cliente_id,
    pedidos.empleado_id AS Empleado_id,
    detalles_pedidos.cantidad AS Cantidad,
    pedidos.fecha_pedido AS Fecha,
    pedidos.estado AS Estado
FROM pedidos
LEFT JOIN detalles_pedidos
ON pedidos.pedido_id = detalles_pedidos.pedido_id
LEFT JOIN productos
ON detalles_pedidos.producto_id = productos.producto_id;

-- 5. Encuentra los productos y, si existen, 
-- los detalles de pedidos en los que no se ha 
-- incluido el producto usando `RIGHT JOIN`.

SELECT
    productos.producto_id,
    productos.nombre AS Nombre,
    productos.precio AS Precio,
    detalles_pedidos.cantidad AS Cantidad,
    detalles_pedidos.detalle_id AS DetallePedido_id
FROM detalles_pedidos
RIGHT JOIN productos
ON detalles_pedidos.producto_id = productos.producto_id;

-- 6. Lista todos los empleados junto con los pedidos que han gestionado, 
-- si existen, usando `LEFT JOIN` para ver los empleados sin pedidos.

SELECT
    empleados.empleado_id,
    empleados.puesto AS Puesto,
    empleados.fecha_contratacion AS FechaContratacion,
    empleados.salario AS Salario,
    pedidos.fecha_pedido AS FechaPedido,
    pedidos.estado AS Estado
FROM empleados
LEFT JOIN pedidos
ON empleados.empleado_id = pedidos.empleado_id;
