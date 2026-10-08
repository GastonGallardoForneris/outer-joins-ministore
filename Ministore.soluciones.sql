-- ══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- Autor: [Tu nombre]
-- Fecha: [Fecha de entrega]
-- ══════════════════════════════════════════

-- ── CONSULTA 1: LEFT JOIN ─────────────────
-- Pregunta de negocio: ¿Qué productos del catálogo nunca fueron vendidos?
-- Mostrá todos los productos y sus ventas asociadas.
-- Los productos sin ventas aparecerán con NULL en las columnas de ventas.

-- [Tu consulta aquí]

SELECT 
    p.producto_id,
    p.nombre,
    p.categoria,
    p.precio
FROM productos p
LEFT JOIN ventas v ON p.producto_id = v.producto_id
WHERE v.venta_id IS NULL;

-- ── CONSULTA 2: RIGHT JOIN ────────────────
-- Pregunta de negocio: ¿Existen ventas registradas con productos
-- que no figuran en nuestro catálogo? (posible error de carga de datos)
-- Los registros huérfanos aparecerán con NULL en las columnas de productos.

-- [Tu consulta aquí]

SELECT 
    v.venta_id,
    v.producto_id AS id_en_venta,
    v.cantidad,
    v.fecha_venta,
    p.nombre
FROM productos p
RIGHT JOIN ventas v ON p.producto_id = v.producto_id
WHERE p.producto_id IS NULL
;

-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Pregunta de negocio: Vista completa de auditoría que muestre
-- todos los productos y todas las ventas sin perder ninguna fila,
-- identificando tanto productos sin ventas como ventas sin producto.

-- [Tu consulta aquí]

-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Pregunta de negocio:
-- Vista completa de auditoría que muestre todos los productos
-- y todas las ventas sin perder ninguna fila.

SELECT
    p.producto_id,
    p.nombre,
    p.categoria,
    p.precio,
    v.venta_id,
    v.cliente_id,
    v.cantidad,
    v.fecha_venta
FROM productos p
FULL OUTER JOIN ventas v
    ON p.producto_id = v.producto_id
