-- Active: 1749069445371@@127.0.0.1@3307@taller

-- 1. Encuentra los nombres de los clientes que han 
-- realizado al menos un pedido de más de $500.000.
SELECT nombre
FROM usuarios
WHERE usuario_id IN (
    SELECT pedidos.cliente_id
    FROM pedidos
    JOIN detalles_pedidos
        ON pedidos.pedido_id = detalles_pedidos.pedido_id
    GROUP BY pedidos.cliente_id
    HAVING SUM(detalles_pedidos.precio_unitario * detalles_pedidos.cantidad) > 500000
);

-- 2. Muestra los productos que nunca han sido pedidos.

SELECT nombre
FROM productos
WHERE producto_id NOT IN (
    SELECT producto_id
    FROM detalles_pedidos
);

-- 3. Lista los empleados que han gestionado pedidos en los últimos seis meses.

SELECT DISTINCT 
    empleados.empleado_id, 
    empleados.fecha_contratacion
FROM empleados
JOIN pedidos ON empleados.empleado_id = pedidos.empleado_id
WHERE pedidos.fecha_pedido >= DATE_SUB(NOW(), INTERVAL 6 MONTH);

-- 4. Encuentra el pedido con el total de ventas más alto.

SELECT 
    detalles_pedidos.pedido_id,
    SUM(detalles_pedidos.cantidad * detalles_pedidos.precio_unitario) AS total_venta
FROM 
    detalles_pedidos
GROUP BY 
    detalles_pedidos.pedido_id
ORDER BY 
    total_venta DESC
LIMIT 1;
