/*-- - - - - - ANULAR - DEVOLUCION DE MEDICAMENTOS - - - - */
SELECT * 
/*delete d.* */
from devoluciones_ciclo d 
where d.codigo_ciclo = '11' and d.codigo_gestion = '1014' and d.codigo_visitador='1439' and d.tipo_devolucion=1;

SELECT dd.codigo_material, dd.cantidad_devolucion
/*DELETE dd.* */
from devoluciones_ciclo d, devoluciones_ciclodetalle dd 
where d.codigo_devolucion = dd.codigo_devolucion 
and d.codigo_ciclo = '11' and d.codigo_gestion = '1014' and      
d.codigo_visitador = '1439';
