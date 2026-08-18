
-- Vista base del proyecto

SELECT 
    Productos.nombre_producto as producto,
    Categorias.nombre_categoria as categoria,
    Clientes.nombre,
    Clientes.ciudad,
    Clientes.email,
    Clientes.fecha_registro,
    Ventas.cantidad,
    Ventas.precio_unitario,
    Ventas.fecha_venta,
    Ventas.cantidad * Ventas.precio_unitario as total
FROM Ventas 
INNER JOIN Productos
    ON Productos.id_producto = Ventas.id_producto
INNER JOIN Categorias
    ON Categorias.id_categoria = Productos.id_categoria
INNER JOIN Clientes
    ON Clientes.id_cliente = Ventas.id_cliente;





--Clientes sin ventas

SELECT
    Clientes.nombre,
    Clientes.email,
    Clientes.fecha_registro
FROM Clientes 
LEFT JOIN Ventas
ON Clientes.id_cliente = Ventas.id_cliente
WHERE Ventas.id_venta IS NULL




--Productos sin ventas

SELECT 
    Productos.nombre_producto,
    Categorias.nombre_categoria,
    Productos.precio
FROM Productos
LEFT JOIN Ventas
    ON Productos.id_producto = Ventas.id_producto
INNER JOIN Categorias
    ON Productos.id_categoria = Categorias.id_categoria
WHERE Ventas.id_venta IS NULL;






--Consolidado por canal , al no tener tablas o columnas de canales de ventas , 
--cree mi propio criterio para definir cuales eran online y cuales precenciales para resolver este jercicio


SELECT 
    canal,
    SUM(total_venta) AS total
FROM (
    SELECT 
        cantidad * precio_unitario AS total_venta,
        'Online' AS canal
    FROM Ventas
    WHERE id_venta <= 5

    UNION ALL

    SELECT 
        cantidad * precio_unitario AS total_venta,
        'Presencial' AS canal
    FROM Ventas
    WHERE id_venta > 5
) AS ventas_consolidadas
GROUP BY canal;