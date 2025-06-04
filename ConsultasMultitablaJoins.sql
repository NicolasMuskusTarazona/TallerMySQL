-- Active: 1749036754683@@127.0.0.1@3307@taller
-- 1. Encuentra los nombres de los clientes y los detalles de sus pedidos.

SELECT DISTINCT usuarios.nombre, detalles_pedidos.pedido_id, detalles_pedidos.cantidad, detalles_pedidos.precio_unitario
FROM usuarios
JOIN pedidos ON pedidos.cliente_id = usuarios.usuario_id
JOIN detalles_pedidos ON detalles_pedidos.pedido_id = pedidos.pedido_id;

-- 2. Lista todos los productos pedidos junto con el 
-- precio unitario de cada pedido

SELECT nombre,precio,estado FROM pedidos
CROSS JOIN productos;

-- 3. Encuentra los nombres de los clientes y 
-- los nombres de los empleados que gestionaron sus pedidos

SELECT usuarios.nombre, pedidos.fecha_pedido, productos.nombre
FROM usuarios
INNER JOIN pedidos ON usuarios.usuario_id = pedidos.cliente_id
INNER JOIN productos ON pedido_producto.id_producto = productos.id_producto;

