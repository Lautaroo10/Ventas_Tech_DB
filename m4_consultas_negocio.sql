--Nos ubicamos en la tabla que vamos a trabajar

select * from Ventas ; 


--Resumen ejecutivo mensual

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado_mensual,
    COUNT(*) AS cantidad_pedidos_mensual,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM Ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

-- Ranking de productos

SELECT TOP 5
    id_producto,
    SUM(cantidad) as cantidades_vendidad,
    SUM(cantidad*precio_unitario) as total_facturado from ventas 
    group by (id_producto)
    order by  total_facturado DESC ;


--Clientes recurrentes 

SELECT 
    id_cliente , 
    COUNT(*) AS cantidad_pedidos ,
    SUM(cantidad*precio_unitario) AS total_facturado
    FROM ventas 
    GROUP BY (id_cliente) 
    HAVING COUNT(*) > 1 ;


--Meses por encima/por debajo del promedio
SELECT 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE
        WHEN SUM(cantidad * precio_unitario) > (
            SELECT AVG(total_mensual)
            FROM (
                SELECT 
                    MONTH(fecha_venta) AS mes,
                    SUM(cantidad * precio_unitario) AS total_mensual
                FROM Ventas
                GROUP BY MONTH(fecha_venta)
            ) AS ventas_mensuales
        )
        THEN 'Por encima'

        WHEN SUM(cantidad * precio_unitario) = (
            SELECT AVG(total_mensual)
            FROM (
                SELECT 
                    MONTH(fecha_venta) AS mes,
                    SUM(cantidad * precio_unitario) AS total_mensual
                FROM Ventas
                GROUP BY MONTH(fecha_venta)
            ) AS ventas_mensuales
        )
        THEN 'Igual'

        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM Ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;



-- El producto 1 concentra un 55,86% de las ventas del mes 
-- El producto 2 fue el producto mas vendido en el mes con 13 unidades
-- EL ticket promedio de compra en el mes fue de $644,40