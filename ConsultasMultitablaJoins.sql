-- Active: 1749036754683@@127.0.0.1@3307@familia
-- 1. Encuentra los nombres de los clientes y los detalles de sus pedidos.

SELECT DISTINCT usuarios.nombre, detalles_pedidos.pedido_id, detalles_pedidos.producto_id 
FROM usuarios
JOIN pedidos ON pedidos.cliente_id = usuarios.usuario_id
JOIN detalles_pedidos ON detalles_pedidos.pedido_id = pedidos.pedido_id;

-- 2. Lista todos los productos pedidos junto con el 
-- precio unitario de cada pedido

SELECT DISTINCT nombre,precio,estado FROM pedidos
CROSS JOIN productos;