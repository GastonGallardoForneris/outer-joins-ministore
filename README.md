# outer-joins-ministore

¿Por qué usaste LEFT JOIN para la Consulta 1 y no INNER JOIN? ¿Qué se perdería si usaras INNER JOIN?

Utilicé `LEFT JOIN` porque necesitaba identificar todos los productos del catálogo, incluyendo aquellos que nunca fueron vendidos. De esta manera, los productos que no tienen ninguna venta asociada aparecen igualmente en el resultado.

Si hubiese utilizado `INNER JOIN`, solo se mostrarían los productos que tienen al menos una venta, por lo que los productos 108 y 109, que nunca fueron vendidos, quedarían fuera del resultado y no podríamos identificarlos.

¿Por qué usaste RIGHT JOIN para la Consulta 2? ¿Qué tabla está a la izquierda y cuál a la derecha en tu consulta?

Utilicé `RIGHT JOIN` porque necesitaba identificar las ventas cuyo producto no aparece en el catálogo. En la consulta, la tabla `productos` se encuentra a la izquierda y la tabla `ventas` a la derecha. Al utilizar `RIGHT JOIN`, se conservan todas las ventas, incluso aquellas que no tienen un producto correspondiente en el catálogo. Esto permite identificar la venta con `producto_id = 999`, que no existe en la tabla de productos.

¿Qué representan los valores NULL en cada resultado? Explicá con un ejemplo concreto de los datos qué significa que venta_id sea NULL en la Consulta 1 y que producto_id de productos sea NULL en la Consulta 2.

En la Consulta 1, un `NULL` en `venta_id` significa que el producto existe en el catálogo, pero no tiene ninguna venta asociada. Por ejemplo, los productos 108 y 109 aparecen en la tabla `productos`, pero no existe ningún registro en `ventas` relacionado con ellos.

En la Consulta 2, un `NULL` en `producto_id` de la tabla `productos` significa que existe una venta cuyo producto no se encuentra registrado en el catálogo. Por ejemplo, la venta 10 tiene `producto_id = 999`, pero no existe un producto con ese ID en la tabla `productos`. Esto podría indicar un error en la carga o en la integridad de los datos.


¿Cuándo usarías FULL OUTER JOIN en un caso real de negocio?

En un caso real de negocio utilizaría un `FULL OUTER JOIN` para comparar dos tablas y detectar registros que existen en una de ellas pero no tienen correspondencia en la otra. Por ejemplo, en una peluquería podría utilizarlo para comparar la base de datos de clientes con el registro de servicios. Esto permitiría identificar clientes registrados que no tienen servicios asociados y también servicios registrados que no tienen un cliente correspondiente. De esta manera, se pueden detectar datos faltantes o posibles errores de registro y mejorar la calidad de la información.
