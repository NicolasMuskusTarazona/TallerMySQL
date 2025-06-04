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
GROUP BY p.pedido_id;
-- 3. Encuentra los nombres de los clientes y 
-- los nombres de los empleados que gestionaron sus pedidos

SELECT clientes.nombre AS cliente, empleados.nombre AS empleado, pedidos.fecha_pedido
FROM pedidos
JOIN usuarios AS clientes ON pedidos.cliente_id = clientes.usuario_id
JOIN usuarios AS empleados ON pedidos.empleado_id = empleados.usuario_id;


